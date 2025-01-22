import 'package:ecom/core/error/failures.dart';
import 'package:ecom/features/auth/data/entity/auth_request.dart';
import 'package:ecom/features/auth/domain/model/login_model.dart';
import 'package:ecom/features/auth/domain/repositories/auth_repository.dart';
import 'package:either_dart/either.dart';

class LoginUsecase {
  final AuthRepository repository;
  LoginUsecase({required this.repository});
  Future<Either<Failure, LoginModel>> execute(
          {required AuthRequest authRequest}) async =>
      await repository.loginUser(authRequest: authRequest);
}
