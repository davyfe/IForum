import 'package:flutter/material.dart';

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  final Color backgroundColor;

  const StickyTabBarDelegate(
      this.tabBar, {
        this.backgroundColor = Colors.white,
      });

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: backgroundColor,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(StickyTabBarDelegate old) {
    return tabBar != old.tabBar || backgroundColor != old.backgroundColor;
  }
}