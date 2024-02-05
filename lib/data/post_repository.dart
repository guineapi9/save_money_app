import 'package:save_money_app/data/simple_result.dart';
import 'memory/vo_post.dart';

abstract interface class PostRepository<Error> {
  Future<SimpleResult<List<Post>, Error>> getPostList();
  Future<SimpleResult<void, Error>> addPost(Post post);
  Future<SimpleResult<void, Error>> updatePost(Post post);
  Future<SimpleResult<void, Error>> removePost(int id);
}
