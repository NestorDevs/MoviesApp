import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/no_params.dart';
import '../repositories/i_app_repository.dart';
import 'usecase.dart';

class GetPreferredLanguage extends Usecase<String, NoParams> {
  final IAppRepository appRepository;

  GetPreferredLanguage(this.appRepository);

  @override
  Future<Either<AppError, String>> call(NoParams params) async {
    return await appRepository.getPreferredLanguage();
  }
}
