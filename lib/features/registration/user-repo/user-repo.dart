import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jumia/features/registration/user-model.dart';

class UserRepo extends GetxController {
  static UserRepo get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Store User in Firestore
  Future<void> createUser(UserModel user) async {
    try {
      await _db.collection("users").add(user.toJson());
    } catch (error) {
      throw Exception("Error creating user: $error");
    }
  }

  /// Fetch User Details
  Future<List<UserModel>> getUserDetails(String email) async {
    try {
      final snapshot =
          await _db.collection("users").where("email", isEqualTo: email).get();
      final users =
          snapshot.docs.map((doc) => UserModel.fromJson(doc.data())).toList();
      return users;
    } catch (error) {
      throw Exception("Error fetching user: $error");
    }
  }

// Update User Data on Firebase Firestore
  Future<void> UpdateUser(UserModel user) async {
    try {
      final snapshot = await _db
          .collection("users")
          .where("userID", isEqualTo: user.userID)
          .get();
      final docId = snapshot.docs.first.id; // Accessing the document ID
      await _db.collection("users").doc(docId).update(user.toJson());
    } catch (error) {
      throw Exception("Error updating user: $error");
    }
  }

  /// Delete User from Firebase Firestore
  Future<void> deleteUser(String userId) async {
    try {
      final snapshot = await _db
          .collection("users")
          .where("userID", isEqualTo: userId)
          .get();
      if (snapshot.docs.isNotEmpty) {
        final docId = snapshot.docs.first.id; // Accessing the document ID
        await _db.collection("users").doc(docId).delete();
        print("User deleted successfully");
      } else {
        print("User with ID $userId not found");
      }
    } catch (error) {
      throw Exception("Error deleting user: $error");
    }
  }
}
