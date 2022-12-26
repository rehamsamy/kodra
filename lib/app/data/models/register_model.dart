
class RegisterModel {
  RegisterModel({
      String? idToken, 
      String? email,
    String? name,
    String? refreshToken,
      String? expiresIn, 
      String? localId,}){
    _idToken = idToken;
    _email = email;
    _refreshToken = refreshToken;
    _expiresIn = expiresIn;
    _localId = localId;
    _name=name;
}

  RegisterModel.fromJson(dynamic json) {
    _idToken = json['idToken'];
    _email = json['email'];
    _refreshToken = json['refreshToken'];
    _expiresIn = json['expiresIn'];
    _localId = json['localId'];
    _name=json['name'];
  }
  String? _idToken;
  String? _email;
  String? _name;
  String? _refreshToken;
  String? _expiresIn;
  String? _localId;
RegisterModel copyWith({  String? idToken,
  String? email,
  String? refreshToken,
  String? expiresIn,
  String? localId,
}) => RegisterModel(  idToken: idToken ?? _idToken,
  email: email ?? _email,
  refreshToken: refreshToken ?? _refreshToken,
  expiresIn: expiresIn ?? _expiresIn,
  localId: localId ?? _localId,
);
  String? get idToken => _idToken;
  String? get email => _email;
  String? get refreshToken => _refreshToken;
  String? get expiresIn => _expiresIn;
  String? get localId => _localId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['idToken'] = _idToken;
    map['email'] = _email;
    map['refreshToken'] = _refreshToken;
    map['expiresIn'] = _expiresIn;
    map['localId'] = _localId;
    return map;
  }

}