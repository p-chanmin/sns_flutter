class FeedModel {
  int? id;
  String? name;
  int? imageId;
  String? content;
  DateTime? createAt;

  FeedModel.parse(Map m) {
    id = m['id'];
    content = m['content'];
    createAt = DateTime.parse(m['created_At']);
    name = m['user_name'];
    imageId = m['image_id'];
  }
}
