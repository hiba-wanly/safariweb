import 'dart:io';

import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safariweb/admin/add/bloc/cubit_bloc.dart';
import 'package:safariweb/admin/add/bloc/states_bloc.dart';
import 'package:safariweb/admin/add/datalayer/model_add.dart';
import 'package:safariweb/admin/my_page.dart';
import 'package:safariweb/homeweb.dart';


class AddPageOffice extends StatefulWidget {

  AddPageOffice({Key? key}) : super(key: key);

  @override
  State<AddPageOffice> createState() => _AddPageOfficeState();
}

class _AddPageOfficeState extends State<AddPageOffice> {


  double ? height,width;

  var namecontroller = TextEditingController();

  var descriptioncontroller = TextEditingController();

  var meridiancontroller = TextEditingController();

  var latitudescontroller = TextEditingController();

  var locationcontroller = TextEditingController();

  var phonecontroller = TextEditingController();

  var starscontroller = TextEditingController();

  var countrycontroller = TextEditingController();

  var citycontroller = TextEditingController();

  var typeofofficecontroller = TextEditingController();


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
      create: (BuildContext context) => AddCubit(AddInitState()),
      child: BlocConsumer<AddCubit,AddState>(
        listener: (context, state){
          if(state is AddLoadedState)
            Navigator.push(context , MaterialPageRoute(builder: (context) => MuPage()));
          if (state is LoadingErrorState)
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)));
        },
        builder: (context,state) {
          if(state is AddLoadingState)
            return Center(
              child: CircularProgressIndicator(),
            );
          else return Scaffold(

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

                          image: AssetImage("images/photo_web.jpg",),
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
                                controller: typeofofficecontroller,
                                keyboardType: TextInputType.name,
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
                                    Icons.edit,
                                    color: Color(0xffef9b0f),
                                  ),
                                  hintText: "type of office ",//S.of(context).pageEnterEmail,
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
                                controller: phonecontroller,
                                keyboardType: TextInputType.phone,
                                cursorColor: Color(0xffF5591F),
                                onFieldSubmitted: (value){
                                  print(value);
                                },
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "phone must not be empty";//S.of(context).pageEmailAddress;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.phone,
                                    color: Color(0xffef9b0f),
                                  ),
                                  hintText: "phone ",//S.of(context).pageEnterEmail,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                           
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
                                    return "stars must not be empty";//S.of(context).pageEmailAddress;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.star,
                                    color: Color(0xffef9b0f),
                                  ),
                                  hintText: "stars ",//S.of(context).pageEnterEmail,
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
                                controller: locationcontroller,
                                keyboardType: TextInputType.text,
                                cursorColor: Color(0xffF5591F),
                                onFieldSubmitted: (value){
                                  print(value);
                                },
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "location must not be empty";//S.of(context).pageEmailAddress;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.place,
                                    color: Color(0xffef9b0f),
                                  ),
                                  hintText: "location ",//S.of(context).pageEnterEmail,
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
                                controller: meridiancontroller,
                                keyboardType: TextInputType.number,
                                cursorColor: Color(0xffF5591F),
                                onFieldSubmitted: (value){
                                  print(value);
                                },
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "meridian must not be empty";//S.of(context).pageEmailAddress;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.place,
                                    color: Color(0xffef9b0f),
                                  ),
                                  hintText: "meridian ",//S.of(context).pageEnterEmail,
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
                                controller: latitudescontroller,
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
                                    Icons.place,
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
                                controller: countrycontroller,
                                keyboardType: TextInputType.text,
                                cursorColor: Color(0xffF5591F),
                                onFieldSubmitted: (value){
                                  print(value);
                                },
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "country must not be empty";//S.of(context).pageEmailAddress;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.place,
                                    color: Color(0xffef9b0f),
                                  ),
                                  hintText: "country ",//S.of(context).pageEnterEmail,
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
                                controller: citycontroller,
                                keyboardType: TextInputType.text,
                                cursorColor: Color(0xffF5591F),
                                onFieldSubmitted: (value){
                                  print(value);
                                },
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "city must not be empty";//S.of(context).pageEmailAddress;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.place,
                                    color: Color(0xffef9b0f),
                                  ),
                                  hintText: "city ",//S.of(context).pageEnterEmail,
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
