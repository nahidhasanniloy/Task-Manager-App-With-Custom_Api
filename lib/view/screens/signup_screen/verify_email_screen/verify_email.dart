// import 'package:flutter/material.dart';
// import '../../../../custom_widget/custom_button.dart';
// import '../../../../custom_widget/custom_textfeld.dart';
// import '../otp_screen/otp_screen.dart';
//
//
//
// class VerifyEmailScreen extends StatelessWidget {
//   const VerifyEmailScreen({Key? key}) : super(key: key);
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
//                 const SizedBox(height: 120), // Adjust spacing to match the image
//                 const Text(
//                   'Verify Your Email',
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF1F2937),
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 const Text(
//                   'We\'ll send a verification code to this email to confirm your account.',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Color(0xFF6B7280),
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//
//                 // Using the custom text field for email address
//                 const CustomTextField(
//                   label: 'Email Address',
//                   hintText: 'adnanahid@example.com',
//                   icon: Icons.email_outlined,
//                   isPassword: false,
//                 ),
//                 const SizedBox(height: 24),
//
//                 // Using the custom button for "Send"
//                 CustomButton(
//                   text: 'Send',
//                   onPressed: () {
//                     // Verification logic goes here
//
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationScreen(),));
//
//
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