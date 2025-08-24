// import 'package:flutter/material.dart';
// import 'package:toduapp1/view/screens/login_screen/login_screen.dart';
//
// import '../../../../custom_widget/custom_button.dart';
// import '../../../../custom_widget/custom_textfeld.dart';
//
//
// class SetNewPasswordScreen extends StatelessWidget {
//   const SetNewPasswordScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(24.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 120),
//                 const Text(
//                   'Set Your New Password',
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF1F2937),
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 const Text(
//                   'Create a secure password to protect your account and get started seamlessly!',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Color(0xFF6B7280),
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//
//                 // New Password Field
//                 const CustomTextField(
//                   label: 'New Password',
//                   hintText: '*********',
//                   isPassword: true,
//                   icon: Icons.lock_outline,
//                 ),
//                 const SizedBox(height: 16),
//
//                 // New Confirm Password Field
//                 const CustomTextField(
//                   label: 'New Confirm Password',
//                   hintText: '*********',
//                   isPassword: true,
//                   icon: Icons.lock_outline,
//                 ),
//                 const SizedBox(height: 24),
//
//                 // "Continue" button
//                 CustomButton(
//                   text: 'Continue',
//                   onPressed: () {
//                     // Password setting logic here
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }