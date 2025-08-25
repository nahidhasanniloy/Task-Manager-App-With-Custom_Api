import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controlers/Signup_controller.dart';
import '../../../controlers/login_controller.dart';
import '../login_screen/login_screen.dart';

class Signup_Screen extends StatelessWidget {
  Signup_Screen({Key? key}) : super(key: key);

  // Inject Controller
  final SignupController controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Create Your Account',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Join Task Manager today — organize better, work smarter, and stay in control of your day.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF6B7280),
                  ),
                ),
                const SizedBox(height: 40),
        
                TextField(
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    labelText: "user name",
                    hintText: "Enter your name",
                    prefixIcon: const Icon(Icons.person_2_outlined,size: 22,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
        
        
                // Email field
                TextField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    hintText: "example@email.com",
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
        
                // Password field
                TextField(
                  controller: controller.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Your password",
                    prefixIcon: const Icon(Icons.lock_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(height: 29),
                // ================================I agree to terms and conditions checkbox
                Row(
                  children: [
                    Checkbox(
                      value: false, // You can use state management to change this value
                      onChanged: (bool? value) {},
                      activeColor: const Color(0xFF84c000),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        'I agree to the Terms & Conditions and Privacy Policy.',
                        style: TextStyle(color: Color(0xFF6B7280)),
                      ),
                    ),
                  ],
                ),
        
                const SizedBox(height: 24),
        
                //====================================================   "OR" section
        
                Row(
                  children: const [
                    Expanded(child: Divider(color: Color(0xFFD1D5DB))),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'OR',
                        style: TextStyle(color: Color(0xFF6B7280)),
                      ),
                    ),
                    Expanded(child: Divider(color: Color(0xFFD1D5DB))),
                  ],
                ),
                const SizedBox(height: 24),
        
                // =================================== "Sign up" section =============================
        
        
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle login logic
                          Navigator.push(context, MaterialPageRoute(builder:(context) {
                            return LoginPage();
                          },));
                        },
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            color: Color(0xFF84c000),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Login button with loading state
                Obx(() => SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF84c000),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: controller.loading.value
                        ? null
                        : () {
                      controller.signupApi();
                    },
                    child: controller.loading.value
                        ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                        : const Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
