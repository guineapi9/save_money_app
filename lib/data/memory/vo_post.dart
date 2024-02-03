class Post {
  Post({
    required this.id,
    required this.product,
    required this.reason,
    required this.promise,
    required this.purchaseDate,
    //required this.replacement,
    required this.price,
  })  : createdTime = DateTime.now(),
        modifyTime = null; // 초기값으로 null 설정

  int id;
  String product;
  String reason;
  String promise;
  final DateTime createdTime;
  DateTime? modifyTime;
  DateTime purchaseDate;
  //String replacement; // 대체품
  double price; // 가격
}
