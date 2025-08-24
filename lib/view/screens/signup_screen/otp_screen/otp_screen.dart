// import 'package:flutter/material.dart';
//
// import '../../../../custom_widget/custom_button.dart';
// import '../new_password_screen/new_password_scren.dart';
//
// class OtpInput extends StatelessWidget {
//   const OtpInput({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 48,
//       height: 48,
//       child: TextFormField(
//         style: const TextStyle(
//           fontSize: 24,
//           fontWeight: FontWeight.bold,
//           color: Color(0xFF1F2937),
//         ),
//         textAlign: TextAlign.center,
//         keyboardType: TextInputType.number,
//         decoration: InputDecoration(
//           filled: true,
//           fillColor: const Color(0xFFF9FAFB),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: const BorderSide(color: Color(0xFF10B981)),
//           ),
//           contentPadding: const EdgeInsets.symmetric(
//             horizontal: 0,
//             vertical: 0,
//           ),
//         ),
//         onChanged: (value) {
//           if (value.length == 1) {
//             FocusScope.of(context).nextFocus();
//           }
//         },
//       ),
//     );
//   }
// }
//
// class VerificationScreen extends StatelessWidget {
//   const VerificationScreen({Key? key}) : super(key: key);
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
//                   '6-digit code',
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF1F2937),
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 const Text(
//                   'Please enter the code we\'ve sent to michelle.rivera@example.com',
//                   style: TextStyle(fontSize: 16, color: Color(0xFF6B7280)),
//                 ),
//                 const SizedBox(height: 40),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: List.generate(6, (index) => const OtpInput()),
//                 ),
//                 const SizedBox(height: 24),
//                 CustomButton(
//                   text: 'Confirm',
//                   onPressed: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => SetNewPasswordScreen(),));
//                     // Confirmation logic here
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
