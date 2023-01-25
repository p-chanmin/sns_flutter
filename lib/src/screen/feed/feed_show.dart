import 'package:flutter/material.dart';
import '../../widget/my_profile.dart';

class FeedShow extends StatelessWidget {
  const FeedShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('피드'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                MyProfile(),
                SizedBox(width: 20),
                Text(
                  '홍길동',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
                '나라의 말이 중국과 달라 문자와 서로 통하지 아니하므로 이런 까닭으로 어리석은 백성이 이르고자 할 바가 있어도 마침내 제 뜻을 능히 펴지 못하는 사람이 많노라. 내가 이를 위해 가엽게 여겨 새로 스물여덟 글자를 만드노니 사람마다 하여금 쉽게 익혀 날마다 쓰는 것이 편안케 하고자 할 따름이니라'),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: SizedBox()),
                Text('2023-01-01'),
              ],
            ),
            SizedBox(height: 20),
            Row(
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
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: Text('OK'),
                              ),
                            ],
                          );
                        });
                  },
                  child: Text('삭제'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
