import 'package:dartz/dartz.dart';
import 'package:spotify_like/data/model/auth/creat_user_req.dart';
import 'package:spotify_like/data/model/auth/singin_user_req.dart';

abstract class AuthRepository {
  Future<Either> singin(SinginUserReq user);
  Future<Either> singup(CreatUserReq creatUserReq);
  Future<void> signOut();
  Future<bool> isSignedIn();
  Future<String?> getCurrentUserId();
}
