import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/my_component.dart';
import 'package:techblog/my_strings.dart';
import 'package:techblog/my_colors.dart';

class MyCategories extends StatefulWidget {
  const MyCategories({super.key});

  @override
  State<MyCategories> createState() => _MyCategoriesState();
}

class _MyCategoriesState extends State<MyCategories> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
            child: Center(
              child: Column(
                children: [
                  //
                  const SizedBox(height: 32),
                  //
                  SvgPicture.asset(
                    Assets.images.teckbot.path,
                    height: 100,
                  ),
                  //
                  const SizedBox(height: 25),
                  //
                  Text(MyStrings.succesfulRegistration,
                      style: textTheme.headline4),
                  //
                  const SizedBox(height: 15),
                  //
                  TextField(
                    style: textTheme.headline4,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: 'نام و نام خانوادگی',
                      hintStyle: textTheme.headline5,
                    ),
                  ),
                  //
                  const SizedBox(height: 32),
                  //
                  Text(MyStrings.chooseCategories, style: textTheme.headline4),
                  //
                  const SizedBox(height: 15),
                  //
                  SizedBox(
                    width: double.infinity,
                    height: 85,
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(), //! Importatnt
                      scrollDirection: Axis.horizontal,
                      itemCount: tagList.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 15,
                        crossAxisCount: 2,
                        childAspectRatio: 0.3,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              if (!selectedTags.contains(tagList[index])) {
                                selectedTags.add(tagList[index]);
                              } 
                            });
                          },
                          child: MainTagsWidget(
                              texttheme: textTheme, index: index),
                        );
                      },
                    ),
                  ),
                  //
                  const SizedBox(height: 16),
                  //
                  const SizedBox(
                    height: 5,
                  ),
                  Image.asset(
                    Assets.images.arrow.path,
                    scale: 2,
                  ),
                  //! Selected Tags
                  SizedBox(
                    width: double.infinity,
                    height: 85,
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(), //! Importatnt
                      scrollDirection: Axis.horizontal,
                      itemCount: selectedTags.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 15,
                        crossAxisCount: 2,
                        childAspectRatio: 0.3,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 60,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                            color: solidColors.surface,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectedTags[index].title,
                                  style: textTheme.headline4,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedTags.removeAt(index);
                                    });
                                  },
                                  child: const Icon(
                                    CupertinoIcons.delete,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
