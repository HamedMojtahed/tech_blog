import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';

import 'my_colors.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      color: solidColors.dividerColor,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

//
class MainTagsWidget extends StatelessWidget {
  MainTagsWidget({
    Key? key,
    required this.texttheme,
    required this.index,
  }) : super(key: key);

  final TextTheme texttheme;
  var index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
        gradient: LinearGradient(
            colors: gradiantColors.tags,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          children: [
            ImageIcon(
              Image.asset(Assets.icons.hashtagicon.path).image,
              color: Colors.white,
              size: 16,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              tagList[index].title,
              style: texttheme.headline2,
            ),
          ],
        ),
      ),
    );
  }
}
