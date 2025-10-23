import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String content;
  final bool isUser;

  const MessageBubble({
    Key? key,
    required this.content, //* Contenido del mensaje
    required this.isUser, //* Indica si el mensaje es del usuario o del bot para el estilo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final userColor = isDark ? theme.colorScheme.primary : const Color(0xFF1E3A8A);
    final botColor = isDark ? Colors.grey.shade800 : const Color(0xFFE3E9F0);
    final botTextColor = isDark ? Colors.white70 : Colors.black87;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft, //* Alineación según si es usuario o bot
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isUser
              ? userColor //* Color usuario
              : botColor, //* Color bot
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft: Radius.circular(isUser ? 20 : 0),
            bottomRight: Radius.circular(isUser ? 0 : 20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          content,
          style: TextStyle(
            fontSize: 16,
            color: isUser ? Colors.white : botTextColor, //* Color del texto si es usuario o bot
          ),
        ),
      ),
    );
  }
}
