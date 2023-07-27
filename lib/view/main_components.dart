import 'package:flutter/material.dart';
import 'package:reddit_clone/view/theme/app_colors.dart';
import 'package:reddit_clone/view/theme/font_styles.dart';

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
