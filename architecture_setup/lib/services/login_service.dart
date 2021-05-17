import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:remote_state/remote_state.dart';

import 'basic_login.dart';
import 'firebase_login.dart';
import 'google_login.dart';

part 'login_service.freezed.dart';

@freezed
class LoginService with _$LoginService {
  LoginService._();

  factory LoginService.loginBasic({
    required Rx<RemoteState<dynamic>> state,
  }) = _LoginBasic;

  factory LoginService.loginFirebase({
    required Rx<RemoteState<dynamic>> state,
  }) = _LoginFirebase;

  factory LoginService.loginGoogle({
    required Rx<RemoteState<dynamic>> state,
  }) = _LoginGoogle;

  factory LoginService.login() =>
      LoginService.loginBasic(state: RemoteState<dynamic>.initial().obs);

  factory LoginService.loginWithFirebase() =>
      LoginService.loginFirebase(state: RemoteState<dynamic>.initial().obs);

  factory LoginService.loginWithGoogle() =>
      LoginService.loginGoogle(state: RemoteState<dynamic>.initial().obs);

  void call(String username, String password) {
    map(
      loginBasic: (m) async {
        m.state.value = RemoteState<dynamic>.loading();
        try {
          await BasicLogin().call(username, password);
          m.state.value =
              RemoteState<dynamic>.success('Successfully logged in');
        } catch (e) {
          m.state.value = RemoteState<dynamic>.error(e);
        }
      },
      loginFirebase: (m) async {
        m.state.value = RemoteState<dynamic>.loading();
        try {
          await FirebaseLogin().call(username, password);
          m.state.value = RemoteState<dynamic>.success(
              'Successfully logged in to Organization');
        } catch (e) {
          m.state.value = RemoteState<dynamic>.error(e);
        }
      },
      loginGoogle: (m) async {
        m.state.value = RemoteState<dynamic>.loading();
        try {
          await GoogleLogin().call(username, password);
          m.state.value =
              RemoteState<dynamic>.success('Successfully logged in to Google');
        } catch (e) {
          m.state.value = RemoteState<dynamic>.error(e);
        }
      },
    );
  }
}
