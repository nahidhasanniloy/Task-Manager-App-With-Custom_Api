import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../stores/save_token_stores.dart';
import '../view/screens/home_screen/home_screen.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool loading = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // ============================= login api ============================
  void loginApi() async {
    loading.value = true;
    try {
      final response = await post(
        Uri.parse('http://172.252.13.83:2000/api/v1/auth/login'),
        body: {
          "email": emailController.text,
          "password": passwordController.text,
        },
      );

      var data = jsonDecode(response.body);
 // print(data);
      if (response.statusCode == 200) {
        String token = data["data"]["accessToken"];
        await saveToken(token);
        loading.value = false;
        print(token);
       Get.snackbar(
          "Login Success",
          data["message"] ?? "Congratulation",
        );

        // Navigate to HomeScreen
        Get.offAll(() => HomeScreen());

      } else {
        loading.value = false;
        Get.snackbar(
          "Login Failed",
          data["message"] ?? "Try again",
        );
      }
    } catch (e) {
      print(e);
      loading.value = false;
      Get.snackbar("Exception Error", "Something went wrong");
    }
  }
}
