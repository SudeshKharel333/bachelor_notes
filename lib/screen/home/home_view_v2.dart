import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:my_flutter_app/routes/app_routes.dart';
import 'package:my_flutter_app/screen/home/home_logic.dart';
import '../../core/app_managers/assets_managers.dart';
import '../../utils/emum.dart';

class MyHomePageV2 extends StatefulWidget {
  const MyHomePageV2({
    super.key,
  });

  @override
  State<MyHomePageV2> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePageV2> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLogic>(builder: (logic) {
      return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Center(
            child: Text(
              "My e-comm",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Column(
          children: [
            CarouselSlider(
                carouselController: logic.carouselController,
                items: logic.imgList
                    .map((item) => Container(
                          child: Image.network(item),
                        ))
                    .toList(),
                options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    enlargeFactor: .3,
                    viewportFraction: .7,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    pauseAutoPlayOnTouch: true,
                    enlargeCenterPage: true,
                    pageSnapping: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        logic.current = index;
                      });
                    })),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: logic.imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () =>
                      logic.carouselController.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(
                                logic.current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      );
    });
  }
}
