import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_like/data/model/auth/creat_user_req.dart';
import 'package:spotify_like/data/model/auth/singin_user_req.dart';

abstract class AuthFirebaseServes {
  Future<void> signOut();
  Future<Either> singin(SinginUserReq user);
  Future<Either<String, String>> singup(CreatUserReq userReq); // تحديد الأنواع
  Future<bool> isSignedIn();
}

class AuthFirebaseServesImpl extends AuthFirebaseServes {
  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<bool> isSignedIn() async {
    final user = FirebaseAuth.instance.currentUser;
    return user != null;
  }

  @override
  Future<Either<String, String>> singin(SinginUserReq user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      return Right("Sign in successful");
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found for that email.';
          break;
        case 'wrong-password':
          errorMessage = 'Wrong password provided.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is not valid.';
          break;
        case 'user-disabled':
          errorMessage = 'This user has been disabled.';
          break;
        default:
          errorMessage = e.message ?? 'Firebase error occurred.';
      }
      return Left(errorMessage);
    } catch (e) {
      return Left('Unexpected error occurred: $e');
    }
  }

  @override
  Future<Either<String, String>> singup(CreatUserReq user) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(data.user!.uid)
          .set({
            'name': user.name,
            'email': data.user?.email,
          }, SetOptions(merge: true));

      return Right("Signup successful");
    } on FirebaseAuthException catch (e) {
      String errorMessage = e.message ?? 'An unknown error occurred';
      switch (e.code) {
        case 'weak-password':
          errorMessage = 'The password provided is too weak.';
          break;
        case 'email-already-in-use':
          errorMessage = 'The account already exists for that email.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is not valid.';
          break;
        case 'user-disabled':
          errorMessage = 'User with this email has been disabled.';
          break;
        default:
          errorMessage = e.message ?? 'Firebase error occurred.';
      }
      return Left(errorMessage);
    } catch (e) {
      return Left('An unexpected error occurred: $e');
    }
  }
}
