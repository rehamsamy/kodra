import 'package:get/get.dart';

class WordModel {
  WordModel({
    this.isChange,
    this.imageUrl,
    this.word
  });

  WordModel.fromJson(dynamic json) {
isChange = json['isChange'];
imageUrl = json['imageUrl'];
    word = json['word'];
  }
  bool? isChange;
  String? imageUrl;
  String? word;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isChange'] = isChange;
    map['imageUrl'] = imageUrl;
    map['word'] = word;
    return map;
  }

}