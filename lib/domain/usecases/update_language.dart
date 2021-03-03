import 'package:dartz/dartz.dart';

import 'usecase.dart';
import '../entities/app_error.dart';
import '../repositories/i_app_repository.dart';

class UpdateLanguage extends Usecase<void, String> {
  final IAppRepository appRepository;

  UpdateLanguage(this.appRepository);

  @override
  Future<Either<AppError, void>> call(String languageCode) async {
    return await appRepository.updateLanguage(languageCode);
  }
}
