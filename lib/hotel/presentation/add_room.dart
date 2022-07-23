import 'dart:io';

import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safariweb/hotel/bloc/hotel_cubit.dart';
import 'package:safariweb/hotel/bloc/hotel_states.dart';


class AddRoom extends StatefulWidget {

  AddRoom({Key? key}) : super(key: key);

  @override
  State<AddRoom> createState() => _AddRoomState();
}

class _AddRoomState extends State<AddRoom> {


  double ? height,width;

  var namecontroller = TextEditingController();

  var priceController = TextEditingController();

  var descriptioncontroller = TextEditingController();

  var checkinController = TextEditingController();
  var checkoutController = TextEditingController();

  var typecontroller = TextEditingController();

    var numbercontroller = TextEditingController();



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
      create: (BuildContext context) => HotelCubit(HotelInitState()), 
      child: BlocConsumer<HotelCubit,HotelState>(
        listener: (context, state){
          if(state is HotelLoadingSuccessState){
          }
          if (state is HotelLoadingErrorState){
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)));}
        },
        builder: (context,state){
          if(state is HotelLoading){
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

                          image: AssetImage("images/room.jpg",),
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
                                controller: priceController,
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
                                controller: checkinController,
                                keyboardType: TextInputType.text,
                                cursorColor: Color(0xffF5591F),
                                onFieldSubmitted: (value){
                                  print(value);
                                },
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "check in must not be empty";//S.of(context).pageEmailAddress;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.timer,
                                    color: Color(0xffef9b0f),
                                  ),
                                  hintText: "check in",//S.of(context).pageEnterEmail,
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
                                controller: checkoutController,
                                keyboardType: TextInputType.text,
                                cursorColor: Color(0xffF5591F),
                                onFieldSubmitted: (value){
                                  print(value);
                                },
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "checkout must not be empty";//S.of(context).pageEmailAddress;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.timer,
                                    color: Color(0xffef9b0f),
                                  ),
                                  hintText: "check out ",//S.of(context).pageEnterEmail,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(height: 0,),
                            //type
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
                                controller: typecontroller,
                                keyboardType: TextInputType.text,
                                cursorColor: Color(0xffF5591F),
                                onFieldSubmitted: (value){
                                  print(value);
                                },
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "type must not be empty";//S.of(context).pageEmailAddress;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.merge_type,
                                    color: Color(0xffef9b0f),
                                  ),
                                  hintText: "type ",//S.of(context).pageEnterEmail,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(height: 0,),
                            //type
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
                                controller: numbercontroller,
                                keyboardType: TextInputType.number,
                                cursorColor: Color(0xffF5591F),
                                onFieldSubmitted: (value){
                                  print(value);
                                },
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "number must not be empty";//S.of(context).pageEmailAddress;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.numbers,
                                    color: Color(0xffef9b0f),
                                  ),
                                  hintText: "number ",//S.of(context).pageEnterEmail,
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
                                    
                                    print("success");

                                  };


                                },

                                child: Text(

                                  "ADD HOTEL",

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
