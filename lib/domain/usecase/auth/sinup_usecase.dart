import 'package:dartz/dartz.dart';
import 'package:spotify_like/core/usecase/use_case.dart';
import 'package:spotify_like/data/model/auth/creat_user_req.dart';
import 'package:spotify_like/domain/repo/auth/auth.dart';
import 'package:spotify_like/service_locator.dart';

class SinupUsecase implements UseCase<Either, CreatUserReq> {
  @override
  Future<Either> call(CreatUserReq params) async {
    return sl<AuthRepository>().singup(params);
  }
}
