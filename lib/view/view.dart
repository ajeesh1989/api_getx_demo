import 'package:api_sample2/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MyHome extends StatelessWidget {
  MyHome({super.key});
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'api2',
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
        body: GetBuilder<HomeController>(
          builder: (controller) => GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridTile(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: Image(
                          image: NetworkImage(
                              homeController.productDatas[index].image),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          homeController.productDatas[index].title
                              .toUpperCase(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              homeController.productDatas[index].description
                                  .toString(),
                              style: const TextStyle(color: Colors.black),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    homeController.productDatas[index].category
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  Text(
                                    homeController.productDatas[index].price
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.green, fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: homeController.productDatas.length,
          ),
        )
        // body: ListView.separated(
        //   itemBuilder: (context, index) {
        //     return ListTile(
        //       title: Text(
        //         homeController.productDatas[index].title.toString(),
        //         style: const TextStyle(color: Colors.white),
        //       ),
        //     );
        //   },
        //   separatorBuilder: (context, index) {
        //     return const Divider();
        //   },
        //   itemCount: homeController.productDatas.length,
        // ),
        );
  }
}
