import 'package:dio/dio.dart';
import 'package:islami/core/remote/apis/end_points.dart';
import 'package:islami/ui/home/tabs/radio/model/reciters_model.dart';

import '../../../ui/home/tabs/radio/model/radio_model.dart';

abstract class ApiManager {
 static final Dio _dio=Dio(
BaseOptions(
  baseUrl: EndPoints.baseUrl
)
);
static Future<RadioModel> getRadios()async{
  final response = await _dio.get(EndPoints.radiosEndPoint) ;
  if(response.statusCode==200){
    return RadioModel.fromJson(response.data);
  }else{
    throw Exception("failed to load radios");
  }
}
static Future<RecitersModel> getReciters()async{
  final response = await _dio.get(EndPoints.recitersEndPoint);
  if(response.statusCode==200){
    return RecitersModel.fromJson(response.data);

  }else{
    throw Exception("failed to load reciters");
  }

}
}