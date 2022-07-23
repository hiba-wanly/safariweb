import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safariweb/car/bloc/car_cubit.dart';
import 'package:safariweb/car/bloc/car_states.dart';

class EditCar extends StatefulWidget {
  const EditCar({Key? key}) : super(key: key);

  @override
  State<EditCar> createState() => _EditCarState();
}

class _EditCarState extends State<EditCar> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CarCubit(CarInitState()), 
      child: BlocConsumer<CarCubit,CarState>(
        listener: (context, state){
          if(state is CarLoadingSuccessState){
          }
          if (state is CarLoadingErrorState){
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)));}
        },
        builder: (context,state){
          if(state is CarLoading){
              return Center(
                    child: CircularProgressIndicator(),
                  );
          }
          else
    return Scaffold();
  }
      ),
    );
  }
}