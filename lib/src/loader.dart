import 'package:flutter_easyloading/flutter_easyloading.dart';

class Loader{
  void showLoader() {
    EasyLoading.show(status: 'Loading...');
  }

  void hideLoader() {
    EasyLoading.dismiss();
  }

  void showToast(String message) {
    EasyLoading.showToast(message);
  }
}
