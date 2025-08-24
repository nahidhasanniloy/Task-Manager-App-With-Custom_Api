
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final IconData? icon;
  final bool isPassword;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.hintText,
    this.icon,
    this.isPassword = false, required TextEditingController controller,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  // পাসওয়ার্ডের দৃশ্যমানতা নিয়ন্ত্রণ করার জন্য একটি স্টেট ভেরিয়েবল
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1F2937),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          // _isPasswordVisible এর উপর ভিত্তি করে টেক্সট লুকানো বা দেখানো হবে
          obscureText: _isPasswordVisible,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
            prefixIcon: widget.icon != null ? Icon(widget.icon, color: const Color(0xFF9CA3AF)) : null,
            // যদি isPassword ট্রু হয়, তাহলে একটি suffixIcon দেখাবে
            suffixIcon: widget.isPassword
                ? IconButton(
              icon: Icon(
                // _isPasswordVisible এর উপর ভিত্তি করে আইকন পরিবর্তন হবে
                _isPasswordVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                color: const Color(0xFF9CA3AF),
              ),
              onPressed: () {
                // setState ব্যবহার করে দৃশ্যমানতা পরিবর্তন করা হবে
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            )
                : null,
            filled: true,
            fillColor: const Color(0xFFF9FAFB),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF84c000)),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          style: const TextStyle(color: Color(0xFF1F2937)),
        ),
      ],
    );
  }
}