import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../data/news_services.dart';
import '../models/news_models.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<News> listNews = <News>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllArticle();
  }

  getAllArticle() async {
    isLoading(true);
    try {
      final response = await NewsServices().getAllNews();
      listNews.value = response;
      Logger().d(listNews.value);
      isLoading.toggle();
    } catch (e) {
      isLoading.toggle();
      Get.snackbar("Error Controller", e.toString());
      print(e);
    }
  }
}
