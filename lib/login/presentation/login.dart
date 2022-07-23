import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safariweb/admin/my_page.dart';
import 'package:safariweb/airlines/airline_page.dart';
import 'package:safariweb/car/car_page.dart';
import 'package:safariweb/homeweb.dart';
import 'package:safariweb/admin/add/MyComment.dart';
import 'package:safariweb/hotel/hotel_page.dart';
import 'package:safariweb/login/bloc/Cubit_Login.dart';
import 'package:safariweb/login/bloc/States_Login.dart';
import 'package:safariweb/login/datalayer/Login_Model.dart';
import 'package:safariweb/login/datalayer/Login_Repository.dart';
import 'package:safariweb/restaurant/rest_page.dart';
import 'package:safariweb/touristoffice/tourist_page.dart';
import 'package:safariweb/places/places_page.dart';



class myLogin extends StatefulWidget {
  @override
  State<myLogin> createState() => _myLoginState();
}

class _myLoginState extends State<myLogin> {
  final formKey = GlobalKey<FormState>();

  var passoredcontroller = TextEditingController();

  var emailcontroller = TextEditingController();

  bool obscureText = true;

  LoginModel loginModel = LoginModel();

  late final LoginRepository loginRepository;

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context){
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(LoginInitState()),
      child:Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // leading: DrawerWidget(),
        ),
        body: Center(
          child: SafeArea(

            child: SingleChildScrollView(

              child:   Form(

                key: formKey,

                child: Column(

                  children: [

                    Container(

                      child:  BlocConsumer<LoginCubit,LoginState>(

                          listener:(context, state) {

                            if(state is AdminLoadingSucceccState)

                              Navigator.push(context , MaterialPageRoute(builder: (context) => MuPage()));
                              //admin=>MuPage()
                              //airline=>AirLinePage()
                              //car=>CarPage()
                              //hotel=>HoltePage()
                              //restaurant=>RestPage()
                              //tourist=>TouristOffice()
                              //places=>PlacesPage()

                            if (state is LoadingErrorState)

                              ScaffoldMessenger.of(context).showSnackBar(

                                  SnackBar(content: Text(state.message)));

                          },builder: (context,state){

                        if(state is LoginLoading)

                          return Center(
                            child: CircularProgressIndicator(),
                          );
                            // LoadingWidget();



                        // if (state is LoadingErrorState)

                        //    return Center(child: Text(state.message));



                        else

                          return Column(

                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: [

                              SizedBox(

                                height: 5.0,

                              ),

                              Text(

                                // S.of(context).pageLogin,
                                "Login",

                                style: Theme.of(context).textTheme.headline1,

                              ),



                              SizedBox(

                                height: 5.0,

                              ),



                              Email(),

                              SizedBox(

                                height: 10,

                              ),

                              password(),



                              SizedBox(

                                height: 30,

                              ),

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
                                    if (formKey.currentState!.validate())
                                    {
                                      Navigator.push(context,
                                        MaterialPageRoute(builder: (context)=>(MuPage()),
                                         //admin=>MuPage()
                                         //airline=>AirLinePage()
                                         //car=>CarPage()
                                         //hotel=>HoltePage()
                                         //restaurant=>RestPage()
                                         //tourist=>TouristOffice()
                                         //places=>PlacesPage()
                                        ),
                                      );
                                    }

                                   

                                  },

                                  child: Text(

                                    "LOGIN",

                                    style: TextStyle(color: Colors.white),

                                  ),

                                ),

                              ),

                              SizedBox(height: 50,),
                           
                            ],

                          );
                      }),
                    ),
                  ],

                ),

              ),

            ),

          ),
        ),



      ),

    );

  }
  _outlineBorder({Color? borderColor}) {
    if (borderColor == null)
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
      );
    else
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: borderColor),
      );
  }
  Widget Email(){

    return Container(
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
        controller: emailcontroller,
        keyboardType: TextInputType.emailAddress,

        cursorColor: Color(0xffF5591F),

        onFieldSubmitted: (value){
          print(value);
        },

        validator: (value){
          if(value!.isEmpty||!value.contains('@')||!value.contains('.com')){
            return "email must not be empty";
          }
          return null;
        },


        decoration: InputDecoration(
          icon: Icon(
            Icons.email,
            color: Color(0xffef9b0f),
          ),

          hintText: "enter email",
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );

  }
  Widget password(){
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      padding: EdgeInsets.only(left: 20, right: 20),
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Color(0xffEEEEEE),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 20),
              blurRadius: 100,
              color: Color(0xffEEEEEE)          ),
        ],
      ),
      child: TextFormField(
        controller: passoredcontroller,
        obscureText: obscureText,
        keyboardType: TextInputType.visiblePassword,

        cursorColor: Color(0xffF5591F),
        decoration: InputDecoration(
          focusColor: Color(0xffF5591F),
          icon: Icon(
            Icons.vpn_key,
            color: Color(0xffef9b0f),
          ),
          hintText: "Enter Password",

          suffixIcon: IconButton(
            onPressed: (){
              setState(() {
                obscureText =  !obscureText;
              });
            },
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: Color(0xffef9b0f),
            ),
          ),
        ),
        onFieldSubmitted: (value){
          print(value);
        },
        validator: (value){
          if(value!.isEmpty){
            return "password must not be empty";

          }
          return null;
        },
      ),
      // enabledBorder: InputBorder.none,
      //   focusedBorder: InputBorder.none,
    );

  }
}

