import 'package:firebase_database/firebase_database.dart';

import '../../../../../core/errors/exceptions.dart';
import '../models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RemoteDataSource {
  Future<UserModel> signInWithEmailandPassword(
      {required String email, required String password});
  Future<UserModel> signUpWithEmailAndPassword(
      {required String password, required UserModel user});
  Future<bool> logout();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<UserModel> signInWithEmailandPassword(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? currentUser = _auth.currentUser!;
      UserModel? currentUserInfo;
      String userId = currentUser.uid;

      DatabaseReference userRef =
          FirebaseDatabase.instance.ref().child('drivers/$userId');

      final snapshot = await userRef.get();

      if (snapshot.exists) {
        currentUserInfo = UserModel(
          email: snapshot.child('email').value.toString(),
          id: userId,
          name: snapshot.child('name').value.toString(),
          phoneNumber: snapshot.child('phoneNumber').value.toString(),
        );
      }
      return currentUserInfo!;
    } on FirebaseException catch (exception) {
      print(exception);
      throw ServerException(exception.message!);
    } catch (_) {
      throw SignInException();
    }
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword({
    required String password,
    required UserModel user,
  }) async {
    try {
      User? result = (await _auth
              .createUserWithEmailAndPassword(
        email: user.email!,
        password: password,
      )
              .catchError((ex) {
        print(ex);
      }))
          .user;

      if (result != null) {
        DatabaseReference newUser =
            FirebaseDatabase.instance.ref().child('drivers/${result.uid}');

        Map userMap = {
          'name': user.name,
          'email': user.email,
          'phoneNumber': user.phoneNumber
        };

        newUser.set(userMap);
      }

      return UserModel(email: result!.email!, id: result.uid);
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
