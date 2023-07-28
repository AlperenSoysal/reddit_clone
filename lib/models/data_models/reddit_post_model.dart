class RedditPostModel {
  final String title;
  final String description;
  final String subReddit;
  final String author;
  final String? thumbnailUrl;
  final double? thumbnailWidth;
  final double? thumbnailHeight;

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
    return RedditPostModel(
      title: json['title'],
      description: json['selftext'],
      subReddit: json['subreddit'],
      author: json['author'],
      thumbnailUrl: json['thumbnail'],
      thumbnailWidth: json['thumbnail_width'],
      thumbnailHeight: json['thumbnail_height'],
    );
  }
}
