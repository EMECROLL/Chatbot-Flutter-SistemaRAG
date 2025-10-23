// lib/main.dart
import 'package:chat_bot_api_rag/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/chat/chat_screen.dart';
import 'features/chat/chat_controller.dart';
import 'theme/theme_controller.dart';

void main() {
  runApp(
    MultiProvider(
      //* Providers es la lista de controladores disponibles en la app
      providers: [
        //? ChangeNotifierProvider para manejar estado reactivo
        ChangeNotifierProvider(create: (_) => ChatController()), //? Se define asi por que ChatController extiende ChangeNotifier
        ChangeNotifierProvider(create: (_) => ThemeController()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = context.watch<ThemeController>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatbot RAG',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeController.themeMode,
      home: const ChatScreen(),
    );
  }
}