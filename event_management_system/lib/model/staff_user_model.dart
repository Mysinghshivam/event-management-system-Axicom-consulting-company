class StaffUserModel {
  String? sid;
  String? email;
  String? firstName;
  String? secondName;

  StaffUserModel({this.sid, this.email, this.firstName, this.secondName});

  // receiving data from server
  factory StaffUserModel.fromMap(map) {
    return StaffUserModel(
      sid: map['sid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'sid': sid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
    };
  }
}
