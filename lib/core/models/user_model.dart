class User {
  String uid;
  String phoneNumber;
  String? fullName;
  bool isVerified;
  String? profileImageUrl;

  User(
      {required this.uid,
      required this.phoneNumber,
      this.isVerified = false,
      this.fullName,
      this.profileImageUrl});

  /// Firestore json to dart model
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        uid: json['uid'],
        phoneNumber: json['phoneNumber'],
        fullName: json['fullName'],
        isVerified: json['isVerified'],
        profileImageUrl: json['profileImageUrl']);
  }

  /// Dart model to firestore json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['uid'] = uid;
    data['phoneNumber'] = phoneNumber;
    data['fullName'] = fullName;
    data['isVerified'] = isVerified;
    data['profileImageUrl'] = profileImageUrl;
    return data;
  }
}
