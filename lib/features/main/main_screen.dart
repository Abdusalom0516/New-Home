import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:small_kindness/core/consts/const_icons_paths.dart';
import 'package:small_kindness/core/utils/app_state_wrapper.dart';
import 'package:small_kindness/features/add/presentation/screens/lost_and_found_add_screen.dart';
import 'package:small_kindness/features/articles/presentation/screens/articles_screen.dart';
import 'package:small_kindness/features/pets/presentation/screens/pets_screen.dart';
import 'package:small_kindness/features/home/presentation/screens/home_screen.dart';

class MainScreen extends HookWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController(initialPage: 0);
    final currentIndex = useState(0);
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            currentIndex.value = value;
            pageController.jumpToPage(value);
          },
          currentIndex: currentIndex.value,
          backgroundColor: colors.ffE8F7F6,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ConstIconsPaths.home,
                height: 27.r,
                width: 27.r,
                colorFilter: ColorFilter.mode(colors.ff000000, BlendMode.srcIn),
              ),
              activeIcon: SvgPicture.asset(
                ConstIconsPaths.homeFill,
                height: 27.r,
                width: 27.r,
                colorFilter: ColorFilter.mode(colors.ff16A99F, BlendMode.srcIn),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ConstIconsPaths.paw,
                height: 27.r,
                width: 27.r,
                colorFilter: ColorFilter.mode(colors.ff000000, BlendMode.srcIn),
              ),
              activeIcon: SvgPicture.asset(
                ConstIconsPaths.paw,
                height: 27.r,
                width: 27.r,
                colorFilter: ColorFilter.mode(colors.ff16A99F, BlendMode.srcIn),
              ),
              label: 'Pets',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_rounded,
                color: colors.ff16A99F,
                size: 55.r,
              ),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.newspaper_rounded,
                color: colors.ff000000,
                size: 25.r,
              ),
              activeIcon: Icon(
                Icons.newspaper_rounded,
                color: colors.ff16A99F,
                size: 25.r,
              ),
              label: 'Articles',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ConstIconsPaths.profile,
                height: 27.r,
                width: 27.r,
                colorFilter: ColorFilter.mode(colors.ff000000, BlendMode.srcIn),
              ),
              activeIcon: SvgPicture.asset(
                ConstIconsPaths.profileFill,
                height: 27.r,
                width: 27.r,
                colorFilter: ColorFilter.mode(colors.ff16A99F, BlendMode.srcIn),
              ),
              label: 'Profile',
            ),
          ],
        ),
        body: PageView(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            HomeScreen(),
            PetsScreen(),
            LostAndFoundAddScreen(),
            ArticlesScreen(),
            HomeScreen(),
          ],
        ),
      ),
    );
  }
}
