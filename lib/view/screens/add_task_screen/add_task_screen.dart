import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../controlers/task_create_controller.dart';
import '../login_screen/login_screen.dart';


class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TaskCreateController _taskController = Get.put(TaskCreateController());

  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  Future<void> _checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken");
    if (token == null || token.isEmpty) {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => LoginPage()),
        );
      }
    }
  }

  void _addTask() {
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();

    if (title.isEmpty) {
      _showWarningDialog();
    } else {
      _taskController.createTask(title: title, description: description);
    }
  }

  void _showWarningDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Warning"),
        content: const Text("Task title cannot be empty!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Task"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Obx(() => _taskController.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildTextField(_titleController, "Task Title"),
            const SizedBox(height: 20),
            _buildTextField(_descriptionController, "Task Description", maxLines: 5),
            const SizedBox(height: 40),
            // SizedBox(
            //   width: double.infinity,
            //
            //   child: ElevatedButton.icon(
            //     onPressed: _addTask,
            //     icon: const Icon(Icons.add),
            //     label: const Text("Add Task"),
            //   ),
            // ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _addTask,
                icon: const Icon(Icons.add),
                label: const Text("Add Task"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF84c000), // <-- Change this color
                  foregroundColor: Colors.white, // <-- Text & icon color
                  padding: const EdgeInsets.symmetric(vertical: 16), // optional: button height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // optional: rounded corners
                  ),
                ),
              ),
            )






          ],
        ),
      )),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}
