import 'package:flutter/material.dart';
import 'package:sns_flutter/src/widget/feed_item.dart';
import 'feed/feed_create.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My SNS')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 글쓰기 버튼을 눌를 경우 동작
          // FeedCreate 실행
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FeedCreate()),
          );
        },
        child: Icon(Icons.create),
      ),
      body: ListView(
        children: [
          FeedItem(),
          FeedItem(),
          FeedItem(),
          FeedItem(),
        ],
      ),
    );
  }
}
