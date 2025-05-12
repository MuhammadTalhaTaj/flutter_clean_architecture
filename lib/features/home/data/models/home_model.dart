class CommunityEventModel {
  late String id;
  late String eventName;
  late String eventDescription;
  late String startData;
  late String endData;

  CommunityEventModel({
    this.id = '',
    this.eventName = 'Event Name',
    this.eventDescription = '',
    this.startData = '2025-03-25T00:00:00',
    this.endData = '',
  });

  CommunityEventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    eventName = json['event_name'] ?? '';
    eventDescription = json['event_description'] ?? '';
    startData = json['start_data'] ?? '';
    endData = json['end_data'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'event_name': eventName,
      'event_description': eventDescription,
      'start_data': startData,
      'end_data': endData,
    };
  }

  CommunityEventModel.skeleton() {
    id = 'event_001';
    eventName = 'Sample Event';
    eventDescription = 'This is a sample event description.';
    startData = '2025-03-25T00:00:00';
    endData = '2025-03-25T02:00:00';
  }
}


class CommunityArticleModel {
  late String id;
  late String articleName;
  late String articleDetails;
  late String ageRange;
  late String authorName;
  late String authorImage;

  CommunityArticleModel({
    this.id = '',
    this.articleName = 'Learn how to grow child',
    this.articleDetails = 'Teach you how to grow child',
    this.ageRange = '',
    this.authorName = 'john',
    this.authorImage = 'https://iili.io/dzncSNS.png',
  });

  CommunityArticleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    articleName = json['article_name'] ?? '';
    articleDetails = json['article_details'] ?? '';
    ageRange = json['age_range'] ?? '';
    authorName = json['author_name'] ?? '';
    authorImage = json['author_image'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'article_name': articleName,
      'article_details': articleDetails,
      'age_range': ageRange,
      'author_name': authorName,
      'author_image': authorImage,
    };
  }

  CommunityArticleModel.skeleton() {
    id = 'article_001';
    articleName = 'Sample Article Title';
    articleDetails = 'This is a sample article content.';
    ageRange = '4-6';
    authorName = 'Sample Author';
    authorImage = 'https://example.com/sample_author.png';
  }
}
