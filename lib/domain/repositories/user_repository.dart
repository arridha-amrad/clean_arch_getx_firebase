import 'package:clean_arch/domain/models/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final _userStore = FirebaseFirestore.instance.collection("users");

  Future<void> save(UserData userData) async {
    await _userStore.doc(userData.userId).set(userData.toJson());
  }

  Future<void> update(UserData userData) async {
    await _userStore.doc(userData.userId).update(userData.toJson());
  }
}
