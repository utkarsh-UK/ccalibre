import 'package:ccalibre/data/datasource_impl/local_datasource_impl.dart';
import 'package:ccalibre/data/datasource_impl/remote_datasource_impl.dart';
import 'package:ccalibre/data/datasources/local_datasource.dart';
import 'package:ccalibre/data/datasources/remote_datasource.dart';
import 'package:ccalibre/data/repositories/application_repository_impl.dart';
import 'package:ccalibre/data/repositories/onboard_repository_impl.dart';
import 'package:ccalibre/data/services/storage_service.dart';
import 'package:ccalibre/domain/repositories/application_repository.dart';
import 'package:ccalibre/domain/repositories/onboard_repository.dart';
import 'package:ccalibre/domain/usecases/applications/add_variable.dart';
import 'package:ccalibre/domain/usecases/applications/create_new_app.dart';
import 'package:ccalibre/domain/usecases/applications/delete_variable.dart';
import 'package:ccalibre/domain/usecases/applications/get_all_apps.dart';
import 'package:ccalibre/domain/usecases/applications/get_application.dart';
import 'package:ccalibre/domain/usecases/applications/update_variable.dart';
import 'package:ccalibre/domain/usecases/builds/cancel_build.dart';
import 'package:ccalibre/domain/usecases/builds/get_all_builds.dart';
import 'package:ccalibre/domain/usecases/builds/get_build_status.dart';
import 'package:ccalibre/domain/usecases/builds/start_new_build.dart';
import 'package:ccalibre/domain/usecases/onboard/store_user_data.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DependencyInjector {
  static void inject() {
    _injectExternalDependencies();

    _injectDatasources();

    _injectRepositories();

    _injectApplicationUsecases();
    _injectBuildUsecases();
    _injectOnboardUsecases();
  }

  static void _injectExternalDependencies() {
    final Dio _dio = Dio(
      BaseOptions(baseUrl: 'https://api.codemagic.io'),
    );

    Get.lazyPut<Dio>(() => _dio);
  }

  static void _injectDatasources() {
    final dio = Get.find<Dio>();
    final securedStorageService = Get.find<SecuredStorageService>();

    Get.lazyPut<RemoteDatasource>(() => RemoteDatasourceImpl(dio));
    Get.lazyPut<LocalDatasource>(
        () => LocalDatasourceImpl(securedStorageService));
  }

  static void _injectRepositories() {
    final remoteDatasource = Get.find<RemoteDatasource>();
    final localDatasource = Get.find<LocalDatasource>();

    Get.lazyPut<ApplicationRepository>(
        () => ApplicationRepositoryImpl(remoteDatasource));
    Get.lazyPut<OnboardRepository>(
        () => OnboardRepositoryImpl(localDatasource));
  }

  static void _injectApplicationUsecases() {
    final applicationRepository = Get.find<ApplicationRepository>();

    Get.lazyPut<GetAllApplications>(
        () => GetAllApplications(applicationRepository));
    Get.lazyPut<GetApplication>(() => GetApplication(applicationRepository));
    Get.lazyPut<AddVariable>(() => AddVariable(applicationRepository));
    Get.lazyPut<CreateNewApplication>(
        () => CreateNewApplication(applicationRepository));
    Get.lazyPut<DeleteVariable>(() => DeleteVariable(applicationRepository));
    Get.lazyPut<UpdateVariable>(() => UpdateVariable(applicationRepository));
  }

  static void _injectBuildUsecases() {
    final applicationRepository = Get.find<ApplicationRepository>();

    Get.lazyPut<GetAllBuilds>(() => GetAllBuilds(applicationRepository));
    Get.lazyPut<GetBuildStatus>(() => GetBuildStatus(applicationRepository));
    Get.lazyPut<CancelBuild>(() => CancelBuild(applicationRepository));
    Get.lazyPut<StartNewBuild>(() => StartNewBuild(applicationRepository));
  }

  static void _injectOnboardUsecases() {
    final onboardRepository = Get.find<OnboardRepository>();

    Get.lazyPut<StoreUserData>(() => StoreUserData(onboardRepository));
  }
}
