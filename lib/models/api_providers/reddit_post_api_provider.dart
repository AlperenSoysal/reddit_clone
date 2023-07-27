import 'package:dio/dio.dart';

class RedditPostApiProvider {
  static Future<List<dynamic>?> fetchHomePagePosts() async {
    Dio dio = Dio();
    var response = await dio.get('https://www.reddit.com/r/flutterdev/top.json?count=20');

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = response.data as Map<String, dynamic>;
      final List<dynamic> postsJson = responseBody["data"]["children"];
      return postsJson;
    }
    return null;
  }
}
