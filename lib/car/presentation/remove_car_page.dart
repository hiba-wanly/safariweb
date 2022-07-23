import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safariweb/car/bloc/car_cubit.dart';
import 'package:safariweb/car/bloc/car_states.dart';

class RemoveCar extends StatefulWidget {
  const RemoveCar({Key? key}) : super(key: key);

  @override
  State<RemoveCar> createState() => _RemoveCarState();
}

class _RemoveCarState extends State<RemoveCar> {
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