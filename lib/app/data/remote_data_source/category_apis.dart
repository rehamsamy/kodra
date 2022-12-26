
import 'package:kodra/app/data/models/category_model.dart';
import 'package:kodra/app_constant.dart';
import 'package:get/get.dart';
import 'package:kodra/app/data/services/network_service.dart/dio_network_service.dart';


class CategoryApis {
  Future<List<CategoryItemModel>?> categories()async{
    List<CategoryItemModel> categories=[];
    final request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: '/categories.json',
      data: NetworkRequestBody.json(
        {}
      ),
    );


    NetworkResponse response = await networkService.execute(
      request,
      CategoryModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(
        ok: (data) {
          categories = data.categories;
          return categories;
        },
        noData: (info) {
          return null;
        },
        orElse: () {});
    return categories;
  }



}
