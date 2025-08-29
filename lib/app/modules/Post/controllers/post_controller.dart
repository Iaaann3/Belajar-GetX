import 'package:belajar_getx/app/data/models/post.dart';
import 'package:belajar_getx/app/service/post_service.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  Future<void> createPost(String title, String content) async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await api.createPost({
        "title": title,
        "content": content,
      });
      if (response.statusCode == 201 || response.statusCode == 200) {
        // Jika API mengembalikan data post baru, tambahkan ke list
        if (response.body is Map) {
          final newPost = PostModel.fromJson(response.body);
          posts.add(newPost);
        }
        Get.snackbar("Sukses", "Post berhasil dibuat");
      } else {
        errorMessage('Error: ${response.statusText}');
        Get.snackbar("Error", errorMessage.value);
      }
    } catch (e) {
      errorMessage('Exception: $e');
      Get.snackbar("Exception", errorMessage.value);
    } finally {
      isLoading(false);
    }
  }

  final PostService api = Get.put<PostService>(PostService());

  var posts = <PostModel>[].obs; // data observable
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      errorMessage('');

      final response = await api.fetchPosts();

      if (response.statusCode == 200) {
        dynamic body = response.body;

        // jika response langsung List
        if (body is List) {
          final data = body
              .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
              .toList();
          posts.assignAll(data);
        }
        // kalau Laravel API balikin { "data": [...] }
        else if (body is Map && body.containsKey('data')) {
          final data = (body['data'] as List)
              .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
              .toList();
          posts.assignAll(data);
        } else {
          errorMessage('Format data tidak sesuai');
        }
      } else {
        errorMessage('Error: ${response.statusText}');
      }
    } catch (e) {
      errorMessage('Exception: $e');
    } finally {
      isLoading(false);
    }
  }
}
