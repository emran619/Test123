class MalkanatLoginModel {
  bool status;
  String message;
  UserData data;

  MalkanatLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  int id;
  String name;
  String token;
  UserData({this.id, this.name, this.token});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json[name];
    token = json['token'];
  }
}
