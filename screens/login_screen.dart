import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isRegistering = false;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text(isRegistering ? 'Register' : 'Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: const InputDecoration(labelText: 'Email')),
            TextField(controller: passwordController, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
            const SizedBox(height: 20),
            authProvider.isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      final email = emailController.text.trim();
                      final password = passwordController.text.trim();
                      isRegistering
                          ? authProvider.signUp(email, password)
                          : authProvider.signIn(email, password);
                    },
                    child: Text(isRegistering ? 'Register' : 'Login'),
                  ),
            const SizedBox(height: 12),
            if (authProvider.error != null) Text(authProvider.error!, style: const TextStyle(color: Colors.red)),
            TextButton(
              onPressed: () => setState(() => isRegistering = !isRegistering),
              child: Text(isRegistering ? 'Already have an account? Login' : 'Don’t have an account? Register'),
            ),
          ],
        ),
      ),
    );
  }
}
