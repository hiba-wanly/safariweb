import 'dart:io';

import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safariweb/airlines/bloc/airline_cubit.dart';
import 'package:safariweb/airlines/bloc/airline_states.dart';



class AddAirline extends StatefulWidget {

  AddAirline({Key? key}) : super(key: key);

  @override
  State<AddAirline> createState() => _AddAirlineState();
}

class _AddAirlineState extends State<AddAirline> {


  double ? height,width;

  var namecontroller = TextEditingController();
  var Fromcontroller = TextEditingController();
  var Tocontroller = TextEditingController();

  var Timercontroller = TextEditingController();
  var TakeOffcontroller = TextEditingController();
  var Landingcontroller = TextEditingController();

  var Pricecontroller = TextEditingController();

  var departTimecontroller = TextEditingController();
  var departDaycontroller = TextEditingController();
  var departMonthcontroller = TextEditingController();

  var arriveTimecontroller = TextEditingController();
  var arriveDaycontroller = TextEditingController();
  var arriveMonthcontroller = TextEditingController();

  var airportFromcontroller = TextEditingController();
  var airportTocontroller = TextEditingController();
  var Terminalcontroller = TextEditingController();
  var checkincontroller = TextEditingController();
  var Gatecontroller = TextEditingController();

  var descriptioncontroller = TextEditingController();

  


  final formKey = GlobalKey<FormState>();

  late File Image;

  late File Image2;

  late File Image3;

  final Picker =ImagePicker();

  Future getImage(ImageSource src) async{
    final PickedFile = await Picker.pickImage(source: src);
    setState(() {
      if (PickedFile!=null)
      {
        Image = File(PickedFile.path);
        print("image loaded");
        //UploadImage();

      }
      else
        print("Could not get photo");

    });
  }
  Future getImage1(ImageSource src) async{
    final PickedFile = await Picker.pickImage(source: src);
    setState(() {
      if (PickedFile!=null)
      {
        Image2 = File(PickedFile.path);
        print("image loaded");
        //UploadImage();

      }
      else
        print("Could not get photo");

    });
  }
  Future getImage2(ImageSource src) async{
    final PickedFile = await Picker.pickImage(source: src);
    setState(() {
      if (PickedFile!=null)
      {
        Image3 = File(PickedFile.path);
        print("image loaded");
        //UploadImage();

      }
      else
        print("Could not get photo");

    });
  }

  //
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (BuildContext context) => AirLineCubit(AirInitState()), 
      child: BlocConsumer<AirLineCubit,AirLineState>(
        listener: (context, state){
          if(state is AirLoadingSuccessState){
          }
          if (state is AirLoadingErrorState){
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)));}
        },
        builder: (context,state){
          if(state is AirLoading){
              return Center(
                    child: CircularProgressIndicator(),
                  );
          }
          else
    return Scaffold(

              body: Form(
                key: formKey,
                child: SingleChildScrollView(

                  child: Column(

                    children: [
                      Container(
                        //width: 256,
                        height: 275,
                        // height: height!* .6,
                        //width:width!*90 ,

                        decoration: const BoxDecoration(

                          //borderRadius: BorderRadius.circular(5),
                          color: Colors.white,shape:BoxShape.rectangle,
                          image:  DecorationImage(

                            image: AssetImage("images/plane2.png",),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            children: [
                              SizedBox(height: 0,),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                height: 54,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey[200],
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 50,
                                        color: Color(0xffEEEEEE)
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller: namecontroller,
                                  keyboardType: TextInputType.name,
                                  cursorColor: Color(0xffF5591F),
                                  onFieldSubmitted: (value){
                                    print(value);
                                  },
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "name must not be empty";//S.of(context).pageEmailAddress;
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.edit,
                                      color: Color(0xffef9b0f),
                                    ),
                                    hintText: "name ",//S.of(context).pageEnterEmail,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              //from
                              SizedBox(height: 0,),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                height: 54,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey[200],
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 50,
                                        color: Color(0xffEEEEEE)
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller: Fromcontroller,
                                  keyboardType: TextInputType.name,
                                  cursorColor: Color(0xffF5591F),
                                  onFieldSubmitted: (value){
                                    print(value);
                                  },
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "from must not be empty";//S.of(context).pageEmailAddress;
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.edit,
                                      color: Color(0xffef9b0f),
                                    ),
                                    hintText: "from.. ",//S.of(context).pageEnterEmail,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              //to
                              SizedBox(height: 0,),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                height: 54,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey[200],
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 50,
                                        color: Color(0xffEEEEEE)
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller: Tocontroller,
                                  keyboardType: TextInputType.name,
                                  cursorColor: Color(0xffF5591F),
                                  onFieldSubmitted: (value){
                                    print(value);
                                  },
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "to must not be empty";//S.of(context).pageEmailAddress;
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.edit,
                                      color: Color(0xffef9b0f),
                                    ),
                                    hintText: "To.. ",//S.of(context).pageEnterEmail,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: 0,),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                height: 54,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey[200],
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 50,
                                        color: Color(0xffEEEEEE)
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller: descriptioncontroller,
                                  keyboardType: TextInputType.name,
                                  cursorColor: Color(0xffF5591F),
                                  onFieldSubmitted: (value){
                                    print(value);
                                  },
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "description must not be empty";//S.of(context).pageEmailAddress;
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.edit,
                                      color: Color(0xffef9b0f),
                                    ),
                                    hintText: "description ",//S.of(context).pageEnterEmail,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),

                              SizedBox(height: 0,),

                              //price
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                height: 54,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey[200],
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 50,
                                        color: Color(0xffEEEEEE)
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller: Pricecontroller,
                                  keyboardType: TextInputType.number,
                                  cursorColor: Color(0xffF5591F),
                                  onFieldSubmitted: (value){
                                    print(value);
                                  },
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "price must not be empty";//S.of(context).pageEmailAddress;
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.monetization_on,
                                      color: Color(0xffef9b0f),
                                    ),
                                    hintText: "price ",//S.of(context).pageEnterEmail,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: 0,),
                              //timerdepart
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                height: 54,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey[200],
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 50,
                                        color: Color(0xffEEEEEE)
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller: Timercontroller,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Color(0xffF5591F),
                                  onFieldSubmitted: (value){
                                    print(value);
                                  },
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "timer must not be empty";//S.of(context).pageEmailAddress;
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.timer,
                                      color: Color(0xffef9b0f),
                                    ),
                                    hintText: "timer ",//S.of(context).pageEnterEmail,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: 0,),

                              // take off time
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                height: 54,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey[200],
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 50,
                                        color: Color(0xffEEEEEE)
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller: TakeOffcontroller,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Color(0xffF5591F),
                                  onFieldSubmitted: (value){
                                    print(value);
                                  },
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "take off time must not be empty";//S.of(context).pageEmailAddress;
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.timer,
                                      color: Color(0xffef9b0f),
                                    ),
                                    hintText: "take off time ",//S.of(context).pageEnterEmail,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: 0,),

                              // landing time
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                height: 54,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey[200],
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 50,
                                        color: Color(0xffEEEEEE)
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller: Landingcontroller,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Color(0xffF5591F),
                                  onFieldSubmitted: (value){
                                    print(value);
                                  },
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "landing time must not be empty";//S.of(context).pageEmailAddress;
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.timer,
                                      color: Color(0xffef9b0f),
                                    ),
                                    hintText: "landing ",//S.of(context).pageEnterEmail,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),




                              SizedBox(height: 0,),
//departday
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                height: 54,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey[200],
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 50,
                                        color: Color(0xffEEEEEE)
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller: departDaycontroller,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Color(0xffF5591F),
                                  onFieldSubmitted: (value){
                                    print(value);
                                  },
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "departday must not be empty";//S.of(context).pageEmailAddress;
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.timer,
                                      color: Color(0xffef9b0f),
                                    ),
                                    hintText: "depart Day ",//S.of(context).pageEnterEmail,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: 0,),
                              //departmonth
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                height: 54,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey[200],
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 50,
                                        color: Color(0xffEEEEEE)
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller: departMonthcontroller,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Color(0xffF5591F),
                                  onFieldSubmitted: (value){
                                    print(value);
                                  },
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "departmonth must not be empty";//S.of(context).pageEmailAddress;
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.timer,
                                      color: Color(0xffef9b0f),
                                    ),
                                    hintText: "depart Month ",//S.of(context).pageEnterEmail,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: 0,),
                              SizedBox(height: 0,),
//arriveday
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                height: 54,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey[200],
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 50,
                                        color: Color(0xffEEEEEE)
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller:arriveDaycontroller,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Color(0xffF5591F),
                                  onFieldSubmitted: (value){
                                    print(value);
                                  },
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "arrive day must not be empty";//S.of(context).pageEmailAddress;
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.timer,
                                      color: Color(0xffef9b0f),
                                    ),
                                    hintText: "arrive Day ",//S.of(context).pageEnterEmail,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: 0,),
//arrivemoth
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                height: 54,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey[200],
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 50,
                                        color: Color(0xffEEEEEE)
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller:arriveMonthcontroller,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Color(0xffF5591F),
                                  onFieldSubmitted: (value){
                                    print(value);
                                  },
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "arrive month must not be empty";//S.of(context).pageEmailAddress;
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.timer,
                                      color: Color(0xffef9b0f),
                                    ),
                                    hintText: "arrive Month ",//S.of(context).pageEnterEmail,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: 0,),
//airportFrom
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                height: 54,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey[200],
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 50,
                                        color: Color(0xffEEEEEE)
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller:airportFromcontroller,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Color(0xffF5591F),
                                  onFieldSubmitted: (value){
                                    print(value);
                                  },
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "aairport From must not be empty";//S.of(context).pageEmailAddress;
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.timer,
                                      color: Color(0xffef9b0f),
                                    ),
                                    hintText: "airport From ",//S.of(context).pageEnterEmail,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: 0,),
//airportTo
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                height: 54,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey[200],
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 50,
                                        color: Color(0xffEEEEEE)
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller:airportTocontroller,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Color(0xffF5591F),
                                  onFieldSubmitted: (value){
                                    print(value);
                                  },
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "aairport To must not be empty";//S.of(context).pageEmailAddress;
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.timer,
                                      color: Color(0xffef9b0f),
                                    ),
                                    hintText: "airport To ",//S.of(context).pageEnterEmail,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: 0,),
//terminal
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                height: 54,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey[200],
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 50,
                                        color: Color(0xffEEEEEE)
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller:Terminalcontroller,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Color(0xffF5591F),
                                  onFieldSubmitted: (value){
                                    print(value);
                                  },
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "Terminal To must not be empty";//S.of(context).pageEmailAddress;
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.door_back_door,
                                      color: Color(0xffef9b0f),
                                    ),
                                    hintText: "Terminal ",//S.of(context).pageEnterEmail,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: 0,),
//check in
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                height: 54,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey[200],
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 50,
                                        color: Color(0xffEEEEEE)
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller:checkincontroller,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Color(0xffF5591F),
                                  onFieldSubmitted: (value){
                                    print(value);
                                  },
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "check in To must not be empty";//S.of(context).pageEmailAddress;
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.door_back_door,
                                      color: Color(0xffef9b0f),
                                    ),
                                    hintText: "check in ",//S.of(context).pageEnterEmail,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: 0,),
//gate
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                height: 54,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey[200],
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 50,
                                        color: Color(0xffEEEEEE)
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller:Gatecontroller,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Color(0xffF5591F),
                                  onFieldSubmitted: (value){
                                    print(value);
                                  },
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "Gate To must not be empty";//S.of(context).pageEmailAddress;
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.door_back_door,
                                      color: Color(0xffef9b0f),
                                    ),
                                    hintText: "Gate ",//S.of(context).pageEnterEmail,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),

                            SizedBox(height: 5,),
                              Center(
                                child: MaterialButton(color: Color(0xffef9b0f),
                                    child: Text("Add Image", style:TextStyle(color: Colors.white)),
                                    onPressed: () {
                                      showDialog(context: context, builder: (BuildContext context){  return new AlertDialog(title: Text("Choose Picture From"),
                                        content: Container(height :150,color: Colors.white,child:
                                        Column(children: [
                                          Container(color:Colors.purple,child: ListTile(leading: Icon(Icons.image),title: Text('Gallery'),onTap: ()
                                          {
                                            getImage(ImageSource.gallery);
                                            Navigator.of(context).pop();
                                          },),),
                                          SizedBox(height: 30,),
                                          Container(color: Colors.purple,child: ListTile(leading: Icon(Icons.add_a_photo),title: Text('Camera'),onTap: (){
                                            getImage(ImageSource.camera);
                                            Navigator.of(context).pop();
                                          },),),
                                        ],)),);});}

                                ),),
                              Center(
                                child: MaterialButton(color: Color(0xffef9b0f),
                                    child: Text("Add Image", style:TextStyle(color: Colors.white)),
                                    onPressed: () {
                                      showDialog(context: context, builder: (BuildContext context){  return new AlertDialog(title: Text("Choose Picture From"),
                                        content: Container(height :150,color: Colors.white,child:
                                        Column(children: [
                                          Container(color:Colors.purple,child: ListTile(leading: Icon(Icons.image),title: Text('Gallery'),onTap: ()
                                          {
                                            getImage1(ImageSource.gallery);
                                            Navigator.of(context).pop();
                                          },),),
                                          SizedBox(height: 30,),
                                          Container(color: Colors.purple,child: ListTile(leading: Icon(Icons.add_a_photo),title: Text('Camera'),onTap: (){
                                            getImage1(ImageSource.camera);
                                            Navigator.of(context).pop();
                                          },),),
                                        ],)),);});}

                                ),),
                              Center(
                                child: MaterialButton(color: Color(0xffef9b0f),
                                    child: Text("Add Image", style:TextStyle(color: Colors.white)),
                                    onPressed: () {
                                      showDialog(context: context, builder: (BuildContext context){  return new AlertDialog(title: Text("Choose Picture From"),
                                        content: Container(height :150,color: Colors.white,child:
                                        Column(children: [
                                          Container(color:Colors.purple,child: ListTile(leading: Icon(Icons.image),title: Text('Gallery'),onTap: ()
                                          {
                                            getImage2(ImageSource.gallery);
                                            Navigator.of(context).pop();
                                          },),),
                                          SizedBox(height: 30,),
                                          Container(color: Colors.purple,child: ListTile(leading: Icon(Icons.add_a_photo),title: Text('Camera'),onTap: (){
                                            getImage2(ImageSource.camera);
                                            Navigator.of(context).pop();
                                          },),),
                                        ],)),);});}

                                ),),
                              SizedBox(height: 0,),
                              Container(
                                margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(gradient: LinearGradient(colors: [(new  Color(0xffef9b0f)), new Color(0xffffba00)],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight
                                ),borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 50,
                                        color: Color(0xffEEEEEE)
                                    ),
                                  ],
                                ),
                                //width: double.infinity,
                                child: MaterialButton(
                                  onPressed: (){

                                    if(formKey.currentState!.validate()){
                                   
                                      print("success");
                                    //
                                    };


                                  },

                                  child: Text(

                                    "ADD AIRLINE",

                                    style: TextStyle(color: Colors.white),

                                  ),

                                ),

                              ),
                              SizedBox(height: 25,),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

            );
        }
      ),
    );
          }



  }
