import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? SkeletonListView()
            : ListView.builder(
                itemCount: controller.listNews.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.all(24),
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ini judul\n ' + controller.listNews[index].title,
                            style: TextStyle(
                                color: Color(0xFF2F2D76),
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Text(controller.listNews[index].body),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
