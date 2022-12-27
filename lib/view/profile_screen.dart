// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/components/my_colors.dart';
import 'package:techblog/components/my_component.dart';
import 'package:techblog/components/my_strings.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({
    Key? key,
    required this.size,
    required this.texttheme,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final TextTheme texttheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: solidColors.scafoldBg,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //! ProfileAvatar
              Image.asset(
                Assets.images.avatar.path,
                height: 100,
              ),
              //! SizedBox
              const SizedBox(height: 12),
              //! EditProfileAvatar Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(
                    Image.asset(
                      Assets.icons.bluePen.path,
                    ).image,
                    color: solidColors.seeMore,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    MyStrings.editProfileAvatar,
                    style: texttheme.headline3,
                  )
                ],
              ),
              //! SizedBox
              const SizedBox(height: 55),
              //! User Detail
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'حامد مجتهد',
                    style: texttheme.headline4,
                  ),
                  Text(
                    'mojtahedhamed0@gmail.com',
                    style: texttheme.headline4,
                  ),
                ],
              ),
              //! SizedBox
              const SizedBox(height: 40),
              //! Favarite Item
              //line
              TechDivider(size: size),
              //textbuttom
              InkWell(
                onTap: () {},
                splashColor: solidColors.primeryColor,
                child: SizedBox(
                  height: 45,
                  child: Center(
                    child: Text(
                      MyStrings.myFavoriteBlog,
                      style: texttheme.headline4,
                    ),
                  ),
                ),
              ),
              TechDivider(size: size),
              //textbuttom
              InkWell(
                onTap: () {},
                splashColor: solidColors.primeryColor,
                child: SizedBox(
                  height: 45,
                  child: Center(
                    child: Text(
                      MyStrings.myFavoritePodcas,
                      style: texttheme.headline4,
                    ),
                  ),
                ),
              ),
              TechDivider(size: size),
              //textbuttom
              InkWell(
                onTap: () {},
                splashColor: solidColors.primeryColor,
                child: SizedBox(
                  height: 45,
                  child: Center(
                    child: Text(
                      MyStrings.logout,
                      style: texttheme.headline4,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
