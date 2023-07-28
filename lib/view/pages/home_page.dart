import 'package:flutter/material.dart';
import 'package:reddit_clone/view/main_components.dart';
import 'package:reddit_clone/view/theme/app_colors.dart';
import '../../models/data_models/reddit_post_model.dart';
import '../theme/font_styles.dart';

class RedditHomePage extends StatefulWidget {
  const RedditHomePage({Key? key}) : super(key: key);

  @override
  State<RedditHomePage> createState() => _RedditHomePageState();
}

class _RedditHomePageState extends State<RedditHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBlue,
      body: CustomScrollView(
        slivers: [
          const CustomAppBar(title: "Reddit"),
          SliverList(
            delegate: SliverChildListDelegate(_buildRedditPostList()),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildRedditPostList() {
    final List<Widget> listItems = [];
    for (int i = 0; i < 10; i++) {
      listItems.add(
        RedditPost(
          redditPost: RedditPostModel(
            title: "I Have concern",
            description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard"
                " dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            subReddit: "FlutterDev",
            author: "alpoSS",
            thumbnailHeight: 50,
            thumbnailWidth: 140,
            thumbnailUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzqWqVyTbBJ6tFqa_LYLxq4rqbSv6rVQKzUg&usqp=CAU",
          ),
        ),
      );
    }
    listItems.add(
      SizedBox(
        height: MediaQuery.of(context).padding.bottom + CSizes.triplePadding,
      ),
    );
    return listItems;
  }
}
