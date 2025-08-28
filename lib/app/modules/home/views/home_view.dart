import 'package:belajar_getx/app/modules/Alquran/views/alquran_view.dart';
import 'package:belajar_getx/app/modules/Post/views/post_view.dart';
import 'package:belajar_getx/app/modules/counter/views/counter_view.dart';
import 'package:belajar_getx/app/modules/FormPendaftaran/views/form_pendaftaran_view.dart';
import 'package:belajar_getx/app/modules/profile/views/profile_view.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      CounterView(),
      PostView(),
      QuranView(),
      FormPendaftaranView(),
      ProfileView(),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 18, 208, 241),
        elevation: 0,
      ),

      /// body diganti pake Obx, jadi otomatis ganti sesuai index
      body: Obx(() => pages[controller.selectedIndex.value]),

      /// bottom navigation pakai ConvexAppBar
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.calculate, title: 'Counter'),
          TabItem(icon: Icons.article, title: 'Posts'),
          TabItem(icon: Icons.menu_book, title: 'Al-Qur’an'),
          TabItem(icon: Icons.assignment, title: 'Form'),
          TabItem(icon: Icons.account_circle, title: 'Profile'),
        ],
        initialActiveIndex: 0,
        onTap: controller.changeIndex,
        backgroundColor: const Color.fromARGB(255, 18, 208, 241),
      ),
    );
  }

  /// kalau masih mau tetap punya grid menu card di Dashboard,
  /// bisa taruh di halaman pertama (misalnya CounterView diganti HomeDashboardView).
}
