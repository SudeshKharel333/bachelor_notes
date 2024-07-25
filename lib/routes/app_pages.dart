import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_flutter_app/routes/app_routes.dart';
import 'package:my_flutter_app/screen/auth/login/login_binding.dart';
import 'package:my_flutter_app/screen/auth/login/login_view.dart';
import 'package:my_flutter_app/screen/home/home_binding.dart';
import 'package:my_flutter_app/screen/home/home_view.dart';
import 'package:my_flutter_app/screen/member_list/member_list_binding.dart';
import 'package:my_flutter_app/screen/member_list/member_list_view.dart';
import 'package:my_flutter_app/screen/notice_details/notice_details_binding.dart';
import 'package:my_flutter_app/screen/notice_details/notice_details_view.dart';
import 'package:my_flutter_app/screen/shop_home/shop_home_binding.dart';
import 'package:my_flutter_app/screen/shop_home/shop_home_view.dart';

import '../screen/home/home_view_v2.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
        name: AppRoutes.homeScreen,
        page: () => const MyHomePageV2(),
        binding: HomeBinding()),
    GetPage(
        name: AppRoutes.noticeDetailsScreen,
        page: () => const NoticeDetailsView(),
        binding: NoticeDetailsBinding()),
    GetPage(
        name: AppRoutes.memberListScreen,
        page: () => const MemberListView(),
        binding: MemberListBinding()),
    GetPage(
        name: AppRoutes.loginScreen,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.shopHomeScreen,
        page: () => const ShopHomePage(),
        binding: ShopHomeBinding()),
  ];
}
