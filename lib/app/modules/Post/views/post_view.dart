import 'package:belajar_getx/app/modules/Post/views/create_view.dart';
import 'package:belajar_getx/app/modules/Post/views/post_detail_view_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/post_controller.dart';

class PostView extends GetView<PostController> {
  PostView({Key? key}) : super(key: key);
  final PostController controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(controller.errorMessage.value),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: controller.fetchPosts,
                  child: const Text('Coba lagi'),
                ),
              ],
            ),
          );
        }

        final posts = controller.posts;
        if (posts.isEmpty) {
          return const Center(child: Text('Data kosong'));
        }

        return ListView.separated(
          itemCount: posts.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (ctx, i) {
            final post = posts[i];
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  post.foto != null && post.foto!.isNotEmpty
                      ? post.foto!
                      : 'http://127.0.0.1:8000/storage/default.png',
                  fit: BoxFit.cover,
                  width: 64,
                  height: 64,
                ),
              ),
              title: Text(post.title ?? '-'),
              subtitle: Text(
                post.content ?? '-',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () => Get.to(() => PostDetailView(post: post)),
            );
          },
        );
      }),

      // Tombol Create Post
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => PostCreateView());
        },
        icon: const Icon(Icons.add),
        label: const Text("Create"),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
