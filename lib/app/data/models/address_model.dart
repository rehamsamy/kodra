import 'package:get/get.dart';
class AddressModel {
  AddressModel({
    this.addressList,
    this.status,});

  AddressModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      addressList = [];
      json['data'].forEach((v) {
        Get.log('data is ==>'+v.toString());
        addressList?.add(Address.fromJson(v));
      });
    }
    status = json['status'];
  }
  List<Address>? addressList;
  bool? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (addressList != null) {
      map['data'] = addressList?.map((v) {
        v.toJson();
      }).toList();
    }
    map['status'] = status;
    return map;
  }

}

class Address {
  Address({
    this.addressTitle,
    this.latitude,
    this.longitude
  });

  Address.fromJson(dynamic json) {
    addressTitle = json['addressTitle'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
  String? addressTitle;
  double? longitude;
  double? latitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['addressTitle'] = addressTitle;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    return map;
  }

}