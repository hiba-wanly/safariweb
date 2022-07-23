import 'dart:io';

import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safariweb/hotel/bloc/hotel_cubit.dart';
import 'package:safariweb/hotel/bloc/hotel_states.dart';
import 'package:safariweb/places/bloc/places_cubit.dart';
import 'package:safariweb/places/bloc/places_states.dart';
import 'package:safariweb/places/datalayer/places_model.dart';
import 'package:safariweb/places/places_page.dart';


class AddPlaces extends StatefulWidget {

  AddPlaces({Key? key}) : super(key: key);

  @override
  State<AddPlaces> createState() => _AddPlacesState();
}

class _AddPlacesState extends State<AddPlaces> {


  double ? height,width;

  var namecontroller = TextEditingController();
  var descriptioncontroller = TextEditingController();
  var placeController = TextEditingController();
  var meridianController = TextEditingController();
  var latitudesController = TextEditingController();
  var starscontroller = TextEditingController();
   var fromdaycontroller = TextEditingController();
  var todayController = TextEditingController();
  var fromtimeController = TextEditingController();
  var totimeController = TextEditingController();
  var pricecontroller = TextEditingController();

  TimeOfDay time1 = TimeOfDay(hour: 10,minute: 30);

  TimeOfDay time2 = TimeOfDay(hour: 10,minute: 30);


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


  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
return BlocProvider(
      create: (BuildContext context) => PlacesCubit(PlacesInitState()), 
      child: BlocConsumer<PlacesCubit,PlacesState>(
        listener: (context, state){
          if(state is PlacesLoadingSuccessState){
            Navigator.push(context , MaterialPageRoute(builder: (context) => PlacesPage()));
          }
          if (state is PlacesLoadingErrorState){
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)));}
        },
        builder: (context,state){
          if(state is PlacesLoading){
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

                          image: AssetImage("images/place1.jpg",),
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
                                controller: placeController,
                                keyboardType: TextInputType.text,
                                cursorColor: Color(0xffF5591F),
                                onFieldSubmitted: (value){
                                  print(value);
                                },
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "place must not be empty";//S.of(context).pageEmailAddress;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.place,
                                    color: Color(0xffef9b0f),
                                  ),
                                  hintText: "place ",//S.of(context).pageEnterEmail,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),

                            //checkin
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
                                controller: meridianController,
                                keyboardType: TextInputType.number,
                                cursorColor: Color(0xffF5591F),
                                onFieldSubmitted: (value){
                                  print(value);
                                },
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "meridian in must not be empty";//S.of(context).pageEmailAddress;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.edit,
                                    color: Color(0xffef9b0f),
                                  ),
                                  hintText: "meridian",//S.of(context).pageEnterEmail,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(height: 0,),
                            //checkout
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
                                controller: latitudesController,
                                keyboardType: TextInputType.number,
                                cursorColor: Color(0xffF5591F),
                                onFieldSubmitted: (value){
                                  print(value);
                                },
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "latitudes must not be empty";//S.of(context).pageEmailAddress;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.edit,
                                    color: Color(0xffef9b0f),
                                  ),
                                  hintText: "latitudes ",//S.of(context).pageEnterEmail,
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
                                controller: starscontroller,
                                keyboardType: TextInputType.number,
                                cursorColor: Color(0xffF5591F),
                                onFieldSubmitted: (value){
                                  print(value);
                                },
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "star must not be empty";//S.of(context).pageEmailAddress;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.stars,
                                    color: Color(0xffef9b0f),
                                  ),
                                  hintText: "stars  ",//S.of(context).pageEnterEmail,
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
                                controller: fromdaycontroller,
                                keyboardType: TextInputType.text,
                                cursorColor: Color(0xffF5591F),
                                onFieldSubmitted: (value){
                                  print(value);
                                },
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "fromday must not be empty";//S.of(context).pageEmailAddress;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.edit,
                                    color: Color(0xffef9b0f),
                                  ),
                                  hintText: "fromday ",//S.of(context).pageEnterEmail,
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
                                controller: todayController,
                                keyboardType: TextInputType.text,
                                cursorColor: Color(0xffF5591F),
                                onFieldSubmitted: (value){
                                  print(value);
                                },
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "today must not be empty";//S.of(context).pageEmailAddress;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.edit,
                                    color: Color(0xffef9b0f),
                                  ),
                                  hintText: "today ",//S.of(context).pageEnterEmail,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            // SizedBox(height: 10,),
                            // Column(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children:[
                            //     Text(
                            //       '${time1.hour}:${time1.minute}',
                            //     ),
                            //      ElevatedButton(
                            //   onPressed: ()async {
                            //     TimeOfDay? timefrom = await showTimePicker(
                            //   context: context, 
                            //   initialTime: time1,
                            //   );
                            //   if(timefrom == null)return;
                            //   setState(() {
                            //     time1=timefrom;
                            //   });
                            //   }, 
                            //   child: Text(
                            //     'Select Timefrom',
                            //   ),
                            //   ),
                            //   ],
                            // ),
                             
                            //    Column(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children:[
                            //     Text(
                            //       '${time2.hour}:${time2.minute}',
                            //     ),
                            //      ElevatedButton(
                            //   onPressed: ()async {
                            //     TimeOfDay? timeto = await showTimePicker(
                            //   context: context, 
                            //   initialTime: time1,
                            //   );
                            //   if(timeto == null)return;
                            //   setState(() {
                            //     time2=timeto;
                            //   });
                            //   }, 
                            //   child: Text(
                            //     'Select Timeto',
                            //   ),
                            //   ),
                            //   ],
                            // ),
                             

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
                                controller: fromtimeController,
                                keyboardType: TextInputType.number,
                                cursorColor: Color(0xffF5591F),
                                onFieldSubmitted: (value){
                                  print(value);
                                },
                                validator: (value){
                                  if(value!.isEmpty){
                                    return " fromtime must not be empty";//S.of(context).pageEmailAddress;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.timer,
                                    color: Color(0xffef9b0f),
                                  ),
                                  hintText: " fromtime ",//S.of(context).pageEnterEmail,
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
                                controller: totimeController,
                                keyboardType: TextInputType.number,
                                cursorColor: Color(0xffF5591F),
                                onFieldSubmitted: (value){
                                  print(value);
                                },
                                validator: (value){
                                  if(value!.isEmpty){
                                    return " totime must not be empty";//S.of(context).pageEmailAddress;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.timer,
                                    color: Color(0xffef9b0f),
                                  ),
                                  hintText: " totime ",//S.of(context).pageEnterEmail,
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
                                controller: pricecontroller,
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
                                    Icons.money,
                                    color: Color(0xffef9b0f),
                                  ),
                                  hintText: "price ",//S.of(context).pageEnterEmail,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(height: 5,),
                            //images
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

                                    AddPlacesModel add = AddPlacesModel(
                                      name: namecontroller.text,
                                      description: descriptioncontroller.text,
                                      city: placeController.text,
                                      meridian: double.parse(meridianController.text),
                                      latitudes: double.parse(latitudesController.text),
                                      stars: int.parse(starscontroller.text),
                                      fromday: fromdaycontroller.text,
                                      today: todayController.text,
                                      fromtime: double.parse(fromtimeController.text),//double.parse(time1.Text),
                                      totime: double.parse(totimeController.text),//double.parse(time2.toString()),
                                      price: double.parse(pricecontroller.text),
                                      img1: Image,
                                      img2: Image2,
                                      img3: Image3,
                                    );
                                    PlacesCubit.get(context).AddPlacesRequest(add);
                                    print("success");
                                    

                                  };


                                },

                                child: Text(

                                  "ADD PLACE",

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
