import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:small_kindness/core/consts/const_icons_paths.dart';
import 'package:small_kindness/core/utils/app_state_wrapper.dart';
import 'package:small_kindness/features/favorites/presentation/screens/favorites_screen.dart';
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
          backgroundColor: colors.ffF6F6F6,
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
                ConstIconsPaths.favorite,
                height: 27.r,
                width: 27.r,
                colorFilter: ColorFilter.mode(colors.ff000000, BlendMode.srcIn),
              ),
              activeIcon: SvgPicture.asset(
                ConstIconsPaths.favoriteFill,
                height: 27.r,
                width: 27.r,
                colorFilter: ColorFilter.mode(colors.ff16A99F, BlendMode.srcIn),
              ),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ConstIconsPaths.chat,
                height: 22.r,
                width: 22.r,
                colorFilter: ColorFilter.mode(colors.ff000000, BlendMode.srcIn),
              ),
              activeIcon: SvgPicture.asset(
                ConstIconsPaths.chatFill,
                height: 27.r,
                width: 27.r,
                colorFilter: ColorFilter.mode(colors.ff16A99F, BlendMode.srcIn),
              ),
              label: 'Chat',
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
            FavoritesScreen(),
            HomeScreen(),
            HomeScreen(),
          ],
        ),
      ),
    );
  }
}
