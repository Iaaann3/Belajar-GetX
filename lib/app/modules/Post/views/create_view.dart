import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/post_controller.dart';

class PostCreateView extends GetView<PostController> {
  PostCreateView({Key? key}) : super(key: key);
  final PostController controller = Get.put(PostController());

  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PostController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Buat Post Baru')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: "Judul",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Judul wajib diisi" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: contentController,
                decoration: const InputDecoration(
                  labelText: "Isi Post",
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
                validator: (value) => value == null || value.isEmpty
                    ? "Isi post wajib diisi"
                    : null,
              ),
              const SizedBox(height: 24),
              Obx(() {
                return ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () async {
                          if (_formKey.currentState!.validate()) {
                            await controller.createPost(
                              titleController.text,
                              contentController.text,
                            );
                            Get.back(); // balik ke list setelah sukses
                          }
                        },
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Simpan"),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
