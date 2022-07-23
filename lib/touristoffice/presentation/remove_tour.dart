import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safariweb/touristoffice/bloc/tourist_cubit.dart';
import 'package:safariweb/touristoffice/bloc/tourist_states.dart';

class RemoveTour extends StatefulWidget {
  const RemoveTour({Key? key}) : super(key: key);

  @override
  State<RemoveTour> createState() => _RemoveTourState();
}

class _RemoveTourState extends State<RemoveTour> {

final formKey = GlobalKey<FormState>();

var namecomcontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
     return BlocProvider(
      create: (BuildContext context) => TourCubit(TourInitState()), 
      child: BlocConsumer<TourCubit,TourState>(
        listener: (context, state){
          if(state is TourLoadingSuccessState){
          }
          if (state is TourLoadingErrorState){
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)));}
        },
        builder: (context,state){
          if(state is TourLoading){
              return Center(
                    child: CircularProgressIndicator(),
                  );
          }
          else
    return Scaffold(
          body: Form(
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
                          hintText: " name of tour to remove ",//S.of(context).pageEnterEmail,
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
          
                                    "REMOVE",//S.of(context).pageLogin,
          
                                    style: TextStyle(color: Colors.white),
          
                                  ),
          
                                ),
          
                              ),
                              
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

  /// هاد التابع يلي بخلي الحواف مدورة
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

