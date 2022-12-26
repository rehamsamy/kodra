
import 'package:kodra/app/data/models/category_items_model.dart';
import 'package:kodra/app/data/models/category_model.dart';
import 'package:kodra/app_constant.dart';
import 'package:get/get.dart';
import 'package:kodra/app/data/services/network_service.dart/dio_network_service.dart';


class CategoryItemsApis {
  Future<List<ProductModel>?> getCategoriesList()async{
    List<ProductModel> products=[];
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
          products = data.productsList;
          return products;
        },
        noData: (info) {
          return null;
        },
        orElse: () {});
    return products;
  }



}
