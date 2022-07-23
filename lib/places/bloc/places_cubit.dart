
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safariweb/places/bloc/places_states.dart';
import 'package:safariweb/places/datalayer/add_place_sevice.dart';
import 'package:safariweb/places/datalayer/places_model.dart';
import 'package:safariweb/places/datalayer/places_model.dart';



class PlacesCubit extends Cubit<PlacesState>
{
  PlacesCubit(PlacesState initialState) : super(initialState);

  static PlacesCubit get(context) => BlocProvider.of(context);

  ServicessApi serviceapi = ServicessApi();


  AddPlacesRequest(AddPlacesModel ap) async {
    int state = await serviceapi.UploadPlacesData(ap);
    if(state == 200 ){
      print("200");
      emit(PlacesLoadingSuccessState());
    }
    else {
       emit(PlacesLoadingErrorState(message: "error"));
     }
  }
}