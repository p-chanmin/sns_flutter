import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/feed_controller.dart';
import '../../model/feed_model.dart';
import '../../widget/my_profile.dart';

class FeedShow extends StatefulWidget {
  final FeedModel feed;
  const FeedShow(this.feed, {super.key});

  @override
  State<FeedShow> createState() => _FeedShowState();
}

class _FeedShowState extends State<FeedShow> {
  final feedController = Get.put(FeedController());

  @override
  void initState() {
    super.initState();
    _feedShow();
  }

  void _feedShow() async {
    feedController.feedShow(widget.feed.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('피드'),
      ),
      body: GetBuilder<FeedController>(builder: (b) {
        FeedModel? feed = b.feedOne;
        if (feed == null) {
          return CircularProgressIndicator();
        }
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  MyProfile(),
                  SizedBox(width: 20),
                  Text(
                    '${widget.feed.name}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text('${widget.feed.content}'),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: SizedBox()),
                  Text('${widget.feed.createAt}'),
                ],
              ),
              SizedBox(height: 20),
              Visibility(
                visible: (feed?.isMe! == true),
                child: Row(
                  children: [
                    Expanded(child: SizedBox()),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('수정'),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('피드 삭제'),
                                content: Text('정말 삭제하시겠습니까'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      feedController.feedDelete(feed.id!);
                                      Navigator.pop(context, 'OK');
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Text('삭제'),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
