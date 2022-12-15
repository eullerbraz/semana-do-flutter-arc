import 'package:arch/app/modules/home/home_controller.dart';
import 'package:arch/app/modules/home/home_module.dart';
import 'package:arch/app/modules/home/home_page.dart';
import 'package:arch/app/modules/login/login_module.dart';
import 'package:arch/app/modules/login/login_page.dart';
import 'package:arch/app/modules/home/repositories/apiadvisor_repository.dart';
import 'package:arch/app/modules/home/repositories/apiadvisor_repository_interface.dart';
import 'package:arch/app/core/services/client_http_service.dart';
import 'package:arch/app/core/services/shared_local_storage_service.dart';
import 'package:arch/app/modules/home/viewmodels/apiadvisor_viewmodel.dart';
import 'package:arch/app/core/viewmodels/change_theme_viewmodel.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'core/interfaces/client_http_interface.dart';
import 'core/interfaces/local_storage_interface.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind<IClientHttp>((i) => ClientHttpService()),
      Bind((i) => AppController(i.get()), isLazy: false),
      Bind((i) => ChangeThemeViewModel(storage: i.get())),
      Bind<ILocalStorage>((i) => SharedLocalStorageService()),
    ];
  }

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: LoginModule()),
        ModuleRoute('/home/', module: HomeModule()),
      ];
}
