import 'package:arch/app/modules/home/models/apiadvisor_model.dart';
import 'package:arch/app/modules/home/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final ApiadvisorViewModel viewModel;

  HomeController(this.viewModel);

  ValueNotifier<ApiadvisorModel> get time => viewModel.apiadvisorModel;

  getTime() {
    viewModel.fill();
  }
}
