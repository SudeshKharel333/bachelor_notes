import 'package:get/get.dart';
import 'package:my_flutter_app/screen/notice_details/notice_details_logic.dart';

class NoticeDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NoticeDetailsLogic());
  }
}
