import 'dart:io';

import 'package:dio/dio.dart';

class RegisterModel {
  late String Name;
  late String last;
  late String Role;
  late String Phone;
  late String Email;
  late String Password;
   File? Image;

  Future<Map<String, dynamic>>RegisterToJson()async {
    return {
      'firstName': this.Name,
      'lastName': this.last,
      'roleName':this.Role,
      'phone': this.Phone,
      'email': this.Email,
      'password': this.Password,
      if(this.Image!=null)
      'img_url':  await MultipartFile.fromFile(this.Image!.path),

  
      
    };
  }
}
