import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:save_money_app/common/common.dart';
import 'package:save_money_app/data/memory/vo_post.dart';
import 'package:save_money_app/data/post_repository.dart';
import '../../screen/d_write_post.dart';
import '../local/local_db.dart';

/// 게시물 데이터를 관리하는 컨트롤러 클래스
class PostDataHolder extends GetxController {
  /// RxList를 사용하여 게시물 목록을 관리
  final RxList<Post> postList = <Post>[].obs;

  ///싱글턴
  final PostRepository postRepository = LocalDB.instance;

  ///초기화 : Local DB -> Data Holder 데이터 다 가져오기
  @override
  void onInit() async {
    final getPostResult = await postRepository.getPostList();
    getPostResult.runIfSuccess((data) {
      postList.addAll(data);
    });

    super.onInit();
  }

  int get newId {
    return DateTime.now().millisecondsSinceEpoch;
  }

  ///새로운 게시물을 추가하는 다이얼로그를 띄우는 메서드
  void addPost() async {
    final result = await WritePostDialog().show();
    if (result != null) {
      final newPost = Post(
        id: newId,
        price: result.price,
        product: result.product,
        reason: result.reason,
        promise: result.promise,
        purchaseDate: result.purchaseDate,
        isNecessary: result.isNecessary,
      );

      postList.add(newPost);
      postRepository.addPost(newPost);
    }
  }

// void editPost(Post Post) async {
//   final result = await WritePostDialog(PostForEdit: Post).show();
//   if (result != null) {
//     Post.title = result.text;
//     Post.dueDate = result.dateTime;
//     postList.refresh();
//   }
// }
//
  void removePost(Post post) {
    postList.remove(post);
    postRepository.removePost(post.id);
    postList.refresh();
  }

  ///날짜별로 이벤트를 분리하는 함수
  ///초기화할때도 30일 전체를 순회하며, 새로운 날짜를 클릭할 때마다 또 30일을 순회한다.
  List<Post> getEventsForDay(DateTime day) {
    final dayPostList = postList
        .where((element) =>
            element.purchaseDate.formattedDate == day.formattedDate)
        .toList();

    return dayPostList;
  }

  ///현재 월의 총 금액을 반환
  int sumForMonth(DateTime day) {
    //focusedDay와 현재 연,월이 같은 데이터만 모으기
    final monthPostList = postList
        .where((element) =>
            element.purchaseDate.month == day.month &&
            element.purchaseDate.year == day.year)
        .toList();

    //해당 리스트에서 금액만 sum해서 반환
    return monthPostList.fold(0, (sum, post) => sum + post.price);
  }

  ///현재 월 총 금액 중 불필요한 지출 금액을 반환
  int notNecessarySumForMonth(DateTime day) {
    //focusedDay와 현재 연,월이 같은 데이터만 모으기
    final notNecessaryMonthPostList = postList
        .where((element) =>
    element.purchaseDate.month == day.month &&
        element.purchaseDate.year == day.year && element.isNecessary == false)
        .toList();

    //해당 리스트에서 금액만 sum해서 반환
    return notNecessaryMonthPostList.fold(0, (sum, post) => sum + post.price);
  }

// ///선택한 날짜의 현재 금액을 반환
// int calculateSumPrice(DateTime day) {
//   return getEventsForDay(day).fold(0, (sum, post) => sum + post.price);
// }
}

/// 상태 관리에 사용될 mixin
mixin class PostDataProvider {
  ///PostDataHolder 클래스의 인스턴스를 생성하고 late final을 사용하여 나중에 초기화될 것임을 선언
  ///Get.find() => 등록된 클래스를 찾아서 해당 클래스의 인스턴스를 반환
  late final PostDataHolder postData = Get.find();
}
