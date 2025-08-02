import 'package:dartz/dartz.dart';
import 'package:spotify_like/core/usecase/use_case.dart';
import 'package:spotify_like/data/model/auth/singin_user_req.dart'
    show SinginUserReq;
import 'package:spotify_like/domain/repo/auth/auth.dart';
import 'package:spotify_like/service_locator.dart';

class SigninUsecase implements UseCase<Either, SinginUserReq> {
  @override
  Future<Either> call(SinginUserReq params) async {
    return sl<AuthRepository>().singin(params);
  }
}
