import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeless_words/screen/detail.dart';
import '../controller/app_controller.dart';
import 'package:timeless_words/theme/themes.dart';

class Book extends StatelessWidget {
  Book({super.key});
  final controller = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: _appBar(context),
        body: _body(),
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        '저장',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      actions: [
        badges.Badge(
          badgeStyle: const badges.BadgeStyle(
            padding: EdgeInsets.all(10),
          ),
          position: badges.BadgePosition.topEnd(top: 0, end: 0),
          badgeContent: Text(
            controller.addcount.value.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        const SizedBox(width: 26),
      ],
    );
  }
  // appbar end

  _body() {
    return ListView.builder(
      itemCount: controller.filterdWords.length,
      itemBuilder: (_, index) {
        final item = controller.filterdWords[index];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            onTap: () {
              Get.to(() => Detail(), arguments: item);
            },
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            tileColor: controller.darkMode.value ? Themes.darkBg1 : Themes.bg3,
            minLeadingWidth: 16,
            leading: Text(item.id.toString(), style: TextStyle(fontSize: 14),),
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
              child: Text(item.eng),
            ),
          ),
        );
      },
    );
  }
// body end
}
