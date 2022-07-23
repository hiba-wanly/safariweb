import 'dart:io';

class AddAIRLine{
  late String name;
  late String From;
  late String To;
  late String description;
  late int Price;
  late String Time;
  late String TakeOff;
  late String Landing;
  // late String departTime;
  late String departDay;
  late String departMonth;
  // late String arriveTime;
  late String arriveDay;
  late String arriveMonth;
  late String airportFrom;
  late String airportTo;
  late String Terminal;
  late String checkin;
  late String Gate;
  late String img1path;
  late File img1;
  late String img2path;
  late File img2;
  late String img3path;
  late File img3;

  AddAIRLine({
    required this.name,
    required this.From,
    required this.To,
    required this.description,
    required this.Price,
    required this.Time,
    required this.TakeOff,
    required this.Landing,
    required this.departDay,
    required this.departMonth,
    required this.arriveDay,
    required this.arriveMonth,
    required this.airportFrom,
    required this.airportTo,
    required this.Terminal,
    required this.checkin,
    required this.Gate,
    required this.img1,
    required this.img2,
    required this.img3
  });
}