import 'package:get/get.dart';
class Payment {
  Payment({
      this.data, 
      this.status,});

  Payment.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        Get.log('data is ==>'+v.toString());
        data?.add(PaymentModel.fromJson(v));
      });
    }
    status = json['status'];
  }
  List<PaymentModel>? data;
  bool? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) {
        Get.log('data is ==>'+v.type.toString());
        v.toJson();
        }).toList();
    }
    map['status'] = status;
    return map;
  }

}

class PaymentModel {
  PaymentModel({
      this.id, 
      this.type,});

  PaymentModel.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
  }
  String? id;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    return map;
  }

}