import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safariweb/airlines/bloc/airline_cubit.dart';
import 'package:safariweb/airlines/bloc/airline_states.dart';

class EditAirline extends StatefulWidget {
  const EditAirline({Key? key}) : super(key: key);

  @override
  State<EditAirline> createState() => _EditAirlineState();
}

class _EditAirlineState extends State<EditAirline> {
  @override
  Widget build(BuildContext context) {
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
    return Scaffold();
  }
      ),
    );
  }
}