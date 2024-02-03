import 'package:save_money_app/common/preference/item/preference_item.dart';

class NullablePreferenceItem<T> extends PreferenceItem<T?> {
  NullablePreferenceItem(String key, [T? defaultValue]) : super(key, defaultValue);
}