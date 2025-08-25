import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  //TODO: Implement CounterController

  RxInt hitung = 1.obs;

  void increment() {
    if (hitung < 100) {
      hitung++;
    } else {
      Get.snackbar(
        'Peringatan',
        'Hitungan sudah mencapai 100',
        backgroundColor: Colors.red,
        icon: Icon(Icons.warning, color: Colors.white),
        colorText: Colors.white,
      );
    }
  }

  void decrement() {
    if (hitung > 1) {
      hitung--;
    } else {
      Get.snackbar(
        'Peringatan',
        'Hitungan tidak boleh kurang dari 1',
        backgroundColor: Colors.red,
        icon: const Icon(Icons.warning, color: Colors.white),
        colorText: Colors.white,
      );
    }
  }

  double get textSize => 20 + (hitung.value * 0.3);
}
