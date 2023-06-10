class UserAuth {
  UserData? userData;
  String? token;
  UserAuth(this.userData, this.token);
}

class UserData {
  String email;
  String userName;
  int id;
  UserData(this.email, this.userName, this.id);
}
