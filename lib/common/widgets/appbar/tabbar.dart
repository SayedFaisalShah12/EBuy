import 'package:ebuy/utils/device/device_utility.dart';
import 'package:ebuy/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/color.dart';

class ETabBar extends StatelessWidget implements PreferredSizeWidget {
  const ETabBar({super.key, required this.tabs});

  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Material(
      color: dark ? EColors.black : EColors.white,
        child: TabBar(
          tabs: tabs,
          isScrollable: true,
          indicatorColor: EColors.primaryColor,
          labelColor: dark ? EColors.white : EColors.primaryColor,
          unselectedLabelColor: EColors.darkGrey,
        ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(EDeviceUtils.getAppBarHeight());
}
