import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safariweb/hotel/bloc/hotel_cubit.dart';
import 'package:safariweb/hotel/bloc/hotel_states.dart';

class EditRoom extends StatefulWidget {
  const EditRoom({Key? key}) : super(key: key);

  @override
  State<EditRoom> createState() => _EditRoomState();
}

class _EditRoomState extends State<EditRoom> {
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