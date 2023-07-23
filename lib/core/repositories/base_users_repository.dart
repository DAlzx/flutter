import '../models/user_model.dart';

abstract class BaseUsersRepository{
  /// To save new user to firestore database
  Future<String> save();
  /// To save a new user to firestore database <br>
  /// [userToAdd] New user to add in firestore
  Future<String> saveUser(User userToAdd);
  /// To get user from firestore by uid
  Future<User> getUserByUid(String uid);
  /// To search user by phone number
  Future<User> searchUserByPhoneNumber(String phoneNumber);
}