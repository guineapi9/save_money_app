import 'package:json_annotation/json_annotation.dart';
import '../collection/post_db_model.dart';
part 'vo_post.g.dart';

@JsonSerializable()
class Post {
  Post({
    required this.id,
    required this.product,
    required this.isNecessary,
    required this.reason,
    required this.promise,
    required this.purchaseDate,
    //required this.replacement,
    required this.price,
    DateTime? createdTime,
  }) : createdTime = DateTime.now();
  // 초기값으로 null 설정

  int id;
  String product;
  String reason;
  String promise;
  final DateTime createdTime;
  //DateTime? modifyTime;
  DateTime purchaseDate;
  bool isNecessary; // 대체품
  int price; // 가격

  factory Post.fromJson(Map<String, Object?> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

  factory Post.fromDB(PostDbModel post) {
    return Post(
      id: post.id,
      createdTime: post.createdTime,
      product: post.product,
      purchaseDate: post.purchaseDate,
      price: post.price,
      reason: post.reason,
      promise: post.promise, isNecessary: post.isNecessary,
    );
  }

  PostDbModel toDbModel() => PostDbModel(
      id: id,
      createdTime: createdTime,
      product: product,
      price: price,
      purchaseDate: purchaseDate,
      reason: reason,
      promise: promise,
    isNecessary: isNecessary
  );
}
