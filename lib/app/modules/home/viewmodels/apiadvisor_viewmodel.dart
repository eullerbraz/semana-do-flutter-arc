import 'package:arch/app/modules/home/models/apiadvisor_model.dart';
import 'package:arch/app/modules/home/repositories/apiadvisor_repository_interface.dart';
import 'package:flutter/foundation.dart';

class ApiadvisorViewModel {
  final IApiAdvisor repository;

  final apiadvisorModel = ValueNotifier<ApiadvisorModel>(null);

  ApiadvisorViewModel(this.repository);

  Future fill() async {
    try {
      apiadvisorModel.value = await repository.getTime();
    } catch (e) {}
  }
}
