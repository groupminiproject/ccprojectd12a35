import 'dart:io';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:photohub/widgets/customTextButton.dart';
import 'package:photohub/widgets/showsnaackbar.dart';

import '../services/uploadtoS3.dart';
import '../widgets/customtextfield.dart';

class AddImageScreen extends StatefulWidget {
  final AuthUser user;
  const AddImageScreen({super.key, required this.user});

  @override
  State<AddImageScreen> createState() => _AddImageScreenState();
}

class _AddImageScreenState extends State<AddImageScreen> {
  File? file;
  bool _isLoading = false;
  void _uploadImage() async {
    setState(() {
      _isLoading = true;
    });
    await AwsServices().uploadtoS3(
        username: widget.user.username,
        fileName: _imageNameController.text.trim(),
        local: file!);
    setState(() {
      _isLoading = false;
    });

    Navigator.of(context).pop();
    displaySnackBar(context: context, content: 'Image uploaded successfully');
  }

  void _pickImages() async {
    file = await AwsServices().pickImage();
    setState(() {});
  }

  final TextEditingController _imageNameController = TextEditingController();
  final _uploadImageKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _imageNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              (file != null)
                  ? Container(
                      margin: EdgeInsets.all(10),
                      width: double.infinity,
                      height: 300,
                      child: Image.file(
                        File(file!.path),
                        fit: BoxFit.contain,
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        _pickImages();
                      },
                      child: Center(
                        child: DottedBorder(
                            dashPattern: [6, 3, 6, 3],
                            borderPadding: EdgeInsets.all(10),
                            borderType: BorderType.RRect,
                            radius: Radius.circular(15),
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height / 4,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.folder),
                                    Text(
                                      widget.user.username,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ),
              Form(
                key: _uploadImageKey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextInputField(
                      textInputAction: TextInputAction.done,
                      controller: _imageNameController,
                      hintText: 'Image Title',
                      keyboardtype: TextInputType.text),
                ),
              ),
              (_isLoading)
                  ? Container(
                      height: 60,
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextButton(
                          buttonTitle: 'Upload Image',
                          callback: () {
                            if (file != null) {
                              if (_uploadImageKey.currentState!.validate()) {
                                _uploadImage();
                              }
                            } else {
                              displaySnackBar(
                                  context: context,
                                  content: 'Select an image !!');
                            }
                          }),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
