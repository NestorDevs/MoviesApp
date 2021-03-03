import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';

abstract class IAppRepository {
  Future<Either<AppError, void>> updateLanguage(String language);
  Future<Either<AppError, String>> getPreferredLanguage();
}
