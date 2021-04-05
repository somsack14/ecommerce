


class userModels {
  String id;
  String chooseType;
  String username;
  String email;
  String password;

  userModels(
      {this.id, this.chooseType, this.username, this.email, this.password});

  userModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chooseType = json['chooseType'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['chooseType'] = this.chooseType;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}