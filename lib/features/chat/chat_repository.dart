import 'package:dio/dio.dart';
import '../../core/api_client.dart';

class ChatRepository {
  final ApiClient _apiClient;

  ChatRepository(this._apiClient);

  //* Servicio que hace el post
  Future<String> ask(String message, List<Map<String, String>> history) async {
    try {
      final resp = await _apiClient.dio.post(
        '/chat',
        data: {'message': message, 'history': history},
      );
      return resp.data['answer']?.toString() ??
          'Error: El backend no devolvió la clave "answer".';
    } on DioException catch (e) {
      if (e.response != null) {
        return 'Error: Fallo del servidor. Código: ${e.response?.statusCode}';
      } else if (e.type == DioExceptionType.connectionTimeout) {
        return 'Error: Tiempo de conexión agotado. Verifica tu red.';
      } else {
        return 'Error: Problema de red inesperado. ${e.message}';
      }
    } catch (e) {
      return 'Error: Inesperado. ${e.toString()}';
    }
  }
}
