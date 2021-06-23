import 'package:flux_client/app/core/errors/exceptions.dart';
import 'package:flux_client/app/shared/modules/auth/data/models/user_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RemoteDataSource {
  Future<UserModel> signInWithEmailandPassword(
      {required String email, required String password});
  Future<UserModel> signUpWithEmailAndPassword(
      {required String email, required String password, required String name});
  Future<bool> logout();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<UserModel> signInWithEmailandPassword(
      {required String email, required String password}) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserModel(email: result.user!.email!, id: result.user!.uid);
    } on FirebaseException catch (exception) {
      throw ServerException(exception.message!);
    } catch (_) {
      throw SignInException();
    }
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return UserModel(email: result.user!.email!, id: result.user!.uid);
    } on FirebaseException catch (e) {
      throw ServerException(e.message!);
    } catch (_) {
      throw SignUpException();
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await _auth.signOut();
      return true;
    } on FirebaseException catch (e) {
      throw ServerException(e.message!);
    } catch (_) {
      throw LogoutException();
    }
  }
}
