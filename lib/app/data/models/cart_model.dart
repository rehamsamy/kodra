class CartModel{
  String id;
  String title;
  num ? price;
  String imagePath;
  int  caleories;
  int  quantity;


  CartModel({required this.id,required this.title,required this.price,
    required this.imagePath,required this.caleories,
    required this.quantity});

}
