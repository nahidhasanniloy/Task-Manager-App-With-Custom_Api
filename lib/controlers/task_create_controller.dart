import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../task_model/task_model.dart';

class TaskCreateController extends GetxController {
  var isLoading = false.obs;

  Future<void> createTask({required String title, required String description}) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken") ?? "";

    if (token.isEmpty) {
      Get.snackbar("Error", "User not logged in");
      return;
    }

    final url = Uri.parse("http://172.252.13.83:2000/api/v1/task");
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    final body = jsonEncode({
      "title": title,
      "description": description,
    });

    try {
      isLoading.value = true;
      final response = await http.post(url, headers: headers, body: body);
      isLoading.value = false;
      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (responseData["success"] == true) {
          final taskData = responseData["data"];
          final newTask = Task(
            title: taskData["title"],
            description: taskData["description"],
          );
          Get.back(result: newTask); // return task to previous screen
          Get.snackbar("Success", responseData["message"] ?? "Task created successfully");
        } else {
          Get.snackbar("Error", responseData["message"] ?? "Failed to create task");
        }
      } else {
        Get.snackbar("Error", responseData["message"] ?? "Failed to create task");
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", e.toString());
    }
  }
}
