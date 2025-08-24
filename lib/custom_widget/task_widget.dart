import 'package:flutter/material.dart';
import '../all_colors/colors.dart';
import '../task_model/task_model.dart';


class TaskCard extends StatelessWidget {
  final Task task; // Task অবজেক্ট

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: kCardBackgroundColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.article_outlined,
            color: kPrimaryGreen,
            size: 24,
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title, // task.title ব্যবহার করা হয়েছে
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: kHeaderTextColor,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  task.description, // task.description ব্যবহার করা হয়েছে
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: kBodyTextColor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if (task.isCompleted)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.check_circle,
                color: kPrimaryGreen,
                size: 24,
              ),
            ),
        ],
      ),
    );
  }
}