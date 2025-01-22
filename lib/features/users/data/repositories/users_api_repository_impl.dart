import 'package:ecom/features/users/domain/model/user_model.dart';
import 'package:either_dart/either.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/users_repositories.dart';
import '../datasources/users_api_remote_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersApiRemoteRepository remoteDataSource;
  UsersRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<UserModel>>> getUsers() async {
    try {
      final user = await remoteDataSource.getUsers();
      return Right(user);
    } catch (e) {
      return const Left(ServerFailure(errorMessage: 'Server Failed'));
    }
  }

  // @override
  // Future<Either<Failure, AddBookingEntity>> addBooking(
  //     {required AddBookingRequest addBookingRequest}) async {
  //   try {
  //     final booking = await remoteDataSource.addBooking(
  //         addBookingRequest: addBookingRequest);
  //     log(addBookingRequest.toJson().toString());
  //     log(booking.message.toString());
  //     return Right(booking);
  //   } catch (e) {
  //     return Left(ServerFailure(errorMessage: 'Server Failed $e'));
  //   }
  // }
}
