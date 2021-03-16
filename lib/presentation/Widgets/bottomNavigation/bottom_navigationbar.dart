import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rasan/core/theme/app_theme.dart';

List<BottomNavigationBarItem> navItemsList = [
  BottomNavigationBarItem(
    icon: Icon(
      FontAwesomeIcons.home,
      color: AppTheme.lightAccentColor,
    ),
    label: '',
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.shopping_cart,
      color: AppTheme.lightAccentColor,
    ),
    label: '',
  ),
  BottomNavigationBarItem(
    icon: Icon(
      FontAwesomeIcons.tags,
      color: AppTheme.lightAccentColor,
    ),
    label: '',
  ),
  BottomNavigationBarItem(
    icon: Icon(
      FontAwesomeIcons.userCircle,
      color: AppTheme.lightAccentColor,
    ),
    label: '',
  ),
];
