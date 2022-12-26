import 'dart:convert';
import 'package:kodra/app/data/models/address_model.dart';
import 'package:kodra/app/data/models/payment_response.dart';
import 'package:kodra/app_constant.dart';
import 'package:get/get.dart';
import 'package:kodra/app/data/services/network_service.dart/dio_network_service.dart';
import 'package:http/http.dart' as http;


class AddAddressApis {
  Future<bool> addAddress(String address,double latitude,double longitude)async{
    final request = NetworkRequest(
      type: NetworkRequestType.POST,
      path: '/address/token/data.json',
      data: NetworkRequestBody.json(
          {
            'addressTitle':address,
            'latitude':latitude,
            'longitude':longitude,
            'status':true
          }
      ),
    );


    NetworkResponse response = await networkService.execute(
        request,
        PaymentResponse.fromJson);
    response.maybeWhen(
        ok: (data) {
          return true;
        },
        noData: (info) {
          return null;
        },
        orElse: () {});
    return true;
  }

  Future<List<Address>?> getAddress() async {
    List<Address>? adddresList = [];
    try {

      var response =
      await http.get(Uri.parse('$baseUrl/address/token.json'));
      Get.log('error'+ response.body.toString()+response.statusCode.toString());
      if (response.statusCode == 200) {
        Map<String,dynamic> result =
        json.decode(response.body) as Map<String,dynamic>;
        result.forEach((key, value) {
          value.forEach((key,val){
            Address model=Address.fromJson(val);
            adddresList.add(model);
          });
        });

      } else {
        Get.log('error');
      }
    } catch (err) {
      Get.log('error'+err.toString());
    }
    return adddresList;
    // final request = NetworkRequest(
    //   type: NetworkRequestType.GET,
    //   path: '/payment/payment/token.json',
    //   data: NetworkRequestBody.json(
    //       {}
    //   ),
    // );
    //
    //
    // NetworkResponse response = await networkService.execute(
    //     request,
    //     Payment.fromJson);
    // response.maybeWhen(
    //     ok: (data) {
    //       paymentList=data.data as List<PaymentModel>;
    //       Get.log('cccccccccccc       '+paymentList!.length.toString());
    //       return paymentList;
    //     },
    //     noData: (info) {
    //       return null;
    //     },
    //     orElse: () {});
    // return paymentList;
  }
}
