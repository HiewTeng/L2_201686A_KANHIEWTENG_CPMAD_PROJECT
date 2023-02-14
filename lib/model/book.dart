class Profile {
  String birthdate;
  String email;
  String password;
  String username;
  String phoneno;
  String uid;

  Profile(
      {this.birthdate,
      this.email,
      this.password,
      this.username,
      this.phoneno,
      this.uid});

  Profile.fromMap(Map<String, dynamic> data) {
    birthdate = data['birthdate'];
    email = data['email'];
    password = data['password'];
    username = data['username'];
    phoneno = data['phoneno'];
    uid = data['uid'];
  }

  Map<String, dynamic> toMap() {
    return {
      'birthdate': birthdate,
      'email': email,
      'password': password,
      'username': username,
      'phoneno': phoneno,
      'uid': uid
    };
  }
}
