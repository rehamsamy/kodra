/// popular : [{"id":0,"imagePath":"https://toppng.com/uploads/preview/free-png-pizza-png-images-transparent-transparent-background-pizza-11563652534zjxcvfhp99.png"},{"id":1,"imagePath":"https://w7.pngwing.com/pngs/165/840/png-transparent-new-york-style-pizza-take-out-italian-cuisine-fast-food-pizza-food-recipe-fast-food-restaurant.png"},{"id":2,"imagePath":"https://banner2.cleanpng.com/20180623/bjt/kisspng-pasta-italian-cuisine-penne-spaghetti-pasta-noodles-5b2e8c0b8c6575.6996922215297771635751.jpg"},{"id":3,"imagePath":"https://img.freepik.com/premium-psd/italian-pasta-alla-arrabbiata-with-basil-parmesan-plate-with-transparent-background_670625-658.jpg?w=2000"},{"id":4,"imagePath":"https://image.similarpng.com/very-thumbnail/2022/02/Tasty-appetizing-classic-italian-spaghetti-pasta-on-transparent-background-PNG.png"},{"id":5,"imagePath":"https://p2.hiclipart.com/preview/62/421/312/shawarma-food-cuisine-dish-ingredient-gyro-junk-food-sandwich-wrap-png-clipart.jpg"},{"id":6,"imagePath":"https://w7.pngwing.com/pngs/117/503/png-transparent-shawarma-chicken-hamburger-doner-kebab-chicken-food-animals-recipe.png"},{"id":7,"imagePath":"https://toppng.com/uploads/preview/ready-to-use-crepe-mix-by-original-waffles-crepe-11563043804aj8kjp8fsf.png"},{"id":8,"imagePath":"https://banner2.cleanpng.com/20180622/svk/kisspng-crpes-suzette-pancake-recipe-flatbread-crepe-5b2cdbc0ef1ec9.6270897515296664969795.jpg"},{"id":9,"imagePath":"https://w7.pngwing.com/pngs/211/742/png-transparent-crepe-pancake-roti-breakfast-crepe-maker-breakfast.png"}]

class PopularModel {
  PopularModel({
      List<Popular>? popular,}){
    _popular = popular;
}

  PopularModel.fromJson(dynamic json) {
    if (json['popular'] != null) {
      _popular = [];
      json['popular'].forEach((v) {
        _popular?.add(Popular.fromJson(v));
      });
    }
  }
  List<Popular>? _popular;
PopularModel copyWith({  List<Popular>? popular,
}) => PopularModel(  popular: popular ?? _popular,
);
  List<Popular>? get popular => _popular;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_popular != null) {
      map['popular'] = _popular?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 0
/// imagePath : "https://toppng.com/uploads/preview/free-png-pizza-png-images-transparent-transparent-background-pizza-11563652534zjxcvfhp99.png"

class Popular {
  Popular({
     required num? id,
     required String? imagePath,}){
    _id = id;
    _imagePath = imagePath;
}

  Popular.fromJson(dynamic json) {
    _id = json['id'];
    _imagePath = json['imagePath'];
  }
  num? _id;
  String? _imagePath;
Popular copyWith({  num? id,
  String? imagePath,
}) => Popular(  id: id ?? _id,
  imagePath: imagePath ?? _imagePath,
);
  num? get id => _id;
  String? get imagePath => _imagePath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['imagePath'] = _imagePath;
    return map;
  }

}