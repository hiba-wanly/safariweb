import 'dart:io';

class AddRooM{
  late String name;
  late int price;
  late String description;
  late String checkin;
  late String checkout;
  late String type;
  late String img1path;
  late File img1;
  late String img2path;
  late File img2;
  late String img3path;
  late File img3;
  late int number;

  AddRooM({
    required this.name,
    required this.description,
    required this.price,
    required this.checkin,
    required this.checkout,
    required this.type,
    required this.img1,
    required this.img2,
    required this.img3,
    required this.number
  });
}