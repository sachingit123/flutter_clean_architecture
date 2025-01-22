import 'package:ecom/core/error/failures.dart';
import 'package:ecom/features/auth/domain/model/login_model.dart';
import 'package:ecom/features/auth/domain/model/signup_model.dart';
import 'package:either_dart/either.dart';
import '../../data/entity/auth_request.dart';

abstract class AuthRepository {
  Future<Either<Failure, SignUpModel>> signUpUser(
      {required AuthRequest authRequest});
  Future<Either<Failure, LoginModel>> loginUser(
      {required AuthRequest authRequest});
}
