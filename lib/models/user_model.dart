class UserModel {
  String uID;
  String chooseType;
  String email;
  String fullName;
  String password;
  String phoneNumber;

  UserModel(
      {this.uID,
      this.chooseType,
      this.email,
      this.fullName,
      this.password,
      this.phoneNumber});

  UserModel.fromJson(Map<String, dynamic> json) {
    uID = json['UID'];
    chooseType = json['chooseType'];
    email = json['email'];
    fullName = json['fullName'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UID'] = this.uID;
    data['chooseType'] = this.chooseType;
    data['email'] = this.email;
    data['fullName'] = this.fullName;
    data['password'] = this.password;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}
