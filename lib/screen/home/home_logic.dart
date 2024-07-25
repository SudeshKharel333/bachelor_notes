import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

import '../../models/notice_module.dart';
import '../../utils/emum.dart';

class HomeLogic extends GetxController{
  NoticeStatus noticeView = NoticeStatus.read;
  bool selected = false;
  List<Notice> notice = [];

  CarouselController carouselController = CarouselController();
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  int current =0;

  @override
  void onInit() async {
    Notice n1 = Notice(
      id: 1, title: "Title 1",
      description: "Description 1",
      publishDate: "2022-01-01",
      // time: "12:00",
      // image: "assets/images/notice1.jpg"
    );
    Notice n2 = Notice(
      id: 1, title: "Title 2 is ",
      description: "Description 2",
      publishDate: "2022-01-01",
      // time: "12:00",
      // image: "assets/images/notice1.jpg"
    );
    Notice n3 = Notice(
      id: 1, title: "Title 3 is this sacdsadsad asdas dsa d asd as d sad asd as d as",
      description: "Description ho yo",
      publishDate: "2022-01-01",
      // time: "12:00",
      // image: "assets/images/notice1.jpg"
    );
    Notice n4 = Notice(
      id: 1, title: "Title 4 is this",
      description: "Description ho yo 4th ko",
      publishDate: "2022-01-01",
      // time: "12:00",
      // image: "assets/images/notice1.jpg"
    );
    Notice n5 = Notice(
      id: 1, title: "Title 4 is this",
      // description: "Description ho yo 4th ko",
      publishDate: "2022-01-01",
      // time: "12:00",
      // image: "assets/images/notice1.jpg"
    );


    notice.add(n1);
    notice.add(n2);
    notice.add(n3);
    notice.add(n4);
    notice.add(n5);
    super.onInit();
  }


}