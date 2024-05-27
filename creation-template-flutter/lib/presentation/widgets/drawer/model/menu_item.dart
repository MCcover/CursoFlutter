import 'package:drawer/presentation/pages/counter/counter_page.dart';
import 'package:drawer/presentation/pages/home/home_page.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum NavigationType {
  go,
  push,
}

class NavigationInfo extends Equatable {
  final Widget? view;
  final String? navigateTo;
  final NavigationType navigationType;

  const NavigationInfo({
    this.view,
    this.navigateTo,
    this.navigationType = NavigationType.go,
  }); //: assert(view == null && navigateTo == null, "Must indicate either a view to render or a path to navigate to"),
  //assert(view != null && navigateTo != null, "Can only indicate one of the two: a view for rendering or a path for navigation");

  @override
  List<Object?> get props => throw UnimplementedError();
}

class MenuItem extends Equatable {
  final String title;
  final IconData leadingIcon;
  final IconData? trealingIcon;
  final bool bottom;
  final NavigationInfo navigationInfo;

  const MenuItem({
    required this.title,
    required this.leadingIcon,
    this.trealingIcon,
    this.bottom = false,
    required this.navigationInfo,
  });

  @override
  List<Object?> get props => [
        title,
        leadingIcon,
        trealingIcon,
        bottom,
        navigationInfo,
      ];
}

final List<MenuItem> drawerItems = [
  const MenuItem(
    title: 'Home',
    leadingIcon: Icons.home_outlined,
    navigationInfo: NavigationInfo(
      view: HomePage(),
    ),
  ),
  const MenuItem(
    title: 'Counter',
    leadingIcon: Icons.plus_one_outlined,
    navigationInfo: NavigationInfo(
      view: CounterPage(),
    ),
  ),
  const MenuItem(
    title: 'Logout',
    leadingIcon: Icons.logout_outlined,
    bottom: true,
    navigationInfo: NavigationInfo(
      navigateTo: '/login',
    ),
  ),
];

List<MenuItem> get topItems => drawerItems.where((item) => !item.bottom).toList();
List<MenuItem> get bottomItems => drawerItems.where((item) => item.bottom).toList();
