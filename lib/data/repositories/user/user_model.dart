import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../utils/formatters/formatter.dart';

class UserModel {
  //keep the values you don't want to update as "final"
  final String id;
  final String username;
  final String email;
  String firstName, lastName, phoneNumber, profilePicture;

  ///constructor for user model
  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.profilePicture,
  });

  ///helper function to get the full name
  String get fullName => '$firstName $lastName';

  ///helper function to format phone number
  String get formattedPhoneNo => StoreFormatter.formatPhoneNumber(phoneNumber);

  ///static function to split full name
  static List<String> nameParts(fullName) => fullName.split(" ");

  ///function to generate username from full name
  static String generateUserName(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    String camelCaseUsername = "$firstName$lastName"; //combine first name and last name
    String usernameWithPrefix = "cwt_$camelCaseUsername"; //add "cwt_" prefix
    return usernameWithPrefix;
  }

  ///static function to create an empty user model
  static UserModel empty() =>
      UserModel(id: '',
          username: '',
          email: '',
          firstName: '',
          lastName: '',
          phoneNumber: '',
          profilePicture: '');

  ///convert model to json structure for storing data in firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture
    };
  }

  ///Factory method to create a UserModel from a firebase document snapshot
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      // capitalize first letter
      String capitalize(String s) =>
          s.isNotEmpty ? s[0].toUpperCase() + s.substring(1).toLowerCase() : '';

      return UserModel(
        id: document.id,
        username: capitalize(data['Username'] ?? ''),
        email: data['Email'] ?? '',
        firstName: capitalize(data['FirstName'] ?? ''),
        lastName: capitalize(data['LastName'] ?? ''),
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
      );
    } else {
      return UserModel.empty(); // or throw an exception depending on your use case
    }
  }

}
