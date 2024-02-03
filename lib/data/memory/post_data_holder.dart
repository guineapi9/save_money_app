// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:get/instance_manager.dart';
// import 'package:save_money_app/data/memory/vo_post.dart';
//
// class PostDataHolder extends GetxController {
//   final RxList<Post> postList = <Post>[].obs;
//
//   // void changePostStatus(Post post) async {
//   //   switch (Post.status) {
//   //     case PostStatus.incomplete:
//   //       Post.status = PostStatus.ongoing;
//   //     case PostStatus.ongoing:
//   //       Post.status = PostStatus.complete;
//   //     case PostStatus.complete:
//   //       final result = await ConfirmDialog('정말로 처음 상태로 변경하시겠어요?').show();
//   //       result?.runIfSuccess((data) {
//   //         Post.status = PostStatus.incomplete;
//   //       });
//   //   }
//   //   postList.refresh();
//   // }
//
//   void addPost() async {
//     final result = await WritePostDialog().show();
//     if (result != null) {
//       postList.add(Post(
//         id: DateTime.now().millisecondsSinceEpoch,
//         title: result.text,
//         dueDate: result.dateTime,
//         product: '',
//         reason: '',
//         promise: '',
//         purchaseDate: null,
//       ));
//     }
//   }
//
//   void editPost(Post Post) async {
//     final result = await WritePostDialog(PostForEdit: Post).show();
//     if (result != null) {
//       Post.title = result.text;
//       Post.dueDate = result.dateTime;
//       postList.refresh();
//     }
//   }
//
//   void removePost(Post Post) {
//     postList.remove(Post);
//     postList.refresh();
//   }
// }
//
// mixin class PostDataProvider {
//   late final PostDataHolder PostData = Get.find();
// }
