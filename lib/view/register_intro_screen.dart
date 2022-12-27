// ignore_for_file: unused_local_variable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/components/my_colors.dart';

import 'package:techblog/components/my_strings.dart';
import 'package:techblog/view/my_categories.dart';
import 'package:validators/validators.dart';

class RegisterIntroScreen extends StatelessWidget {
  const RegisterIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
//
    TextTheme textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
//

    return SafeArea(
      child: Scaffold(
        backgroundColor: solidColors.scafoldBg,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //! Picture
              SvgPicture.asset(
                Assets.images.teckbot.path,
                height: 100,
              ),
              //! Text
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: MyStrings.wellcome,
                    style: textTheme.headline4,
                  ),
                ),
              ),
              //! Button
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: ElevatedButton(
                  //
                  child: const Text(
                    "بزن بریم",
                  ),
                  //
                  onPressed: () {
                    _showEmailBottomSheet(context, size, textTheme);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showEmailBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Text
                  Text(
                    MyStrings.insertYourEmail,
                    style: textTheme.headline4,
                  ),
                  //Text Filed
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                    child: TextField(
                      onChanged: (value) {
                        //! Email Validation
                        print(
                            value + ' is email : ' + isEmail(value).toString());
                      },
                      style: textTheme.headline4,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: MyStrings.techBlogEmail,
                        hintStyle: textTheme.headline5,
                      ),
                    ),
                  ),
                  //Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _acticeCodeBottomSheet(context, size, textTheme);
                    },
                    child: const Text('ادامه'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  //! -------------------

  Future<dynamic> _acticeCodeBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Text
                  Text(
                    MyStrings.insertActivateCode,
                    style: textTheme.headline4,
                  ),
                  //Text Filed
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                    child: TextField(
                      onChanged: (value) {},
                      style: textTheme.headline4,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: '******',
                        hintStyle: textTheme.headline5,
                      ),
                    ),
                  ),
                  //Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const MyCategories(),
                        ),
                      );
                    },
                    child: const Text('ادامه'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
