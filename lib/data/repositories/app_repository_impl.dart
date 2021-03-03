import 'package:dartz/dartz.dart';

import '../../domain/entities/app_error.dart';
import '../../domain/repositories/i_app_repository.dart';
import '../data_sources/language_local_data_source.dart';

class AppRepositoryImpl extends IAppRepository {
  final LanguageLocalDataSource localDataSource;

  AppRepositoryImpl(this.localDataSource);

  @override
  Future<Either<AppError, String>> getPreferredLanguage() async {
    try {
      final response = await localDataSource.getPreferredLanguage();
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> updateLanguage(String language) async {
    try {
      final response = await localDataSource.updateLanguage(language);
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }
}
