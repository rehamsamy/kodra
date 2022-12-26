
import 'package:kodra/app/data/models/category_items_model.dart';
import 'package:kodra/app/data/models/category_model.dart';
import 'package:kodra/app/data/models/popular_model.dart';
import 'package:kodra/app_constant.dart';
import 'package:get/get.dart';
import 'package:kodra/app/data/services/network_service.dart/dio_network_service.dart';


class PopularApis {
  // Future<List<Popular>?> getPopular()async{
  //   List<Popular> popular=[];
  //   final request = NetworkRequest(
  //     type: NetworkRequestType.GET,
  //     path: '/popular.json',
  //     data: NetworkRequestBody.json(
  //         {}
  //     ),
  //   );
  //
  //
  //   NetworkResponse response = await networkService.execute(
  //     request,
  //     PopularModel.fromJson, // <- Function to convert API response to your model
  //   );
  //   Get.log('ccc '+response.toString());
  //   response.maybeWhen(
  //       ok: (data) {
  //         Get.log('ccc 111 '+data.toString());
  //         popular = data.popular;
  //         return popular;
  //       },
  //       noData: (info) {
  //         return null;
  //       },
  //       orElse: () {});
  //   return popular;
  // }

  Future<List<ProductModel>?> getPopular()async{
    List<ProductModel> popularList=[];
    final request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: '/categoriesItems.json',
      data: NetworkRequestBody.json(
          {}
      ),
    );


    NetworkResponse response = await networkService.execute(
      request,
      CategoryItemsModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(
        ok: (data) {
          popularList = data.productsList;

          // products.map((e) {
          //   if((e.rate??0.0)>4){
          //     Popular popular=Popular(id:e.id,imagePath:e.imagePath,);
          //     popularList.add(popular);
          //   }
          // } ).toList();
          return popularList;
        },
        noData: (info) {
          return null;
        },
        orElse: () {});
    return popularList;
  }

}
