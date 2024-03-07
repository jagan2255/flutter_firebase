class userAuth {
  String? id;
  String? userName;
  String? email;
  String? password;

  userAuth({this.id, this.userName, this.email, this.password});

  userAuth.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
