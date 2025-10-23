//* Configuración de la URL base del backend
const String backendBaseUrl = String.fromEnvironment(
  'BACKEND_URL',
  defaultValue: 'http://10.0.2.2:8000', //* 10.0.2.2 por que es la IP del emulador de android
);