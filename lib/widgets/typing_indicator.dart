import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // Requiere flutter_spinkit en pubspec.yaml

class TypingIndicator extends StatelessWidget {
  const TypingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final color = isDark ? theme.colorScheme.primary : const Color(0xFF1E3A8A);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //* Amimacion de loading
          SpinKitThreeBounce(
            color: color,
            size: 15.0,
          ),
          const SizedBox(width: 12),
          //* Texto indicador
          Text(
            "Preparando respuesta...",
            style: TextStyle(
              color: color,
              fontStyle: FontStyle.italic,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
