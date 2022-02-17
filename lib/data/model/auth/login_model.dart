class LoginModel {
  String? accessToken;

  LoginModel({this.accessToken});

  LoginModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['access_token'] = accessToken;
    return data;
  }
}
