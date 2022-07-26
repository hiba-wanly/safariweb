import 'dart:io';

import 'package:dio/dio.dart';

class AddPlacesModel{
  late String name;
  late String description;
  late String city;
  late double meridian;
  late double latitudes;
  late int stars;
  late String fromday;
  late String today;
  late double fromtime;
  late double totime;
  late double price;
  late String img1path;
  late File img1;
  late String img2path;
  late File img2;
  late String img3path;
  late File img3;


  AddPlacesModel({
    required this.name,
    required this.description,
    required this.city,
    required this.meridian,
    required this.latitudes,
    required this.stars,
    required this.fromday,
    required this.today,
    required this.fromtime,
    required this.totime,
    required this.price,
    required this.img1,
    required this.img2,
    required this.img3,
  });

  static String BaseUrl = '';

  AddPlacesModel.fromJson(Map<String, dynamic> json) {

    name = json['name'];
    description = json['description'];
    city = json['city'];
    meridian = json['meridian'];
    latitudes = json['latitudes'];
    stars = json['stars'];
    fromday = json['FromDay'];
    today = json['ToDay'];
    fromtime = json['FromTime'];
    totime = json['ToTime'];
    price = json['price'];
    img1path = BaseUrl + json['Image1'].toString();
    img2path = BaseUrl + json['Image2'].toString();
    img3path = BaseUrl + json['Image3'].toString();
    
  }


   Future<Map<String,dynamic>>toJson() async
  {
    return {
      'name' : this.name,
      'description' : this.description,
      'city' : this.city,
      'meridian' : this.meridian,
      'latitudes' : this.latitudes,
      'stars' : this.stars,
      'FromDay' : this.fromday,
      'ToDay' : this.today,
      'FromTime' : this.fromtime,
      'ToTime' : this.totime,
      'price' : this.price,
      'Image1' : await MultipartFile.fromFile(img1.path),
      'Image2' : await MultipartFile.fromFile(img2.path),
      'Image3' : await MultipartFile.fromFile(img3.path),
      
    };
  }


}