import 'package:get/get.dart';

import '../modules/home/models/news_models.dart';

class NewsServices {
  final _connect = Get.find<GetConnect>();

  Future<List<News>> getAllNews() async {
    final response = await _connect.get('posts',
        decoder: (data) => List<News>.from(data.map((x) => News.fromJson(x))));

    // var response =
    //     await _connect.get('posts', decoder: (data) => News.fromJson(data as Map<String, dynamic>));

    // final jsonResponse = News.fromJson(response.body as Map<String, dynamic>);

    // Logger().d(response.body);
    if (!response.hasError) {
      return response.body!;
    } else {
      throw Get.snackbar("Error Service", response.statusCode.toString(),
          duration: const Duration(seconds: 5));
    }
  }
}
