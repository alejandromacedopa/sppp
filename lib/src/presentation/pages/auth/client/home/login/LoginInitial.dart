import 'package:flutter/material.dart';
import 'dart:ui'; // Necesario para BackdropFilter

class LoginInitial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImage(),
          _buildBlurEffect(),
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/img/logininicial.png'), // Cambia a tu imagen de fondo
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildBlurEffect() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Container(
        color: Colors.black.withOpacity(0.5),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Spacer(flex: 2),
          _buildTitle(),
          SizedBox(height: 10),
          _buildSubtitle(),
          Spacer(flex: 3),
          _buildLoginButton(context),
          SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 65,
          fontWeight: FontWeight.bold,
        ),
        children: <TextSpan>[
          TextSpan(text: 'Practice', style: TextStyle(color: Colors.white)),
          TextSpan(text: 'Log', style: TextStyle(color: Colors.orange)),
        ],
      ),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      'EVALÚA, MEJORA, TRIUNFA',
      style: TextStyle(
        color: Colors.orangeAccent,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(
              context, 'login/screen'); // Navega a la pantalla de Login
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          'Ingresar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
