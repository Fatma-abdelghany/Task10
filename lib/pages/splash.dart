import 'package:flutter/material.dart';
import 'package:shopify/pages/register_tab_pages.dart';

import 'login_page.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    checkUser();
    super.initState();
  }

  void checkUser() async {
    await Future.delayed(const Duration(milliseconds:800));

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => RegisterTabPages()));


  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/Logo.png"),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
