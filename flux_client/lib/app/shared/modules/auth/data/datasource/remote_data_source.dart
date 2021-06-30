import 'package:flux_client/app/core/errors/exceptions.dart';
import 'package:flux_client/app/shared/modules/auth/data/models/user_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class RemoteDataSource {
  Future<UserModel> signInWithEmailandPassword({required String email, required String password});
  Future<UserModel> signUpWithEmailAndPassword(
      {required String email, required String password, required String name});
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
