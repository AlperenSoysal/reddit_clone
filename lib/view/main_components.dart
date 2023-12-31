import 'dart:math';
import 'package:flutter/material.dart';
import 'package:reddit_clone/view/theme/app_colors.dart';
import 'package:reddit_clone/view/theme/font_styles.dart';
import '../blocs/post_blocs/reddit_posts_bloc.dart';
import '../models/data_models/reddit_post_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 250.0,
      backgroundColor: AppColors.mainLightBlue,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: true,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          "Reddit",
          style: TextStyle(
            color: Colors.white,
            fontWeight: CWeights.normal,
            fontSize: CSizes.large,
          ),
        ),
        background: Image.network(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzqWqVyTbBJ6tFqa_LYLxq4rqbSv6rVQKzUg&usqp=CAU',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class RedditPost extends StatelessWidget {
  final RedditPostModel redditPost;
  const RedditPost({
    Key? key,
    required this.redditPost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: CSizes.triplePadding,
        left: CSizes.doublePadding,
        right: CSizes.doublePadding,
      ),
      padding: const EdgeInsets.only(
        top: CSizes.doublePadding,
        left: CSizes.doublePadding * 2,
        right: CSizes.doublePadding * 2,
      ),
      decoration: BoxDecoration(
        color: AppColors.mainLightBlue.withOpacity(.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(
                    width: CSizes.triplePadding,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'by',
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: CSizes.small,
                        fontWeight: CWeights.normal,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' ${redditPost.author}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: CSizes.small,
                            fontWeight: CWeights.normal,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    redditPost.subReddit,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: CSizes.normal,
                      fontWeight: CWeights.normal,
                    ),
                  ),
                  const SizedBox(
                    width: CSizes.triplePadding,
                  ),
                  const Icon(
                    Icons.topic,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: CSizes.triplePadding * 2,
          ),
          Text(
            redditPost.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: CSizes.large,
              fontWeight: CWeights.bold,
            ),
          ),
          const SizedBox(
            height: CSizes.triplePadding * 2,
          ),
          if (redditPost.thumbnailUrl != null &&
              redditPost.thumbnailUrl != "self" &&
              redditPost.thumbnailUrl != "default" &&
              redditPost.thumbnailUrl != "")
            Image.network(
              redditPost.thumbnailUrl!,
              height: redditPost.thumbnailHeight?.toDouble(),
              width: redditPost.thumbnailWidth?.toDouble(),
              fit: BoxFit.fill,
            ),
          const SizedBox(
            height: CSizes.triplePadding,
          ),
          Text(
            redditPost.description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: CSizes.normal,
              fontWeight: CWeights.normal,
            ),
          ),
          const SizedBox(
            height: CSizes.triplePadding * 2,
          ),
        ],
      ),
    );
  }
}

class ErrorOccurredWidget extends StatelessWidget {
  const ErrorOccurredWidget({
    Key? key,
    required this.reload,
    this.errorText,
    this.errorStyle,
  }) : super(key: key);

  final VoidCallback reload;
  final String? errorText;
  final TextStyle? errorStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorText ?? "Bir şeyler ters gitti tekrar dene.",
            textAlign: TextAlign.center,
            style: errorStyle ??
                const TextStyle(
                  color: Colors.white,
                  fontSize: CSizes.normal,
                  fontWeight: CWeights.normal,
                ),
          ),
          const SizedBox(
            height: CSizes.triplePadding,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(32),
            ),
            child: const Text(
              "Tekrar Dene",
              style: TextStyle(
                color: Colors.white,
                fontSize: CSizes.normal,
                fontWeight: CWeights.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SwitchTopicButton extends StatelessWidget {
  SwitchTopicButton({Key? key}) : super(key: key);

  final List<String> topicList = [
    "trading",
    "flutterdev",
    "spacex",
    "istanbul",
    "elonmusk",
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final int randomIndex = Random().nextInt(topicList.length);
        context.read<RedditPostsBloc>().add(SwitchTopicEvent(topic: topicList[randomIndex]));
      },
      child: Container(
        width: 70,
        height: 70,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.twitterBlue,
        ),
        child: const Center(
          child: Text(
            "Switch Topic",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: CSizes.small,
              fontWeight: CWeights.normal,
            ),
          ),
        ),
      ),
    );
  }
}
