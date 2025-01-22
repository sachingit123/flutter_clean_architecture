import 'package:ecom/core/error/failures.dart';
import 'package:ecom/features/users/domain/model/user_model.dart';
import 'package:either_dart/either.dart';

abstract class UsersRepository {
  Future<Either<Failure, List<UserModel>>> getUsers();
  // Future<Either<Failure, AddBookingEntity>> addBooking(
  //     {required AddBookingRequest addBookingRequest});
}
