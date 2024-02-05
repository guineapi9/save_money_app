// import 'package:fast_app_base/data/local/collection/Post_db_model.dart';
// import 'package:fast_app_base/data/Post_repository.dart';
// import 'package:flutter/foundation.dart';
// import 'package:isar/isar.dart';
// import 'package:path_provider/path_provider.dart';
//
// import '../../data/local/error/local_db_error.dart';
// import '../memory/vo_Post.dart';
// import '../simple_result.dart';
//
// class LocalDB implements PostRepository<LocalDBError> {
//
//   //하나만 존재하므로 싱글턴
//   static late final Isar _isar;
//   LocalDB._();
//
//   static LocalDB instance = LocalDB._();
//
//   static Future<void> init() async {
//     final dir = await getApplicationDocumentsDirectory();
//     //기본 1GB 세팅
//     _isar = await Isar.open([PostDbModelSchema], maxSizeMiB: 512, directory: dir.path);
//   }
//
//
//   //리스트 가져오기
//   @override
//   Future<SimpleResult<List<Post>, LocalDBError>> getPostList() async {
//     try {
//       // 일종의 꼼수로 filter().idGreaterThan(0).findAll() 사용
//       // get이나 getAll()의 경우 id 파라미터를 입력해 줘야 한다.
//       final documents = await _isar.PostDbModels.filter().idGreaterThan(0).findAll();
//       return SimpleResult.success(documents.map((e) => Post.fromDB(e)).toList());
//     } catch (e) {
//       return SimpleResult.failure(
//           LocalDBError(LocalDBErrorType.unknown, '에러가 발생했습니다. catch를 통해 세분화된 에러를 넘겨주세요.'));
//     }
//   }
//
//   @override
//   Future<SimpleResult<void, LocalDBError>> addPost(Post Post) async {
//     await _isar.writeTxn(() async {
//       await _isar.PostDbModels.put(Post.toDbModel());
//     });
//     return SimpleResult.success();
//   }
//
//   @override
//   Future<SimpleResult<void, LocalDBError>> updatePost(Post Post) async {
//     await _isar.writeTxn(() async {
//       await _isar.PostDbModels.put(Post.toDbModel());
//     });
//     return SimpleResult.success();
//   }
//
//   @override
//   Future<SimpleResult<void, LocalDBError>> removePost(Id id) async {
//     await _isar.writeTxn(() async {
//       await _isar.PostDbModels.delete(id);
//     });
//     return SimpleResult.success();
//   }
// }
