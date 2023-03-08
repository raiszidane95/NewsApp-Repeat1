import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class Initializer {
  static Future init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
      _initGetConncet();
    } catch (err) {
      rethrow;
    }
  }

  static Future<void> _initGetConncet() async {
    final connect = GetConnect();
    connect.baseUrl = 'http://jsonplaceholder.typicode.com/';
    Logger().d(connect.baseUrl);
    Get.put(connect);
  }
}
