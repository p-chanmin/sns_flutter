import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sns_flutter/src/repository/feed_repo.dart';
import 'package:sns_flutter/src/repository/user_repo.dart';

class FeedCreate extends StatefulWidget {
  const FeedCreate({super.key});

  @override
  State<FeedCreate> createState() => _FeedCreateState();
}

class _FeedCreateState extends State<FeedCreate> {
  final _textController = TextEditingController();
  final snackBar = const SnackBar(
    content: Text('글을 작성 해 주세요'),
  );
  final ImagePicker _picker = ImagePicker();
  final feedRepo = FeedRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SNS 작성'),
        actions: [
          IconButton(
            onPressed: () {
              String text = _textController.text;
              if (text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {
                // 저장
              }
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              keyboardType: TextInputType.multiline,
              expands: true,
              minLines: null,
              maxLines: null,
              decoration: InputDecoration(contentPadding: EdgeInsets.all(20)),
            ),
          ),
          IconButton(
            onPressed: () async {
              final file = await _picker.pickImage(source: ImageSource.gallery);
              String result = await feedRepo.upload(file!.path, file.name);
              Map json = jsonDecode(result);
              print(json);
            },
            icon: Icon(Icons.image),
          ),
        ],
      ),
    );
  }
}
