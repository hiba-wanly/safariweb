import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:safariweb/admin/my_page.dart';
import 'package:safariweb/admin/register/presentation/register_screen.dart';
import 'package:safariweb/airlines/airline_page.dart';
import 'package:safariweb/car/car_page.dart';
import 'package:safariweb/homeweb.dart';
import 'package:safariweb/hotel/hotel_page.dart';
import 'package:safariweb/login/presentation/login.dart';
import 'package:safariweb/admin/add/mycomment.dart';
import 'package:safariweb/places/places_page.dart';
import 'package:safariweb/restaurant/rest_page.dart';
import 'package:safariweb/touristoffice/tourist_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
    primarySwatch: Colors.blue,
    ),
   
    home: PlacesPage(),//const MyHomePage(title: 'Flutter Demo Home Page'),
    );
 

  }
}