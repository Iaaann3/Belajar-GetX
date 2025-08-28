import 'package:get/get_connect/connect.dart';
import 'package:get/get.dart';

class PostService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://jsonplaceholder.typicode.com';
    super.onInit();
  }

  Future<Response> fetchPosts() async {
    return get('/posts');
  }
}
