import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safariweb/restaurant/bloc/rest_cubit.dart';
import 'package:safariweb/restaurant/bloc/rest_states.dart';

class RemoveRest extends StatefulWidget {
  const RemoveRest({Key? key}) : super(key: key);

  @override
  State<RemoveRest> createState() => _RemoveRestState();
}

class _RemoveRestState extends State<RemoveRest> {
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
    return Scaffold();
  }
      ),
    );
  }
}