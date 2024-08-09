import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeless_words/controller/word_controller.dart';
import 'package:timeless_words/model/word_model.dart';
import 'package:badges/badges.dart' as badges;
import 'package:url_launcher/url_launcher.dart'; // url_launcher 패키지 임포트

class DetailPage extends StatefulWidget {
  final Word word;
  const DetailPage({super.key, required this.word});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isKorVisible = false;

  // SMS 전송 함수
  void _sendSMS(String message) async {
    final Uri smsUri = Uri(
      scheme: 'sms',
      path: '', // 여기에 특정 전화번호를 지정할 수도 있습니다
      queryParameters: <String, String>{
        'body': message, // 메시지 본문에 전달할 텍스트
      },
    );
    if (await canLaunchUrl(smsUri)) {
      await launchUrl(smsUri);
    } else {
      print('Could not launch $smsUri');
    }
  }

  @override
  Widget build(BuildContext context) {
    final WordController wordController = Get.find();

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Image.asset(
                wordController.darkMode.value
                    ? 'assets/img/sun.png'
                    : 'assets/img/moon.png',
                width: 24,
              ),
              onPressed: () {
                wordController.changeTheme();
              },
            ),
            InkWell(
              onTap: () => Get.toNamed('/book'),
              child: badges.Badge(
                position: badges.BadgePosition.topEnd(top: -10, end: -10),
                badgeContent: Text('${wordController.bookmarkedWords.length}',
                    style: const TextStyle(color: Colors.white, fontSize: 12)),
                child: Image.asset(
                  wordController.darkMode.value
                      ? 'assets/img/book-dark.png'
                      : 'assets/img/book.png',
                  width: 24,
                ),
              ),
            ),
            const SizedBox(width: 26),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 30),
              Text(
                widget.word.id.toString(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 60),
              Text(
                widget.word.eng,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20),
              isKorVisible
                  ? SizedBox(
                      height: 100,
                      child: Text(
                        widget.word.kor,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    )
                  : Container(height: 100),
              Text(
                widget.word.writer,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      setState(() {
                        isKorVisible = !isKorVisible;
                      });
                    },
                    icon: Icon(
                      Icons.translate,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    label: Text(
                      isKorVisible ? 'Hide' : 'Show',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  Obx(() {
                    bool isBookmarked =
                        wordController.isBookmarked(widget.word.id);
                    return TextButton.icon(
                      onPressed: () {
                        wordController.toggleBookmark(widget.word);
                      },
                      icon: Icon(
                        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      label: Text(
                        isBookmarked ? 'Remove' : 'Add',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    );
                  }),
                  TextButton.icon(
                    onPressed: () {
                      _sendSMS(widget.word.eng);
                    },
                    icon: Icon(
                      Icons.sms,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    label: Text(
                      'Send SMS',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
