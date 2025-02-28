import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media_clone/features/post/domain/entities/post.dart';
import 'package:social_media_clone/features/post/domain/repos/post_repo.dart';

class FirebasePostRepo implements PostRepo {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // store the posts in a collection called 'posts'
  final CollectionReference postsCollection = 
    FirebaseFirestore.instance.collection('posts');

  @override
  Future<void> createPost(Post post) async {
    try {
      await postsCollection.doc(post.id).set(post.toJson());
    } catch(e) {
      throw Exception("Error creating post: $e");
    }
  }
  
  @override
  Future<void> deletePost(String postId) async {
    await postsCollection.doc(postId).delete();
  }
  
  @override
  Future<List<Post>> fetchAllPost() async {
    try {
      // get all post with most recent posts at the top
      final postsSnapshot = 
        await postsCollection.orderBy('timestamp', descending: true).get();

      // convert each firestore document from json -> List of posts
      final List<Post> allPosts = 
        postsSnapshot.docs.map((doc) =>
          Post.fromJson(doc.data() as Map<String, dynamic>)).toList();

      return allPosts;
    } catch(e) {
      throw Exception("Error fetching posts: $e");
    }
  }
  
  @override
  Future<List<Post>> fetchPostByUserId(String userId) async {
    try {
      // fetch posts snapshot with this uid
      final postsSnapshot = 
        await postsCollection.where('userId', isEqualTo: userId).get();

      // map firestore documents from json -> lists of post
      final userPosts = postsSnapshot.docs.map((doc) => 
        Post.fromJson(doc.data() as Map<String, dynamic>)).toList();

      return userPosts;
    } catch(e) {
      throw Exception("Error fetching posts by user");
    }
  }

  @override
  Future<void> toggleLikePost(String postId, String userId) async {
    try {
      // get the post document from firestore
      final postDoc = await postsCollection.doc(postId).get();

      if(postDoc.exists) {
        final post = Post.fromJson(postDoc.data() as Map<String, dynamic>);

        // check if user has already like this post
        final hasLiked = post.likes.contains(userId);

        // update the likes list
        if(hasLiked) {
          post.likes.remove(userId); // unlike
        } else {
          post.likes.add(userId);
        }

        // update the post document with the new like list
        await postsCollection.doc(postId).update({
          'likes': post.likes
        });
      } else {
        throw Exception("Post not found");
      }
    } catch (e) {
      throw Exception("Error toggling like: $e");
    }
  }
}