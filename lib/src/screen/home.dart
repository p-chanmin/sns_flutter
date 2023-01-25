import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sns_flutter/src/controller/feed_controller.dart';
import 'package:sns_flutter/src/screen/user/register.dart';
import 'package:sns_flutter/src/widget/feed_item.dart';
import 'feed/feed_create.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final feedController = Get.put(FeedController());

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    bool result = await feedController.feedIndex();
    if (!result) {
      Get.off(const Register());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My SNS')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => FeedCreate());
          // 글쓰기 버튼을 눌를 경우 동작
          // FeedCreate 실행
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const FeedCreate()),
          // );
        },
        child: Icon(Icons.create),
      ),
      body: GetBuilder<FeedController>(
        builder: (c) {
          return ListView.separated(
            itemBuilder: (context, index) => FeedItem(c.feedList[index]),
            separatorBuilder: (context, index) => Divider(),
            itemCount: c.feedList.length,
          );
        },
      ),
    );
  }
}
