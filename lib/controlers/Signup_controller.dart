import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:http/http.dart';

import '../stores/save_token_stores.dart';
import '../view/screens/home_screen/home_screen.dart';

class SignupController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool loading = false.obs;

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void signupApi() async {
    loading.value = true;

    try {
      final response = await post(
        Uri.parse('http://172.252.13.83:2000/api/v1/users'),
        body: {
          "name": nameController.text,
          "email": emailController.text,
          "password": passwordController.text,
        },
      );

      var data = jsonDecode(response.body);

      print(data);
      if (response.statusCode == 200 && data["success"] == true) {

        loading.value = false;

        Get.snackbar(
          " Success",
          data["message"] ?? "Congratulation",
        );

        // Navigate to HomeScreen
        Get.offAll(() => HomeScreen());
      } else {
        Get.snackbar("Error", data["message"] ?? "Something went wrong",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print(e);
      loading.value = false;
      Get.snackbar("Exception Error", "Something went wrong",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
