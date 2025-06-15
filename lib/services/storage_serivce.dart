import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();

  Future<String?> uploadFile(XFile file, String folder) async {
    try {
      String fileName = '${DateTime.now().millisecondsSinceEpoch}_${file.name}';
      Reference ref = _storage.ref().child('$folder/$fileName');
      
      UploadTask uploadTask = ref.putFile(File(file.path));
      TaskSnapshot snapshot = await uploadTask;
      
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      throw e;
    }
  }

  Future<XFile?> pickImage() async {
    try {
      return await _picker.pickImage(source: ImageSource.gallery);
    } catch (e) {
      throw e;
    }
  }

  Future<XFile?> takePhoto() async {
    try {
      return await _picker.pickImage(source: ImageSource.camera);
    } catch (e) {
      throw e;
    }
  }
}