// ignore_for_file: public_member_api_docs, sort_constructors_first
//
class HashTagModel {
  String title;
  //
  HashTagModel({
    required this.title,
  });
}

class BlogModel {
  int id;
  String imageUrl;
  String title;
  String writer;
  String writerImageUrl;
  String date;
  String content;
  String views;

  BlogModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.writer,
    required this.writerImageUrl,
    required this.date,
    required this.content,
    required this.views,
  });
}

class PodCastsModel {
  int id;
  String imageUrl;
  String title;

  PodCastsModel({
    required this.id,
    required this.imageUrl,
    required this.title,
  });
}
