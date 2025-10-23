import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chat_controller.dart';
import '../../widgets/message_bubble.dart';
import '../../widgets/typing_indicator.dart';
import '../../theme/theme_controller.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ChatController>();
    final themeController = context.watch<ThemeController>();
    final textController = TextEditingController();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Chatbot RAG"),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primary,
        actions: [
          IconButton(
            icon: Icon(
              themeController.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: Colors.white,
            ),
            onPressed: () => themeController.toggleTheme(),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            //* Historial
            Expanded(
              child: ListView.builder(
                reverse: true,
                padding: const EdgeInsets.all(12),
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final m = controller
                      .messages[controller.messages.length - 1 - index];
                  return MessageBubble(
                    content: m['content'] ?? '',
                    isUser: m['role'] == 'user',
                  );
                },
              ),
            ),

            //* Loading
            if (controller.loading) const TypingIndicator(),

            //* Input
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textController,
                      onSubmitted: (text) {
                        controller.send(text);
                        textController.clear();
                      },
                      enabled: !controller.loading,
                      decoration: InputDecoration(
                        hintText: 'Escribe tu pregunta...',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Material(
                    color: controller.loading
                        ? Colors.grey.shade400
                        : theme.colorScheme.primary,
                    shape: const CircleBorder(),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: controller.loading
                          ? null
                          : () {
                              controller.send(textController.text);
                              textController.clear();
                            },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
