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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Please login with your credentials',
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
                  prefixIcon: const Icon(Icons.supervised_user_circle),
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
              const SizedBox(height: 24),

              GestureDetector(
                onTap:
                    () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                },


                child: Container(
                  child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ),

              SizedBox(height: 18),


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
                    "Login",
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
    );
  }
}
