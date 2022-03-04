import 'package:firebase_database/firebase_database.dart';
import 'package:flux_client/app/core/helpers/helper_methods.dart';

import '../../../../../core/errors/exceptions.dart';
import '../models/user_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class RemoteDataSource {
  Future<UserModel> signInWithEmailandPassword(
      {required String email, required String password});
  Future<UserModel> signUpWithEmailAndPassword(
      {required String password, required UserModel user});
  Future<UserModel> signWithGoogle();
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
      final infos = await HelperMethods.getCurrentUserInfo();

      return UserModel(
        email: result.user!.email!,
        id: result.user!.uid,
        phoneNumber: infos!.phoneNumber!,
        name: infos.name!,
      );
    } on FirebaseException catch (exception) {
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
              .catchError((ex) {}))
          .user;

      if (result != null) {
        DatabaseReference newUser =
            FirebaseDatabase.instance.ref().child('users/${result.uid}');

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

  @override
  Future<UserModel> signWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      GoogleSignInAccount? response = await _googleSignIn.signIn();

      if (response == null) {
        print('response: null');
        return UserModel(email: 'error');
      } else {
        final user = UserModel(
          email: response.email,
          name: response.displayName,
          photoUrl: response.photoUrl,
        );
        print(user.email);
        return user;
      }
    } catch (e) {
      print(e);
      throw SignInException();
    }
  }
}
