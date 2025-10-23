import 'package:flutter/material.dart';
import 'chat_repository.dart';
import '../../core/api_client.dart';

class ChatController extends ChangeNotifier {
  final ChatRepository _repository = ChatRepository(ApiClient());

  final List<Map<String, String>> _messages = []; //* Historial de mensajes
  bool _loading = false;
  String? _error;

  List<Map<String, String>> get messages => _messages;
  bool get loading => _loading;
  String? get error => _error;

  //* Metodo para enviar un mensaje y obtener respuesta
  Future<void> send(String text) async {
    final message = text.trim();
    if (message.isEmpty || _loading) return;

    //* Agregar mensaje del usuario
    _messages.add({'role': 'user', 'content': message});
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      final history = _messages
          .map((m) => {'role': m['role']!, 'content': m['content']!})
          .toList();

      //* Consumimos el servicio
      final reply = await _repository.ask(message, history);

      _messages.add({
        'role': 'assistant',
        'content': reply,
      }); //* Respuesta del bot
    } catch (e) {
      final errorMessage = 'Error de aplicación: ${e.toString()}';
      _messages.add({'role': 'assistant', 'content': errorMessage});
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  //* Limpia el error actual
  void clearError() {
    _error = null;
    notifyListeners();
  }
}
