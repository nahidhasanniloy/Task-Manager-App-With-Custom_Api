import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import '../login_screen/login_screen.dart';
import '../../../../task_model/task_model.dart';
import '../add_task_screen/add_task_screen.dart';
import '../add_task_screen/task_details_screen/task_details_screen.dart';
import '../profile_screen/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    _checkToken();
    _fetchTasks();
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

  Future<void> _fetchTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken") ?? "";

    // if (token.isEmpty) {
    //   Get.snackbar("Error", "Please logged in");
    //   return;
    // }

    final url = Uri.parse("http://172.252.13.83:2000/api/v1/task/my-tasks");

    try {
      final response = await http.get(url, headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final dataList = body['data']['data'] as List;

        setState(() {
          _tasks = dataList.map((json) => Task(
            title: json['title'] ?? "",
            description: json['description'] ?? "",
            isCompleted: false, // API doesn't provide, set default false
          )).toList();
        });
      } else {
        // Get.snackbar("Error", "Failed to fetch tasks");
        print("error");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void _onItemTapped(int index) {
    if (index == 1) { // Add Task button
      _navigateToAddScreen();
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _navigateToAddScreen() async {
    final newTask = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddTaskScreen()),
    );
    if (newTask != null && newTask is Task) {
      setState(() {
        _tasks.add(newTask);
      });
    }
  }

  void _navigateToDetailsScreen(Task task) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TaskDetailsScreen(
          task: task,
          onDelete: (deletedTask) {
            setState(() {
              _tasks.remove(deletedTask);
            });
            Navigator.pop(context);
          },
          onEdit: (updatedTask) {
            setState(() {
              final index = _tasks.indexOf(task);
              if (index != -1) _tasks[index] = updatedTask;
            });
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  Widget _buildMyTasksScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 30),
          _buildMyTasksHeading(),
          const SizedBox(height: 10),
          _buildTaskList(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/133763369?s=400&u=2eb844ab8d62bda196edebd9c0ecd4d2ea70a532&v=4'),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello Mojahid', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('Welcome to Task Manager', style: TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.logout, color: Colors.red),
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            await prefs.remove("accessToken");
            if (mounted) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginPage()),
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildMyTasksHeading() {
    return const Text('My Tasks', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold));
  }

  Widget _buildTaskList() {
    return Column(
      children: _tasks.map((task) {
        return GestureDetector(
          onTap: () => _navigateToDetailsScreen(task),
          child: _buildTaskCard(task),
        );
      }).toList(),
    );
  }

  Widget _buildTaskCard(Task task) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 5)],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: task.isCompleted ? Colors.lightGreen.withOpacity(0.1) : Colors.orange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.assignment, color: task.isCompleted ? Colors.lightGreen : Colors.orange),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(task.description, style: TextStyle(fontSize: 12, color: Colors.grey[600]), maxLines: 2, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5, spreadRadius: 1, offset: Offset(0, -1))],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.lightGreen,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: 'Add'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildScreenContent() {
    if (_selectedIndex == 0) return _buildMyTasksScreen();
    if (_selectedIndex == 1) return const AddTaskScreen();
    return const ProfileScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreenContent(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
