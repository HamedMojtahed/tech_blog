// ignore_for_file: camel_case_types, unused_local_variable
import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/components/my_colors.dart';
import 'package:techblog/view/home_screen.dart';
import 'package:techblog/view/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

//
final GlobalKey<ScaffoldState> _key = GlobalKey();

//
class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;
  //

  //
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;
    //

    return SafeArea(
      child: Scaffold(
        key: _key,
        backgroundColor: solidColors.scafoldBg,
        //! Drawer
        drawer: Drawer(
          backgroundColor: solidColors.scafoldBg,
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
            child: ListView(
              children: [
                //! Drawer Header
                DrawerHeader(
                  child: Center(
                    child: Image.asset(
                      Assets.images.logoo.path,
                      scale: 2.5,
                    ),
                  ),
                ),
                //! Drawer Body
                ListTile(
                  onTap: () {},
                  title: Text(
                    'پروفایل کاربری',
                    style: textTheme.headline4,
                  ),
                ),
                const Divider(
                  color: solidColors.dividerColor,
                ),
                //
                ListTile(
                  onTap: () {},
                  title: Text(
                    'درباره تک بلاگ',
                    style: textTheme.headline4,
                  ),
                ),
                const Divider(
                  color: solidColors.dividerColor,
                ),
                //
                ListTile(
                  onTap: () {},
                  title: Text(
                    'اشتراک گذاری تک بلاگ',
                    style: textTheme.headline4,
                  ),
                ),
                const Divider(
                  color: solidColors.dividerColor,
                ),
                //
                ListTile(
                  onTap: () {},
                  title: Text(
                    'تک بلاگ در گیت هاب',
                    style: textTheme.headline4,
                  ),
                ),
                const Divider(
                  color: solidColors.dividerColor,
                ),
                //
              ],
            ),
          ),
        ),
        //! AppBar
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: solidColors.scafoldBg,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
              //
              Image.asset(
                Assets.images.logoo.path,
                height: size.height / 13.6,
              ),
              //
              const Icon(Icons.search, color: Colors.black),
            ],
          ),
        ),
        //
        body: Stack(
          children: [
            //! Body
            Positioned.fill(
                child: IndexedStack(
              index: selectedPageIndex,
              children: [
                homeScreen(
                  //index 0
                  size: size,
                  texttheme: textTheme,
                  bodyMargin: bodyMargin,
                ),
                profileScreen(
                  // index 1
                  size: size,
                  texttheme: textTheme,
                  bodyMargin: bodyMargin,
                ),
              ],
            )),
            //! BottomNavigation
            BottomNavigation(
              size: size,
              bodyMargin: bodyMargin,
              changeScreen: (int value) {
                setState(() {
                  selectedPageIndex = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.changeScreen,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 5,
      right: 0,
      left: 0,
      child: Container(
        height: size.height / 10,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: gradiantColors.bottomNavBacbround,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
          child: Container(
            height: size.height / 8,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: gradiantColors.bottomNav),
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: (() => changeScreen(0)),
                    icon: ImageIcon(Image.asset(Assets.icons.home.path).image),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: (() {}),
                    icon: ImageIcon(Image.asset(Assets.icons.write.path).image),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: (() => changeScreen(1)),
                    icon: ImageIcon(Image.asset(Assets.icons.user.path).image),
                    color: Colors.white,
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
