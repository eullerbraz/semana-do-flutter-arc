import 'package:arch/app/pages/home/home_controller.dart';
import 'package:arch/app/pages/home/home_page.dart';
import 'package:arch/app/pages/login/login_page.dart';
import 'package:arch/app/repositories/apiadvisor_repository.dart';
import 'package:arch/app/repositories/apiadvisor_repository_interface.dart';
import 'package:arch/app/services/client_http_service.dart';
import 'package:arch/app/services/shared_local_storage_service.dart';
import 'package:arch/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:arch/app/viewmodels/change_theme_viewmodel.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'interfaces/client_http_interface.dart';
import 'interfaces/local_storage_interface.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind((i) => HomeController(i.get())),
      Bind((i) => ApiadvisorViewModel(i.get())),
      Bind<IApiAdvisor>((i) => ApiadvisorRepository(i.get())),
      Bind<IClientHttp>((i) => ClientHttpService()),
      Bind((i) => AppController(i.get()), isLazy: false),
      Bind((i) => ChangeThemeViewModel(storage: i.get())),
      Bind<ILocalStorage>((i) => SharedLocalStorageService()),
    ];
  }

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => LoginPage()),
        ChildRoute('/home', child: (context, args) => HomePage())
      ];
}
