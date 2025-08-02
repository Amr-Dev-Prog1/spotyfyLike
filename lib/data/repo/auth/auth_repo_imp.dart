import 'package:dartz/dartz.dart';
import 'package:spotify_like/data/model/auth/creat_user_req.dart';
import 'package:spotify_like/data/model/auth/singin_user_req.dart';
import 'package:spotify_like/data/sources/auth/auth_firebase_serves.dart';
import 'package:spotify_like/domain/repo/auth/auth.dart';
import 'package:spotify_like/service_locator.dart';

class AuthRepoImp extends AuthRepository {
  @override
  Future<String?> getCurrentUserId() {
    // TODO: implement getCurrentUserId
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignedIn() {
    // TODO: implement isSignedIn
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Either> singin(SinginUserReq user) async {
    return await sl<AuthFirebaseServes>().singin(user);
  }

  @override
  Future<Either> singup(CreatUserReq user) async {
    return await sl<AuthFirebaseServes>().singup(user);
  }
}
