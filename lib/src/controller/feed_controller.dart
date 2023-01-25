import 'dart:io';

import 'package:get/get.dart';
import 'package:sns_flutter/src/model/feed_model.dart';
import 'package:sns_flutter/src/repository/feed_repository.dart';

class FeedController extends GetxController {
  final feedRepo = Get.put(FeedRepository());
  List feedList = [];
  FeedModel? feedOne = null;

  Future<bool> feedIndex() async {
    List? body = await feedRepo.feedIndex();
    if (body == null) {
      return false;
    }
    List feed = body.map(((e) => FeedModel.parse(e))).toList();
    feedList = feed;
    update();
    return true;
  }

  Future<FeedModel?> feedShow(int id) async {
    Map? body = await feedRepo.feedShow(id);
    if (body == null) {
      return null;
    }
    FeedModel feed = FeedModel.parse(body);
    update();
    feedOne = feed;
    return feed;
  }

  feedDelete(int id) async {
    await feedRepo.feedDelete(id);
    await feedIndex();
  }

  Future<int?> imageUpload(String path, String name) async {
    File file = File(path);
    Map? body = await feedRepo.fileUpload(file, name);
    return (body == null) ? null : body['id'];
  }
}
