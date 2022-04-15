import 'package:get/get.dart';

class HomeController extends GetxController {
  final areApplicationsAdded = true.obs;
  final applications = [].obs;

  void setApplicationsAdded(bool value) => areApplicationsAdded.value = value;
}
