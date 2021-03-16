import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/no_params.dart';

import '../entities/app_error.dart';
import '../repositories/i_authentication_repository.dart';
import 'usecase.dart';

class LogoutUser extends Usecase<void, NoParams> {
  final IAuthenticationRepository _authenticationRepository;

  LogoutUser(this._authenticationRepository);

  @override
  Future<Either<AppError, void>> call(NoParams noParams) async =>
      _authenticationRepository.logoutUser();
}
