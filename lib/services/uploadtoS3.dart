import 'dart:io';

import 'package:amplify_core/amplify_core.dart';
import 'package:file_picker/file_picker.dart';

class AwsServices {
  Future<File> pickImage() async {
    FilePickerResult? local;
    try {
      local = await FilePicker.platform
          .pickFiles(type: FileType.image, allowMultiple: false);
    } catch (err) {
      print(err.toString());
    }

    return File(local!.files.first.path!);
  }

  Future<String> uploadtoS3(
      {required String username,
      required String fileName,
      required File local}) async {
    String _uploadFileResult = '';
    try {
      print('In upload');

      final key = 'images/$username/$fileName';
      Map<String, String> metadata = <String, String>{};
      metadata['name'] = fileName;
      metadata['desc'] = 'A test file';
      metadata['Content-Type'] = 'image/jpeg';
      StorageUploadFileOptions options = StorageUploadFileOptions(
          accessLevel: StorageAccessLevel.guest, metadata: metadata);
      StorageUploadFileResult result = await Amplify.Storage.uploadFile(
              localFile: AWSFile.fromPath(local.path),
              key: key,
              options: options)
          .result;

      _uploadFileResult = result.uploadedItem.key;
    } catch (e) {
      print('UploadFile Err: ' + e.toString());
    }
    return _uploadFileResult;
  }

  Future<String> getUrl({required String key}) async {
    String _getUrlResult = '';
    try {
      print('In getUrl');

      StorageGetUrlOptions options =
          StorageGetUrlOptions(accessLevel: StorageAccessLevel.guest);
      StorageGetUrlResult result =
          await Amplify.Storage.getUrl(key: key, options: options).result;

      _getUrlResult = result.url.toString();
    } catch (e) {
      print('GetUrl Err: ' + e.toString());
    }
    return _getUrlResult;
  }

  Future<List<Map<String, dynamic>>> fetchImages() async {
    List<Map<String, dynamic>> imageDetails = [];
    try {
      // Retrieve the current user
      AuthUser authUser = await Amplify.Auth.getCurrentUser();

      // Query images uploaded by the current user
      final listResult = await Amplify.Storage.list(
        path:
            'images/${authUser.username}/', // Assuming images are stored in folders by username
      ).result;

      //print(listResult.items.first.key);
      // Extract URLs of images uploaded by the current user

      for (var item in listResult.items) {
        imageDetails
            .add({'url': await getUrl(key: item.key), 'name': item.key});
      }
      // Update state with image URLs
    } catch (e) {
      print('Error fetching images: $e');
    }
    return imageDetails;
  }
}
