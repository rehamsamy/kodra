class ItemModel {
  ItemModel({
    this.id,
    this.itemPrice,
    this.itemCount,
    this.itemDiscount,
    this.active,
    this.name,
    this.desc,
    this.country,
    this.category,
    this.subCategory,});




  ItemModel.fromJson(dynamic json) {
    id = json['id'];
    itemPrice = json['itemPrice'];
    itemCount = json['itemCount'];
    itemDiscount = json['itemDiscount'];
    active = json['active'];
    name = json['name'];
    desc = json['desc'];
    country = json['country'];
    category = json['category'];
    subCategory = json['sub_category'];
  }
  int? id;
  int? itemPrice;
  int? itemCount;
  int? itemDiscount;
  int? active;
  String? name;
  String? desc;
  String? country;
  String? category;
  String? subCategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['itemPrice'] = itemPrice;
    map['itemCount'] = itemCount;
    map['itemDiscount'] = itemDiscount;
    map['active'] = active;
    map['name'] = name;
    map['desc'] = desc;
    map['country'] = country;
    map['category'] = category;
    map['sub_category'] = subCategory;
    return map;
  }

}


class Prod{
  int? id;
  int? itemPrice;
  int? itemCount;
  int? itemDiscount;
  int? active;
  String? name;
  String? desc;
  String? country;
  String? category;
  String? subCategory;
}