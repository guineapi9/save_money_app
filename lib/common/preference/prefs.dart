import 'package:save_money_app/common/preference/item/rx_preference_item.dart';

import '../theme/custom_theme.dart';
import 'item/nullable_preference_item.dart';

class Prefs {
  static final appTheme = NullablePreferenceItem<CustomTheme>('appTheme');

  static final number = RxPreferenceItem<int, RxInt>('number', 0);
}
