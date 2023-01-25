import 'package:flutter/material.dart';
import 'package:sns_flutter/src/screen/feed/feed_show.dart';
import 'package:sns_flutter/src/widget/my_profile.dart';

class FeedItem extends StatelessWidget {
  const FeedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FeedShow()),
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
                    children: const [
                      Text(
                        '홍길동',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '2023-01-19',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Text(
                      'aaaaazzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
