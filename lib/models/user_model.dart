class UserModel {
  String? name;
  String? email;
  String? password;

  UserModel({ this.name,this.email, this.password});

  Map<String, dynamic> toJson() => {
    'name':name,
    'email': email,
    'password': password,
  };
}
