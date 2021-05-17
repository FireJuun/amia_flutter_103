import 'package:get/get.dart';

class LoginViewController extends GetxController {
  final _obscureText = true.obs;

  bool get obscure => _obscureText.value;

  void obscureText() => _obscureText.value = !_obscureText.value;
}
