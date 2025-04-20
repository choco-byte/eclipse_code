import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eclipse_code/welcome_screen.dart';

class LogoScreen extends StatefulWidget {
  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WelcomeScreen()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Logo(),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Ambil ukuran layar

    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0.1, 0.1),
          radius: 1.0,
          colors: [
            Color(0xFFE11F22),
            Color(0xFF9D1518),
            Color(0xFF7B1113),
          ],
        ),
      ),
      child: Center(
        child: SvgPicture.asset(
          'assets/logo_eclipse.svg',
          width: size.width * 0.6, // Responsive lebar logo: 60% dari layar
          height: size.width * 0.6,
        ),
      ),
    );
  }
}
