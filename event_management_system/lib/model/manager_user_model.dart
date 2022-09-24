class ManagerUserModel {
  String? mid;
  String? email;
  String? firstName;
  String? secondName;

  ManagerUserModel({this.mid, this.email, this.firstName, this.secondName});

  // receiving data from server
  factory ManagerUserModel.fromMap(map) {
    return ManagerUserModel(
      mid: map['mid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'mid': mid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
    };
  }
}
