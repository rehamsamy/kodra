/// categories : [{"id":1,"idType":1,"imagePath":"https://toppng.com/uploads/preview/fast-food-11549470764zfdstlnivq.png","nameAr":"برجر","nameEn":"Burger","type":""},{"id":2,"idType":2,"imagePath":"https://e7.pngegg.com/pngimages/690/354/png-clipart-pizza-cutter-fast-food-take-out-pizza-vegetable-pizza-food-recipe.png","nameAr":"بيتزا","nameEn":"Pizza","type":""},{"id":3,"idType":3,"imagePath":"https://e7.pngegg.com/pngimages/159/28/png-clipart-pasta-spaghetti-with-meatballs-italian-cuisine-cyborg-noodle-food-recipe.png","nameAr":"مكرونه","nameEn":"Pasta","type":""},{"id":4,"idType":4,"imagePath":"https://e7.pngegg.com/pngimages/655/522/png-clipart-crepe-pancake-breakfast-food-crepe-maker-breakfast-food-breakfast.png","nameAr":"كريب","nameEn":"Creep","type":""},{"id":5,"idType":5,"imagePath":"https://mpng.subpng.com/20180403/yke/kisspng-shawarma-middle-eastern-cuisine-lebanese-cuisine-p-shawarma-5ac414c600e787.2002087315227998140037.jpg","nameAr":"شاورما","nameEn":"shawrma","type":""}]
/// status : true

class CategoryModel {
  CategoryModel({
    List<CategoryItemModel>? categories,
    bool? status,
  }) {
    _categories = categories;
    _status = status;
  }

  CategoryModel.fromJson(dynamic json) {
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(CategoryItemModel.fromJson(v));
      });
    }
    _status = json['status'];
  }

  List<CategoryItemModel>? _categories;
  bool? _status;

  CategoryModel copyWith({
    List<CategoryItemModel>? categories,
    bool? status,
  }) =>
      CategoryModel(
        categories: categories ?? _categories,
        status: status ?? _status,
      );

  List<CategoryItemModel>? get categories => _categories;

  bool? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    return map;
  }
}

/// id : 1
/// idType : 1
/// imagePath : "https://toppng.com/uploads/preview/fast-food-11549470764zfdstlnivq.png"
/// nameAr : "برجر"
/// nameEn : "Burger"
/// type : ""

class CategoryItemModel {
  CategoryItemModel({
    num? id,
    num? idType,
    String? imagePath,
    String? nameAr,
    String? nameEn,
    String? type,
  }) {
    _id = id;
    _idType = idType;
    _imagePath = imagePath;
    _nameAr = nameAr;
    _nameEn = nameEn;
    _type = type;
  }

  CategoryItemModel.fromJson(dynamic json) {
    _id = json['id'];
    _idType = json['idType'];
    _imagePath = json['imagePath'];
    _nameAr = json['nameAr'];
    _nameEn = json['nameEn'];
    _type = json['type'];
  }

  num? _id;
  num? _idType;
  String? _imagePath;
  String? _nameAr;
  String? _nameEn;
  String? _type;

  CategoryItemModel copyWith({
    num? id,
    num? idType,
    String? imagePath,
    String? nameAr,
    String? nameEn,
    String? type,
  }) =>
      CategoryItemModel(
        id: id ?? _id,
        idType: idType ?? _idType,
        imagePath: imagePath ?? _imagePath,
        nameAr: nameAr ?? _nameAr,
        nameEn: nameEn ?? _nameEn,
        type: type ?? _type,
      );

  num? get id => _id;

  num? get idType => _idType;

  String? get imagePath => _imagePath;

  String? get nameAr => _nameAr;

  String? get nameEn => _nameEn;

  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['idType'] = _idType;
    map['imagePath'] = _imagePath;
    map['nameAr'] = _nameAr;
    map['nameEn'] = _nameEn;
    map['type'] = _type;
    return map;
  }
}
