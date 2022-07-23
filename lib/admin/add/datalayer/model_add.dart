import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DataAdd {

  late String name;
  late String location;
  late String description;
  late double meridian;
  late double latitudes;
  late String phone;
  late String img1path;
  late File img1;
  late String img2path;
  late File img2;
  late String img3path;
  late File img3;
  late String stars;

  
  late String country;
  late String city;

  DataAdd({
    required this.name,
    required this.location,
    required this.description,
    required this.meridian,
    required this.latitudes,
    required this.phone,
    required this.img1,
    required this.img2,
    required this.img3,
    required this.stars,
    required this.country,
    required this.city
  });

}