import 'package:flutter/material.dart';
import 'package:reddit_clone/view/main_components.dart';
import 'package:reddit_clone/view/theme/app_colors.dart';

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
            delegate: SliverChildListDelegate(_buildList()),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildList() {
    final List<Widget> listItems = [];
    for (int i = 0; i < 10; i++) {
      listItems.add(
        Padding(
          padding: const EdgeInsets.only(
            top: CSizes.triplePadding * 2,
            left: CSizes.triplePadding,
            right: CSizes.triplePadding,
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
                      Column(
                        children: [
                          const Text(
                            "FlutterDev",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: CSizes.normal,
                              fontWeight: CWeights.normal,
                            ),
                          ),
                          RichText(
                            text: const TextSpan(
                              text: 'by',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: CSizes.small,
                                fontWeight: CWeights.normal,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' alpooSS',
                                  style: TextStyle(
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
                    ],
                  ),
                  const Icon(
                    Icons.child_friendly_outlined,
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(
                height: CSizes.triplePadding * 2,
              ),
              const Text(
                "I've a concern regarding Riverpod",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: CSizes.large,
                  fontWeight: CWeights.bold,
                ),
              ),
              const SizedBox(
                height: CSizes.triplePadding * 2,
              ),
              if (i % 2 == 0)
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzqWqVyTbBJ6tFqa_LYLxq4rqbSv6rVQKzUg&usqp=CAU',
                  fit: BoxFit.fill,
                ),
              const SizedBox(
                height: CSizes.triplePadding,
              ),
              const Text(
                "I know I can wrap the widget with `Consumer` instead of using `ConsumerWidget`). RP also performs dependency injection, caching and replaces packages like `get_it`. This results in a code that's tightly coupled to a package and makes it harder to switch to a different state management (also using freezed for business logic reduces a lot of redundancy, however ideally I want my business logic to be truly independent, this’s not a criticism to RP per se).\n\n\nAlso in the case of BLoC I find it very easy to architecture my app, the bloc resides in the controller/ presentation layer, it receives events from the UI, then calls the repository and emits a state. Everything is clearly separated and has only one functionality.\n\n\nTLDR: riverpod is great but results in a code that's tightly coupled.\n\n\nI'd love to hear other perspectives on this topic and whethe",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: CSizes.normal,
                  fontWeight: CWeights.normal,
                ),
              ),
              const SizedBox(
                height: CSizes.triplePadding * 2,
              ),
              const Divider(
                color: Colors.white,
              ),
            ],
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
