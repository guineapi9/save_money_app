import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
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

  // void changePostStatus(Post post) async {
  //   switch (Post.status) {
  //     case PostStatus.incomplete:
  //       Post.status = PostStatus.ongoing;
  //     case PostStatus.ongoing:
  //       Post.status = PostStatus.complete;
  //     case PostStatus.complete:
  //       final result = await ConfirmDialog('정말로 처음 상태로 변경하시겠어요?').show();
  //       result?.runIfSuccess((data) {
  //         Post.status = PostStatus.incomplete;
  //       });
  //   }
  //   postList.refresh();
  // }

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
}

/// 상태 관리에 사용될 mixin
mixin class PostDataProvider {
  ///PostDataHolder 클래스의 인스턴스를 생성하고 late final을 사용하여 나중에 초기화될 것임을 선언
  ///Get.find() => 등록된 클래스를 찾아서 해당 클래스의 인스턴스를 반환
  late final PostDataHolder postData = Get.find();
}
