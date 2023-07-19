import 'package:api_sample2/model/model.dart';
import 'package:api_sample2/service/service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController() {
    getData();
  }
  Service service = Service();
  List<Post1> productDatas = [];
  bool isLoading = false;
  void getData() async {
    isLoading = true;
    update();
    await service.getApiResultss().then(
      (value) {
        if (value != null) {
          productDatas = value;
          update();
        } else {
          isLoading = false;
          update();
        }
      },
    );
    isLoading = false;
    update();
  }
}
