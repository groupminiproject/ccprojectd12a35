import 'package:amplify_core/amplify_core.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:photohub/services/getcurrentuser.dart';

import '../../models/User.dart';
import '../../services/uploadtoS3.dart';
import '../add_Image_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<IconData> iconList = [Iconsax.home, Iconsax.gallery];
  final activeNavigationBarColor = Colors.deepPurpleAccent;
  final notActiveNavigationBarColor = Colors.black;
  int _bottomNavIndex = 0;
  String _uploadFileResult = '';
  bool _isLoading = false;
  AuthUser? user;
  String _removeResult = '';
  List<String> urls = [];

  void createUser(User user) async {
    await AuthServices().createUser(user);
  }

  Future<void> getCurrentUser() async {
    setState(() {
      _isLoading = true;
    });
    try {
      // Retrieve the currently signed-in user
      AuthUser authUser = await Amplify.Auth.getCurrentUser();

      // Retrieve user attributes (including name and email)

      user = authUser;
      String email = '';
      List userAttributes = await Amplify.Auth.fetchUserAttributes();
      print(userAttributes[2].value);
      setState(() {
        email = userAttributes[2].value.toString();
      });
      User createduser =
          User(id: email, username: authUser.username, email: email);
      createUser(createduser);
    } catch (e) {
      print('Error getting current user: $e');
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  List pages = [UserDetailsScreen(), MyImagesScreen()];
  Future<void> _signOut() async {
    try {
      // Perform the sign-out operation using Amplify Auth
      await Amplify.Auth.signOut();

      // Navigate to the sign-in screen or any other desired screen
      // For example, you can use Navigator to navigate to the sign-in screen
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    _signOut();
                  },
                  icon: Icon(Iconsax.logout))
            ],
            title: Text('PhotoHub'),
          ),
          floatingActionButton: FloatingActionButton(
            shape: CircleBorder(),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return AddImageScreen(
                  user: user!,
                );
              }));
              // _uploadImage();
            },
            child: Tooltip(message: 'Upload an image', child: Icon(Icons.add)),
            //params
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: iconList.length,
            tabBuilder: (int index, bool isActive) {
              return Icon(
                iconList[index],
                size: 24,
                color: isActive
                    ? activeNavigationBarColor
                    : notActiveNavigationBarColor,
              );
            },
            activeIndex: _bottomNavIndex,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.verySmoothEdge,
            leftCornerRadius: 25,
            rightCornerRadius: 25,
            onTap: (index) => setState(() => _bottomNavIndex = index),
            //other params
          ),
          body: (_isLoading)
              ? Center(
                  child: const CircularProgressIndicator(),
                )
              : pages[_bottomNavIndex]),
    );
  }
}

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home 1'),
    );
  }
}

class MyImagesScreen extends StatefulWidget {
  const MyImagesScreen({super.key});

  @override
  State<MyImagesScreen> createState() => _MyImagesScreenState();
}

class _MyImagesScreenState extends State<MyImagesScreen> {
  List<Map<String, dynamic>> images = [
    {
      'url':
          'https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg?cs=srgb&dl=pexels-pixabay-56866.jpg&fm=jpg',
      'name': 'first'
    },
    {
      'url':
          'https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg?cs=srgb&dl=pexels-pixabay-56866.jpg&fm=jpg',
      'name': "second"
    },
    {
      'url':
          'https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg?cs=srgb&dl=pexels-pixabay-56866.jpg&fm=jpg',
      'name': "second"
    },
  ];
  bool _isLoading = false;
  void getImages() async {
    setState(() {
      _isLoading = true;
    });
    images = await AwsServices().fetchImages();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getImages();
  }

  var url =
      'https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg?cs=srgb&dl=pexels-pixabay-56866.jpg&fm=jpg';
  @override
  Widget build(BuildContext context) {
    return (_isLoading || images.isEmpty)
        ? Center(
            child: const CircularProgressIndicator(),
          )
        : Container(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return BuildImageTile(
                  image: images[index],
                  callback: () {
                    print('w  ');
                  },
                );
              },
              itemCount: images.length,
            ),
          );
  }
}

class BuildImageTile extends StatelessWidget {
  const BuildImageTile({
    super.key,
    required this.image,
    required this.callback,
  });
  final VoidCallback callback;
  final Map<String, dynamic> image;
  final url =
      'https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg?cs=srgb&dl=pexels-pixabay-56866.jpg&fm=jpg';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.deepPurple,
      ),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: callback,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    image['name'],
                    style: GoogleFonts.getFont('Poppins', fontSize: 18),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(url), fit: BoxFit.cover),
                    color: Colors.black,
                  ),
                  width: double.infinity,
                  height: 200,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
