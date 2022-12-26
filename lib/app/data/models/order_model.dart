class OrderModel {
  OrderModel({
      this.address, 
      this.dateTime, 
      this.orderStatus,
      this.statusId,
      this.payment,
      this.latitude,
      this.longitude,
      this.products, 
      this.totalAmount,});

  OrderModel.fromJson(dynamic json) {
    address = json['address'];
    dateTime = json['dateTime'];
    orderStatus = json['order_status'];
    statusId = json['statusId'];
    payment = json['payment'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
    totalAmount = json['totalAmount'];
  }
  String? address;
  String? dateTime;
  String? orderStatus;
  int? statusId;
  String? payment;
  List<Products>? products;
  double? totalAmount;
  double? longitude;
  double? latitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = address;
    map['dateTime'] = dateTime;
    map['order_status'] = orderStatus;
    map['statusId'] = statusId;
    map['payment'] = payment;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['totalAmount'] = totalAmount;
    return map;
  }

}

class Products {
  Products({
      this.caleories, 
      this.price, 
      this.productId, 
      this.productImage, 
      this.productName, 
      this.quantity,});

  Products.fromJson(dynamic json) {
    caleories = json['caleories'];
    price = json['price'];
    productId = json['productId'];
    productImage = json['productImage'];
    productName = json['productName'];
    quantity = json['quantity'];
  }
  int? caleories;
  num? price;
  String? productId;
  String? productImage;
  String? productName;
  int? quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['caleories'] = caleories;
    map['price'] = price;
    map['productId'] = productId;
    map['productImage'] = productImage;
    map['productName'] = productName;
    map['quantity'] = quantity;
    return map;
  }

}