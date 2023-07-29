import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/blocs/post_blocs/reddit_posts_bloc.dart';
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
    return BlocProvider<RedditPostsBloc>(
      create: (BuildContext context) => RedditPostsBloc()..add(FetchRedditPostsEvent()),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: SwitchTopicButton(),
        backgroundColor: AppColors.mainBlue,
        body: NestedScrollView(
          floatHeaderSlivers: false,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              const CustomAppBar(title: "Reddit"),
            ];
          },
          body: BlocBuilder<RedditPostsBloc, AbstractRedditPostsState>(
            builder: (context, state) {
              if (state is RedditPostsLoadedState) {
                return ListView(
                  padding: EdgeInsets.zero,
                  children: _buildRedditPostList(state.redditPosts),
                );
              } else if (state is RedditPostsErrorState) {
                return ErrorOccurredWidget(
                  reload: () => context.read<RedditPostsBloc>().add(FetchRedditPostsEvent()),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.redditRed,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  List<Widget> _buildRedditPostList(List<RedditPostModel> redditPosts) {
    final List<Widget> listItems = [];
    for (var redditPost in redditPosts) {
      listItems.add(
        RedditPost(
          redditPost: RedditPostModel(
            title: redditPost.title,
            description: redditPost.description,
            subReddit: redditPost.subReddit,
            author: redditPost.author,
            thumbnailUrl: redditPost.thumbnailUrl,
            thumbnailHeight: redditPost.thumbnailHeight,
            thumbnailWidth: redditPost.thumbnailWidth,
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
