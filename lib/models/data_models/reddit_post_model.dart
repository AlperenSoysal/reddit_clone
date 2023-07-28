class RedditPostModel {
  final String title;
  final String description;
  final String subReddit;
  final String author;
  final String? thumbnailUrl;
  final int? thumbnailWidth;
  final int? thumbnailHeight;

  RedditPostModel({
    required this.title,
    required this.description,
    required this.subReddit,
    required this.author,
    this.thumbnailUrl,
    this.thumbnailWidth,
    this.thumbnailHeight,
  });

  Map<String, dynamic> toJSON() => {
        'title': title,
        'email': description,
        'phone_number': subReddit,
        'first_name': author,
        'last_name': thumbnailUrl,
        'referral_code': thumbnailWidth,
        'referral_points': thumbnailHeight,
      };

  factory RedditPostModel.fromJSON(Map<String, dynamic> json) {
    final Map<String, dynamic> postDataJson = json["data"];
    return RedditPostModel(
      title: postDataJson['title'],
      description: postDataJson['selftext'],
      subReddit: postDataJson['subreddit'],
      author: postDataJson['author'],
      thumbnailUrl: postDataJson['thumbnail'],
      thumbnailWidth: postDataJson['thumbnail_width'],
      thumbnailHeight: postDataJson['thumbnail_height'],
    );
  }
}
