import 'package:get/get_connect/connect.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PostService extends GetConnect {
  final String postUrl = 'http://127.0.0.1:8000/api';
  final box = GetStorage();

  // READ - ambil semua post
  Future<Response> fetchPosts() async {
    try {
      final token = box.read('token') ?? '';
      return await get(
        "$postUrl/posts",
        headers: {'Authorization': "Bearer $token"},
      );
    } catch (e) {
      return Response(statusCode: 500, statusText: 'Exception: $e');
    }
  }

  // CREATE - tambah post baru
  Future<Response> createPost(Map<String, dynamic> data) async {
    return post('/posts', data);
  }

  // UPDATE - edit post
  Future<Response> updatePost(int id, Map<String, dynamic> data) async {
    return put('/posts/$id', data);
  }

  // DELETE - hapus post
  Future<Response> deletePost(int id) async {
    return delete('/posts/$id');
  }
}
