import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safariweb/restaurant/bloc/rest_cubit.dart';
import 'package:safariweb/restaurant/bloc/rest_states.dart';

class AddRest extends StatefulWidget {
  const AddRest({Key? key}) : super(key: key);

  @override
  State<AddRest> createState() => _AddRestState();
}

class _AddRestState extends State<AddRest> {
  final formKey = GlobalKey<FormState>();

var namecomcontroler = TextEditingController();
var fromcomcontroler = TextEditingController();
var tocomcontroler = TextEditingController();
var fromdaycomcontroler = TextEditingController();
var todaycomcontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RestCubit(RestInitState()), 
      child: BlocConsumer<RestCubit,RestState>(
        listener: (context, state){
          if(state is RestLoadingSuccessState){
          }
          if (state is RestLoadingErrorState){
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)));}
        },
        builder: (context,state){
          if(state is RestLoading){
              return Center(
                    child: CircularProgressIndicator(),
                  );
          }
          else
    return Scaffold(
      body: Column(
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

                           image: AssetImage("images/rest2.jpg",),
                           fit: BoxFit.fitWidth,
                         ),
                       ),
                     ),
               SizedBox(height: 15,), 
               Form(
            key: formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                        controller: namecomcontroler,
                        keyboardType: TextInputType.text,
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
                          hintText: " type food ",//S.of(context).pageEnterEmail,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  SizedBox(
                       height: 10,
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
                        controller: fromcomcontroler,
                        keyboardType: TextInputType.number,
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
                          hintText: " from ",//S.of(context).pageEnterEmail,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  SizedBox(
                       height: 10,
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
                        controller: tocomcontroler,
                        keyboardType: TextInputType.number,
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
                          hintText: " to ",//S.of(context).pageEnterEmail,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  SizedBox(
                       height: 10,
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
                        controller: fromdaycomcontroler,
                        keyboardType: TextInputType.text,
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
                          hintText: " from  day",//S.of(context).pageEnterEmail,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  SizedBox(
                       height: 10,
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
                        controller: todaycomcontroler,
                        keyboardType: TextInputType.text,
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
                          hintText: " to day",//S.of(context).pageEnterEmail,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  SizedBox(
                       height: 10,
                     ),
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
                                     
                                    
                                    };
          
          
                                  },
          
                                  child: Text(
          
                                    "ADD",//S.of(context).pageLogin,
          
                                    style: TextStyle(color: Colors.white),
          
                                  ),
          
                                ),
          
                              ),
                              
                ],
              ),
            ),
          ),
        ],
      ),
      
    );
  }
      ),
    );
  }
}