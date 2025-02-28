import 'package:social_media_clone/features/post/domain/entities/post.dart';

abstract class PostRepo {
  Future<List<Post>> fetchAllPost();
  Future<void> createPost(Post post);
  Future<void> deletePost(String postId);
  Future<List<Post>> fetchPostByUserId(String userId);
  Future<void> toggleLikePost(String postId, String userId);
}