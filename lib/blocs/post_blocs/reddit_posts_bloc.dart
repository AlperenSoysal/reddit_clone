import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/models/api_providers/reddit_post_api_provider.dart';
import 'package:reddit_clone/models/data_models/reddit_post_model.dart';

abstract class AbstractRedditPostsState {
  const AbstractRedditPostsState();
}

class RedditPostsLoadingState implements AbstractRedditPostsState {
  const RedditPostsLoadingState();
}

class RedditPostsLoadedState implements AbstractRedditPostsState {
  final List<RedditPostModel> redditPosts;

  RedditPostsLoadedState({
    required this.redditPosts,
  });
}

class RedditPostsErrorState implements AbstractRedditPostsState {
  final String error;
  RedditPostsErrorState(this.error);
}

abstract class AbstractRedditPostsEvent {}

class FetchRedditPostsEvent implements AbstractRedditPostsEvent {
  FetchRedditPostsEvent();
}

class SwitchTopicEvent implements AbstractRedditPostsEvent {
  final String topic;
  SwitchTopicEvent({required this.topic});
}

class RedditPostsBloc extends Bloc<AbstractRedditPostsEvent, AbstractRedditPostsState> {
  RedditPostsBloc() : super(const RedditPostsLoadingState()) {
    on<FetchRedditPostsEvent>(_onFetch);
    on<SwitchTopicEvent>(_onSwitchTopic);
  }

  Future<void> _onFetch(FetchRedditPostsEvent event, Emitter<AbstractRedditPostsState> emitter) async {
    try {
      emitter(
        const RedditPostsLoadingState(),
      );
      final List<dynamic>? postsJson = await RedditPostApiProvider.fetchHomePagePosts(topic: "flutterdev");
      if (postsJson == null) {
        emitter(RedditPostsErrorState("Some error from api"));
      } else {
        List<RedditPostModel> redditPostList = postsJson.map((postAsJson) => RedditPostModel.fromJSON(postAsJson)).toList();
        emitter(
          RedditPostsLoadedState(
            redditPosts: redditPostList,
          ),
        );
      }
    } catch (e) {
      emitter(RedditPostsErrorState(e.toString()));
    }
  }

  Future<void> _onSwitchTopic(SwitchTopicEvent event, Emitter<AbstractRedditPostsState> emitter) async {
    try {
      emitter(
        const RedditPostsLoadingState(),
      );
      final List<dynamic>? postsJson = await RedditPostApiProvider.fetchHomePagePosts(topic: event.topic);
      if (postsJson == null) {
        emitter(RedditPostsErrorState("Some error from api"));
      } else {
        List<RedditPostModel> redditPostList = postsJson.map((postAsJson) => RedditPostModel.fromJSON(postAsJson)).toList();
        emitter(
          RedditPostsLoadedState(
            redditPosts: redditPostList,
          ),
        );
      }
    } catch (e) {
      emitter(RedditPostsErrorState(e.toString()));
    }
  }
}
