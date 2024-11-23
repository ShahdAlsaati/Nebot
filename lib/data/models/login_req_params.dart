
class LoginReqParams  {

  String? email;
  String? password;
  String? token_device;

  LoginReqParams({this.email, this.password, this.token_device});

  LoginReqParams.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    token_device = json['token_device'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['token_device'] = this.token_device;
    return data;
  }
}
