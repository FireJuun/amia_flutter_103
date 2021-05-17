import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/login_service.dart';
import 'login_view_controller.dart';

class LoginView extends StatelessWidget {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final LoginViewController _authController = Get.put(LoginViewController());

  SizedBox _heightBox(double size) => SizedBox(height: Get.height * size);
  SizedBox _widthBox(double size) => SizedBox(width: Get.width * size);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/fhir-fli-logo.png',
                    height: Get.width * 0.3,
                    width: Get.width * 0.3,
                  ),
                  Text('Login', style: TextStyle(fontSize: Get.width * .07)),
                ],
              ),
            ),
            _heightBox(0.05),
            Container(
              width: Get.width * .7,
              height: Get.height * 0.08,
              child: TextField(
                obscureText: false,
                controller: _userName,
                decoration: InputDecoration(
                  labelText: 'Username',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Get.width * 0.05)),
                ),
              ),
            ),
            _heightBox(0.01),
            Container(
              width: Get.width * .7,
              height: Get.height * 0.08,
              child: Obx(
                () => TextField(
                  obscureText: _authController.obscure,
                  controller: _password,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Get.width * 0.05)),
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                _widthBox(0.15),
                Obx(
                  () => Checkbox(
                    value: !_authController.obscure,
                    onChanged: (_) => _authController.obscureText(),
                  ),
                ),
                const Text('Show Password'),
              ],
            ),
            _heightBox(0.05),
            Container(
              width: Get.width * .7,
              height: Get.height * 0.07,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Get.width * 0.05),
                  ),
                ),
                onPressed: () {
                  // LoginService.login().call(_userName.text, _password.text);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[Text('Login')],
                ),
              ),
            ),
            _heightBox(0.03),
            Container(
              width: Get.width * .7,
              height: Get.height * 0.07,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Get.width * 0.05),
                  ),
                ),
                onPressed: () {
                  LoginService.loginWithFirebase()
                      .call(_userName.text, _password.text);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text('Login with Firebase'),
                  ],
                ),
              ),
            ),
            _heightBox(0.03),
            Container(
              width: Get.width * .7,
              height: Get.height * 0.07,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Get.width * 0.05),
                  ),
                ),
                onPressed: () {
                  LoginService.loginWithGoogle()
                      .call(_userName.text, _password.text);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text('Login with Google'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
