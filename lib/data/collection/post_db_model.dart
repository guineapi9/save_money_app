import 'package:isar/isar.dart';

part 'post_db_model.g.dart';

@collection
class PostDbModel {
  Id id;

  //ChatGPT
  //final로 선언하는 이유는 해당 필드가 객체가 생성될 때 초기화되고 더 이상 변경되지 않기를 원하기 때문
  @Index(type: IndexType.value)
  final DateTime createdTime;

  @Index(type: IndexType.value)
  String product;

  @Index(type: IndexType.value)
  int price;

  DateTime purchaseDate;

  bool isNecessary;

  String reason;

  String promise;

  PostDbModel({
    required this.id,
    required this.createdTime,
    required this.product,
    required this.isNecessary,
    required this.price,
    required this.purchaseDate,
    required this.reason,
    required this.promise,
  });
}
