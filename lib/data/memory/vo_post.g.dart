// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as int,
      product: json['product'] as String,
      isNecessary: json['isNecessary'] as bool,
      reason: json['reason'] as String,
      promise: json['promise'] as String,
      purchaseDate: DateTime.parse(json['purchaseDate'] as String),
      price: json['price'] as int,
      createdTime: json['createdTime'] == null
          ? null
          : DateTime.parse(json['createdTime'] as String),
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'reason': instance.reason,
      'promise': instance.promise,
      'createdTime': instance.createdTime.toIso8601String(),
      'purchaseDate': instance.purchaseDate.toIso8601String(),
      'isNecessary': instance.isNecessary,
      'price': instance.price,
    };
