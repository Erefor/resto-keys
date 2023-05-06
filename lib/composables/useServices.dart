import 'package:dio/dio.dart';

Future useRegisUser(String email, String userName, String password) async {
  final dio = Dio(BaseOptions(
      baseUrl: 'http://resto-keys-api.burydev.tech',
      headers: {'content-type': 'application/json'}));
  final response = await dio.post('/create-user', data: {
    "password": "contraseña",
    "userName": 'usuarionuevo',
    "email": 'prueba@gmail.com'
  });
  print(response);
  return response;
}
