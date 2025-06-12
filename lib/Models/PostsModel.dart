class PostsModel {
  PostsModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostsModel.fromJson(dynamic json) {
    return PostsModel(
      userId: json['userId'] as num,
      id: json['id'] as num,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  final num userId;
  final num id;
  final String title;
  final String body;

  PostsModel copyWith({
    num? userId,
    num? id,
    String? title,
    String? body,
  }) => PostsModel(
    userId: userId ?? this.userId,
    id: id ?? this.id,
    title: title ?? this.title,
    body: body ?? this.body,
  );

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}