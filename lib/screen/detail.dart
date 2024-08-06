import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeless_words/controller/app_controller.dart';
import 'package:timeless_words/screen/book.dart';
import 'package:badges/badges.dart' as badges;
import 'package:timeless_words/screen/home.dart';

class Detail extends StatelessWidget {
  Detail({super.key});
  final controller = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: _appBar(),
        body: _body(item: Get.arguments),
      ),
    );
  }

  // appbar
  _appBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Get.offAll(() => Home());
        },
        icon: const Icon(Icons.arrow_back),
      ),
      actions: [
        IconButton(
          onPressed: () => controller.changeTheme(),
          icon: Image.asset(
            controller.darkMode.value
                ? 'assets/img/sun.png'
                : 'assets/img/moon.png',
            width: 24,
          ),
        ),
        InkWell(
          onTap: () => Get.to(() => Book()),
          child: badges.Badge(
            position: badges.BadgePosition.topEnd(top: -10, end: -10),
            badgeContent: Text(
              controller.addcount.value.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            child: Image.asset(
              controller.darkMode.value
                  ? 'assets/img/book-dark.png'
                  : 'assets/img/book.png',
              width: 24,
            ),
          ),
        ),
        const SizedBox(width: 26),
      ],
    );
  }

  // body
  _body({required item}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(item.id.toString()),
          Text(item.eng),
          item.showing == 0 ? Text(item.kor) : Text(''),
          Text(item.writer),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                  onPressed: () {
                    controller.toggleShow(item.id, item.showing);
                  },
                  child: const Text('한글')),
              const SizedBox(width: 20),
              OutlinedButton(
                  onPressed: () {
                    controller.toggleAdd(item.id, item.adding);
                  },
                  child: const Text('저장')),
            ],
          ),
        ],
      ),
    );
  }
}
