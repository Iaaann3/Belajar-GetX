import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ResultScreenView extends GetView {
  final String name;
  final String gender;
  final String dateOfbirth;
  final String phone;

  const ResultScreenView({
    super.key,
    required this.name,
    required this.gender,
    required this.dateOfbirth,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ResultScreenView'), centerTitle: true),
      body: Center(
        child: Column(
          children: [Text(name), Text(gender), Text(dateOfbirth), Text(phone)],
        ),
      ),
    );
  }
}
