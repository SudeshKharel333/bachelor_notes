import 'package:get/get.dart';
import 'package:my_flutter_app/screen/member_list/member_list_logic.dart';

class MemberListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MemberListLogic());
    // Get.lazyPut(() => HomeLogic());
  }
}