import 'package:dio/dio.dart';
import 'package:safariweb/places/datalayer/places_model.dart';

class ServicessApi {
  static String BaseUrl = "http://192.168.43.59:8000/api/";
  Dio dio = new Dio(BaseOptions(baseUrl: BaseUrl));

  
  UploadPlacesData(AddPlacesModel dh) async {
    print("here");
    FormData postdata = FormData.fromMap(await dh.toJson());
    try {
      Response response = await dio.post('AddLandmarks',data: postdata);
      print("add data ="+ "${response.data}");
      return 200;
    }
    on DioError catch (e) {
      if(e.response != null){
        print(e.response);
        print("here again");
      }
      else {
        print("error due to sending the request");
      }
      return 400;
    }
  }

  


}