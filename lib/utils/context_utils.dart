import 'package:flutter/material.dart';

extension AppUtils on BuildContext {
  Size getSize() => MediaQuery.sizeOf(this);

  double get getHeight => getSize().height;

  double get getWidth => getSize().width;

  double getStatusBarHeight() => MediaQuery.of(this).padding.top;

  double getAppBarHeight() => AppBar().preferredSize.height;

  double getBottomBarHeight() => MediaQuery.of(this).padding.bottom;

  double getKeyboardHeight() => MediaQuery.of(this).viewInsets.bottom;

  double getKeyboardHeightWithAppBar() =>
      getKeyboardHeight() - getAppBarHeight();

  double getKeyboardHeightWithBottomBar() =>
      getKeyboardHeight() - getBottomBarHeight();

  double getKeyboardHeightWithAppBarAndBottomBar() =>
      getKeyboardHeight() - getAppBarHeight() - getBottomBarHeight();

  double getKeyboardHeightWithAppBarAndBottomBarAndStatusBar() =>
      getKeyboardHeight() -
      getAppBarHeight() -
      getBottomBarHeight() -
      getStatusBarHeight();

  double getKeyboardHeightWithAppBarAndStatusBar() =>
      getKeyboardHeight() - getAppBarHeight() - getStatusBarHeight();
}
