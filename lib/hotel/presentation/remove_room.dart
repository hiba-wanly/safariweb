import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safariweb/hotel/bloc/hotel_cubit.dart';
import 'package:safariweb/hotel/bloc/hotel_states.dart';

class RemoveRoom extends StatefulWidget {
  const RemoveRoom({Key? key}) : super(key: key);

  @override
  State<RemoveRoom> createState() => _RemoveRoomState();
}

class _RemoveRoomState extends State<RemoveRoom> {
  @override
  Widget build(BuildContext context) {
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
    return Scaffold();
  }
      ),
    );
  }
}