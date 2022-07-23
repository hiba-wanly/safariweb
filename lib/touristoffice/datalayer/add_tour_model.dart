import 'dart:io';

class AddTour{
  late String name;
  late String country;
  late int star;
  late int night;
  late int day;
  late int price;
  late int place;
  late String program;
  late String programinclude;
  late int phone1;
  late int phone2;
  late String img1path;
  late File img1;
  late String img2path;
  late File img2;
  late String img3path;
  late File img3;
  late String leaving_date;
  late String returning_date;

  AddTour({
    required this.name,
    required this.country,
    required this.star,
    required this.night,
    required this.day,
    required this.price,
    required this.place,
    required this.program,
    required this.programinclude,
    required this.phone1,
    required this.phone2,
    required this.leaving_date,
    required this.returning_date,
    required this.img1,
    required this.img2,
    required this.img3
  }); 
}

