import 'package:flutter/material.dart';

class ColorManager {

  static Color primary = const Color(0xFF6394CE);
  static Color primaryDark = const Color(0xFF5187C7);
  static Color colorSecondary = const Color(0xFFEC4700);
  static Color colorPrimaryTrans = const Color(0xB222BCA2);

  static Color statusBarColor = primary;
  static Color iconNavSelectedColor =  colorSecondary;
  static Color iconNavBackgroundColor = primary;

  static Color test = const Color(0xFF425291);
  static Color primaryDM21 = const Color(0xFF42B8E4);
  static Color primaryDarkDM21 = const Color(0xFF1C8CB6);

  static Color colorTextDark = const Color(0xFF161616);
  static Color backgroundColor = const Color(0xFFF7F7F7);

  static Color premiumOrange = const Color(0xFFF2650F);
  static Color brillantGold = const Color(0xFFF19700);
  static Color inspiringYellow = const Color(0xFFFED123);
  static Color guardianBlue = const Color(0xFF001E55);
  static Color comfortGray = const Color(0xFF7A99AC);

  static Color colorAccent = const Color(0xFF3BABFF);
  static Color blueAccentLight = const Color(0xFF89C8FF);
  static Color colorStatusBar = const Color(0xFF291E77);
  static Color error = const Color(0xFFFF1818);
  static Color success = const Color(0xFF2B910D);

  static Color pink = const Color(0xFFEA4F79);

  static Color blue_dark = const Color(0xFF182457);
  static Color black = const Color(0xFF000000);
  static Color black_trans_80 = const Color(0x80000000);
  static Color black_trans_90 = const Color(0x90000000);
  static Color black_trans = const Color(0xFF25000000);
  static Color black_trans_little = const Color(0xFF59000000);
  static Color black_light = const Color(0xFF444444);
  static Color dark_grey = const Color(0xFF424242);
  static Color gray_unselected_tab = const Color(0xFFB2B2B2);
  static Color grey = const Color(0xFF808080);
  static Color white = const Color(0xFFffffff);
  static Color bleu_talent = const Color(0xFF42aceb);
  static Color white_trans = const Color(0xFF66FFFFFF);
  static Color white80 = const Color(0xCDFFFFFF);
  static Color grey_medium = const Color(0xFF979797);
  static Color grey_light = const Color(0xFFE7E7E7);
  static Color grey_very_light = const Color(0xFFF1F1F1);

  static Color red_element_bg_out = const Color(0xFFC53413);
  static Color red_element_bg_in = const Color(0xFF810000);
  static Color red_element_bg_desc = const Color(0xFF690000);
  static Color red_element_infos = const Color(0xFFDD4A4A);

  static Color blue_element_bg_out = const Color(0xFF46A3DE);
  static Color blue_element_bg_in = const Color(0xFF013453);
  static Color blue_element_infos = const Color(0xFF46A3DE);

  static Color blue_dark_stars = const Color(0xFF272E3C);
  static Color chat_bg_blue = const Color(0xFF32618B);

  static Color kMenuItem = const Color(0xFFAAAAAA);
  static Color kCurrentMenuItem = primary;
  static Color kMenuTextColor = const Color(0xFF2E2E2E);

  static Color greenItem = const Color(0xFF26CB79);
  static Color lightGreenItem = const Color(0xFF54D695);

  static Color inputBackground = const Color(0xFFF8F8F8);
  static Color inputBackgroundFocused = const Color(0xFFFFFFFF);
  static Color hintText = const Color(0xFFADADAD);
  static Color textColor = const Color(0xFF2E2E2E);
  static Color inputIcon = hintText;
  static Color inputIconFocused = primary;
  static Color inputShadow = const Color(0x4226CB79);
  static Color inputHint = const Color(0xFF262626);

// region status
  static Color uStatusUrgent = const Color(0xFFEA507A);

  // region task
  static Color kColorTaskPending = const Color(0xFFFF8200);
  static Color kColorTaskStarted = colorSecondary;
  static Color kColorTaskDone = primary;

  // endregion


// region list
  static Color listItemColor1 = const Color(0xFF22BCA2);
  static Color listItemColor2 = const Color(0xFF67CBB9);
  static Color listItemColor3 = const Color(0xFFEA6647);
  static Color listItemColor4 = const Color(0xFFFD9278);
  static Color listItemColor5 = const Color(0xFFEFA36A);
  static Color listItemColor6 = const Color(0xFFFFC091);

// endregion

// region alert banner
  static Color colorBannerError = const Color(0xFFFF5733);
  static Color colorBannerSuccess = const Color(0xFF327B1B);

  static Color random() {
    var list = [listItemColor1, listItemColor6,listItemColor3, inputShadow,blue_element_bg_in];
    return (list..shuffle()).first;
  }

// endregion
}