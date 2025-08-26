import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomeView'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('HomeView is working', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),

            // Tombol ke Counter
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/counter');
              },
              child: const Text('Go to counter'),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                Get.toNamed('/form-pendaftaran');
              },
              child: const Text('Go to Form Pendaftaran'),
            ),
          ],
        ),
      ),
    );
  }
}
