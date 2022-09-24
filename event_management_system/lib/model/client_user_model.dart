class ClientUserModel {
  String? cid;
  String? email;
  String? firstName;
  String? secondName;

  ClientUserModel({this.cid, this.email, this.firstName, this.secondName});

  // receiving data from server
  factory ClientUserModel.fromMap(map) {
    return ClientUserModel(
      cid: map['cid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'cid': cid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
    };
  }
}
