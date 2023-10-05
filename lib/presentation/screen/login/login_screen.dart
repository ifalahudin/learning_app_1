import 'package:flutter/material.dart';
import 'package:learning_app_1/presentation/screen/home/home_pages.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset('assets/Image/ilust_1.png'),
                const SizedBox(height: 12),
                const Text(
                  'Selamat Datang',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const Text(
                  'Selamat Datang di Aplikasi Widya Edu\n'
                  'Aplikasi Latihan dan Konsultasi Soal',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  icon: Image.asset(
                    'assets/Icons/googleIcon.png',
                    width: 12,
                  ),
                  label: const Text('Masuk dengan Google'),
                ),
                const SizedBox(
                  height: 12,
                ),
                FilledButton.icon(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/Icons/apple-logo.png',
                    width: 12,
                  ),
                  label: const Text('Masuk dengan Apple ID'),
                ),
                TextButton(onPressed: () {}, child: const Text('Daftar akun'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
