import 'package:flutter/material.dart';
import 'package:sns_flutter/src/screen/feed/feed_show.dart';
import 'package:sns_flutter/src/widget/my_profile.dart';

import '../model/feed_model.dart';

class FeedItem extends StatelessWidget {
  final FeedModel feed;
  const FeedItem(this.feed, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FeedShow(feed)),
        );
      },
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyProfile(),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${feed.name}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${feed.createAt}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text('${feed.content}')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
