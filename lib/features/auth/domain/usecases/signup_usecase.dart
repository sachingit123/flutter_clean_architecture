import 'package:ecom/core/error/failures.dart';
import 'package:ecom/features/auth/data/entity/auth_request.dart';
import 'package:ecom/features/auth/domain/model/signup_model.dart';
import 'package:ecom/features/auth/domain/repositories/auth_repository.dart';
import 'package:either_dart/either.dart';

class SignUpUseCase {
  final AuthRepository repository;
  SignUpUseCase({required this.repository});
  Future<Either<Failure, SignUpModel>> execute(
          {required AuthRequest authRequest}) async =>
      await repository.signUpUser(authRequest: authRequest);
}
