// Step 1: Create a Model

class UserModel {
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String birthDate;
  String gender;
  String userID;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.birthDate,
    required this.gender,
    required this.userID,
  });

  /// Converts the UserModel instance to a JSON format.
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'birthDate': birthDate,
      'gender': gender,
      'userID': userID,
    };
  }

  /// Creates a UserModel instance from a JSON object.
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      birthDate: json['birthDate'] ?? '',
      gender: json['gender'] ?? '',
      userID: json['userID'] ?? '',
    );
  }

  // Setters
  void setFirstName(String value) {
    firstName = value;
  }

  void setLastName(String value) {
    lastName = value;
  }

  void setEmail(String value) {
    email = value;
  }

  void setGender(String value) {
    gender = value;
  }

  void setBirthDate(String value) {
    birthDate = value;
  }

  void setPhoneNumber(String value) {
    phoneNumber = value;
  }
}
