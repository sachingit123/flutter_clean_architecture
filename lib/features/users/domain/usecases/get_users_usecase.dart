import 'package:ecom/features/users/domain/model/user_model.dart';
import 'package:either_dart/either.dart';
import '../../../../core/error/failures.dart';
import '../repositories/users_repositories.dart';

class GetUsersUseCase {
  final UsersRepository repository;
  GetUsersUseCase({required this.repository});
  Future<Either<Failure, List<UserModel>>> execute() async =>
      await repository.getUsers();
}
