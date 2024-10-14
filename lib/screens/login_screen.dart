import 'package:flutter/material.dart';
import 'package:absen_modul/screens/home_screen.dart'; // Ganti dengan path yang benar ke HomePage Anda

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  void _login() {
    String email = emailController.text;
    String password = passwordController.text;

    // Hardcoded email dan password untuk validasi
    const correctEmail = 'admin';
    const correctPassword = 'admin123';

    // Lakukan validasi sederhana
    if (email == correctEmail && password == correctPassword) {
      // Jika login berhasil, navigasikan ke HomePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      // Tampilkan pesan error jika email atau password salah
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Incorrect email or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              const Center(
                child: Column(
                  children: [
                    Image(
                      image: AssetImage(
                        'lib/images/download__10_-removebg-preview.png',
                      ),
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      "ATTENDANCE",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        letterSpacing: 2,
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
              Text(
                "WELCOME",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                "Please login with your information",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 60),
              const Text(
                "Email Address",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "Enter your email",
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "Password",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              TextField(
                controller: passwordController,
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                      const Text("Remember me"),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("I forgot my password"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  minimumSize: const Size.fromHeight(60),
                ),
                child: const Text("LOGIN"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
