import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

Widget confirmBtn(Function confirm) {
  return ElevatedButton(
      onPressed: () {
        confirm();
      },
      child: const Text("Confirm"));
}

Widget cancelBtn() {
  return ElevatedButton(
      onPressed: () {
        Get.back();
      },
      child: const Text("Cancel"));
}
