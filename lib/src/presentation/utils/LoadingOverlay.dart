import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5), // Fondo semitransparente
      child: Center(
        child: SizedBox(
          width: 60,
          height: 60,
          child: CircularProgressIndicator(
            strokeWidth: 6,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        ),
      ),
    );
  }
}
