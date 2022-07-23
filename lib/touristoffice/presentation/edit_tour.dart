import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safariweb/touristoffice/bloc/tourist_cubit.dart';
import 'package:safariweb/touristoffice/bloc/tourist_states.dart';

class EditTour extends StatefulWidget {
  const EditTour({Key? key}) : super(key: key);

  @override
  State<EditTour> createState() => _EditTourState();
}

class _EditTourState extends State<EditTour> {
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
    return Scaffold();
  }
      ),
     );
  }
}