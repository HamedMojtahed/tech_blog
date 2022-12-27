// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/components/my_colors.dart';
import 'package:techblog/components/my_component.dart';
import 'package:techblog/components/my_strings.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({
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
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          children: [
            //! Poster
            homePagePoster(size: size, texttheme: texttheme),
            //! SizedBox
            const SizedBox(height: 16),
            //! TagList
            homePageTagList(bodyMargin: bodyMargin, texttheme: texttheme),
            //! see more hotest blogs
            seeMoreBlog(bodyMargin: bodyMargin, texttheme: texttheme),
            //! blogList
            homePageBlogList(
                size: size, bodyMargin: bodyMargin, texttheme: texttheme),
            //! see more hotest podcasts
            seeMorePodCast(bodyMargin: bodyMargin, texttheme: texttheme),
            //! podcats List
            homePagePodCastList(size: size, bodyMargin: bodyMargin),
            //!
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

class homePagePodCastList extends StatelessWidget {
  const homePagePodCastList({
    Key? key,
    required this.size,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        itemCount: PodcastsList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return Padding(
            padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
            child: Column(
              children: [
                //! podcat item
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    height: size.height / 5.3,
                    width: size.width / 2.9,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        image: DecorationImage(
                          image: NetworkImage(PodcastsList[index].imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      foregroundDecoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        gradient: LinearGradient(
                          colors: gradiantColors.blogPost,
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                ),
                //! text under podcast item
                SizedBox(
                  width: size.width / 3,
                  child: Text(
                    PodcastsList[index].title,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}

class seeMorePodCast extends StatelessWidget {
  const seeMorePodCast({
    Key? key,
    required this.bodyMargin,
    required this.texttheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme texttheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 26, bodyMargin, 10),
      child: Row(
        children: [
          ImageIcon(
            Image.asset(Assets.icons.microphon.path).image,
            // size: 50,
            color: solidColors.colorTitle,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.viewHotestPodcasts,
            style: texttheme.headline3,
          ),
        ],
      ),
    );
  }
}

class homePageBlogList extends StatelessWidget {
  const homePageBlogList({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.texttheme,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final TextTheme texttheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        itemCount: blogList.getRange(0, 5).length,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return Padding(
            padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
            child: Column(
              children: [
                //! blog item
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    height: size.height / 5.3,
                    width: size.width / 2.5,
                    child: Stack(
                      children: [
                        //! first child of stack
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                              image: NetworkImage(blogList[index].imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                          foregroundDecoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            gradient: LinearGradient(
                              colors: gradiantColors.blogPost,
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                        //! second child of stack
                        Positioned(
                          bottom: 8,
                          right: 0,
                          left: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                blogList[index].writer,
                                style: texttheme.subtitle1,
                              ),
                              Row(
                                children: [
                                  Text(
                                    blogList[index].views,
                                    style: texttheme.subtitle1,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Icon(
                                    Icons.remove_red_eye_sharp,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //! text under blog item
                SizedBox(
                  width: size.width / 2.4,
                  child: Text(
                    blogList[index].title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}

class seeMoreBlog extends StatelessWidget {
  const seeMoreBlog({
    Key? key,
    required this.bodyMargin,
    required this.texttheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme texttheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 26, bodyMargin, 10),
      child: Row(
        children: [
          ImageIcon(
            Image.asset(Assets.icons.bluePen.path).image,
            color: solidColors.colorTitle,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.viewHotestBlog,
            style: texttheme.headline3,
          ),
        ],
      ),
    );
  }
}

class homePageTagList extends StatelessWidget {
  const homePageTagList({
    Key? key,
    required this.bodyMargin,
    required this.texttheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme texttheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: tagList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (((context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
            //! tag box decoration
            child: MainTagsWidget(
              texttheme: texttheme,
              index: null,
            ),
          );
        })),
      ),
    );
  }
}

class homePagePoster extends StatelessWidget {
  const homePagePoster({
    Key? key,
    required this.size,
    required this.texttheme,
  }) : super(key: key);

  final Size size;
  final TextTheme texttheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //
        //! poster picture & cover
        Container(
          width: size.width / 1.25,
          height: size.height / 4.2,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            image: DecorationImage(
              image: Image.asset(
                homePagePosterMap["imageAsset"],
              ).image,
              fit: BoxFit.cover,
            ),
          ),
          foregroundDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              gradient: LinearGradient(
                colors: gradiantColors.homePosterCoverGradiant,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
        ),
        //
        //! texts on poster

        Positioned(
          bottom: 8,
          right: 0,
          left: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homePagePosterMap["writer"] +
                        " _ " +
                        homePagePosterMap["date"],
                    style: texttheme.subtitle1,
                  ),
                  Row(
                    children: [
                      Text(
                        homePagePosterMap['view'],
                        style: texttheme.subtitle1,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(
                        Icons.remove_red_eye_sharp,
                        color: Colors.white,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                "دوازده قدم برنامه نویسی یک دوره ی...",
                style: texttheme.headline1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
