class UserModel {
  final String email;
  final String uid;
  final String username;
  final DateTime timestamp;
  final String photourl;

  UserModel(
      {this.email, this.uid, this.username, this.timestamp, this.photourl});

  Map toMap(UserModel user) {
    var data = Map<String, dynamic>();

    data["uid"] = user.uid;
    data["username"] = user.username;
    data["email"] = user.email;
    data["timestamp"] = user.timestamp;
    data["photo"] = user.photourl;

    return data;
  }

  factory UserModel.fromMap(Map<String, dynamic> mapData) {
    return UserModel(
      uid: mapData["uid"],
      username: mapData["username"],
      email: mapData["email"],
      photourl: mapData['photo'],
    );
  }
}
