import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:my_flutter_app/routes/app_routes.dart';
import 'package:my_flutter_app/screen/home/home_logic.dart';
import '../../core/app_managers/assets_managers.dart';
import '../../utils/emum.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLogic>(builder: (logic) {
      return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: const Center(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            const Center(
                child: Icon(
                  Icons.timer,
                  color: Colors.white,
                )),
            const Center(
                child: Icon(
                  Icons.abc,
                  color: Colors.black,
                )),
            Center(
                child: GestureDetector(
                  onTap: () {
                    print("clicked vayo");
                  },
                  child: IconButton(
                      color: Colors.red,
                      onPressed: () {
                        print("icon pressed");
                      },
                      icon: Icon(Icons.more_vert)),
                )),
            SizedBox(width: 10),
          ],
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text(
            "Test Screen",
            style: TextStyle(color: Colors.blue),
          ),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(22),
                            topRight: Radius.circular(22))),
                    width: 100,
                    height: 100,
                    child: Image.asset(AssetManager.appLogo)),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text(
                        'count',
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.red,
                        child: const Center(
                          child: Text(
                            maxLines: 1,
                            ' rajesh rajesh rajesh rajesh rajesh rajesh rajesh rajesh rajesh rajesh',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
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
                      height: 50,
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 4.0),
                        child: GestureDetector(
                          onTap: (){
                            Get.toNamed(AppRoutes.noticeDetailsScreen);
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      AssetManager.appLogo,
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Spacer(),
                                              Text(
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                "exp date: ${logic.notice[index]
                                                    .publishDate}",
                                                style: const TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.red,
                                                    fontWeight: FontWeight
                                                        .normal),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Container(
                                            width: 200,
                                            child: Text(
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              logic.notice[index].title ?? "-",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Text(
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            logic.notice[index].description ?? "n/a",
                                            style: const TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: logic.notice.length,
                ),
              ),
              FilledButton(
                onPressed: () {
                  print("pressed");
                  Get.toNamed(AppRoutes.memberListScreen);

                },
                onLongPress: () {
                  print(" long pressed");
                },
                child: const SizedBox(
                  width: 60,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.add),
                      Text("test"),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(value: logic.selected, onChanged: (bool? value) {
                    setState(() {
                      logic.selected = value!;
                    });
                  }),
                  Text("please select")
                ],
              ),

              const Row(
                children: [
                  Text("data"),
                  Spacer(),
                  Text("data"),
                ],
              ),

              // OutlinedButton(
              //   onPressed: () {},
              //   child: const SizedBox(
              //     width: 60,
              //     child: Row(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Icon(Icons.add),
              //         Text("test"),
              //       ],
              //     ),
              //   ),
              // ),
              // ElevatedButton(
              //   onPressed: () {},
              //   style: ButtonStyle(
              //       backgroundColor: WidgetStateProperty.all(Colors.red),
              //       shape: WidgetStateProperty.all(RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(40.0),
              //           side: BorderSide(color: Colors.green, width: 3)))),
              //   child: Text(
              //     "rajesh",
              //     style:
              //         TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              //   ),
              // ),

              SegmentedButton(
                segments: const [
                  ButtonSegment(
                      value: NoticeStatus.read,
                      label: Text("read"),
                      icon: Icon(Icons.close)),
                  ButtonSegment(
                      value: NoticeStatus.unread,
                      label: Text("unread"),
                      icon: Icon(Icons.close)),
                  ButtonSegment(
                      value: NoticeStatus.all,
                      label: Text("all"),
                      icon: Icon(Icons.all_out))
                ],
                selected: <NoticeStatus>{logic.noticeView},
                onSelectionChanged: (Set<NoticeStatus> value) {
                  setState(() {
                    logic.noticeView = value.first;
                  });
                },

              )
              // Expanded(flex: 3, child: Text('hello'))
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton.extended(
        //   backgroundColor: Colors.blue,
        //   foregroundColor: Colors.white,
        //   elevation: 4,
        //   onPressed: () {
        //     print("btn pressed");
        //   },
        //   label: Text("sddd sdfasd"),
        //   // child: Padding(
        //   //   padding: const EdgeInsets.all(8.0),
        //   //   child: const Icon(Icons.ac_unit),
        //   // ),
        // ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    });
  }
}