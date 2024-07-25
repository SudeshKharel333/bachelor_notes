import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:my_flutter_app/core/enums/validation_type.dart';

import '../../core/app_managers/assets_managers.dart';
import '../../routes/app_routes.dart';
import '../../widgets/input_fields.dart';
import 'shop_home_logic.dart';

class NotesHomePage extends StatefulWidget {
  const NotesHomePage({Key? key})
      : super(
            key:
                key); //this line defines a constant constructor for the ShopHomePage widget, which can optionally take a Key parameter and passes this key to its superclass. This setup is common in Flutter when creating custom widgets.

  @override
  State<ShopHomePage> createState() => _ShopHomePageState();
}

class _ShopHomePageState extends State<ShopHomePage> {
  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<ShopHomeLogic>();

    return GetBuilder<ShopHomeLogic>(builder: (logic) {
      return Scaffold(
        backgroundColor: Colors.blue.shade50,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                const SizedBox(
                  height: 130,
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(32))),
                ),
                const Positioned(
                  top: 75,
                  left: 60,
                  right: 60,
                  child: CostumeFormField.search(
                    validationType: ValidationType.common,
                  ),
                ),
              ],
            ),
            Gap(6),
            CarouselSlider(
                carouselController: logic.carouselController,
                items: logic.imgList
                    .map((item) => Container(
                          child: Image.network(item),
                        ))
                    .toList(),
                options: CarouselOptions(
                    height: 120.0,
                    autoPlay: true,
                    enlargeFactor: .1,
                    viewportFraction: .6,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    pauseAutoPlayOnTouch: true,
                    enlargeCenterPage: true,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Text(
                    "Catagories",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.blue.shade900),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 100,
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 4.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.noticeDetailsScreen);
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    AssetManager.appLogo,
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                const Gap(3),
                                const Expanded(
                                  child: Center(child: Text("Fashion")),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      );
    });
  }
}
