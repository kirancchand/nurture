class User {
   String emailId;
   String password;
  User({ this.emailId, this.password});

  Map<String, dynamic> toJson() {
    return {"emailId": emailId, "password": password};
  }

  User.fromJson(Map<String, dynamic> json) {
    try {
      emailId = json['emailId'];
      password = json['password'];
    } catch (e) {
      print(e.toString());
    }
  }
}
