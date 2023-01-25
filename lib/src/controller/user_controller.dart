import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sns_flutter/src/repository/user_repository.dart';

class UserController extends GetxController {
  // 기존에 생성된 객체가 있으면 가져오고 아니면 생성
  // 싱글톤
  final userRepo = Get.put(UserRepository());

  String? token;

  /// 앱에 저장된 토큰을 가져오는 함수
  /// 토큰이 없으면 null을 리턴
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    return (token != null) ? token : null;
  }

  /// 회원가입(이름, 이메일, 비밀번호)
  /// 정상 동작시 true, 실패시 false
  Future<bool> register(String name, String email, String password) async {
    String? token = await userRepo.register(name, email, password);

    if (token != null) {
      token = token;
      return true;
    }
    return false;
  }

  /// 로그인(이메일, 비밀번호)
  /// 정상 동작시 true, 실패시 false
  Future<bool> login(String email, String password) async {
    String? token = await userRepo.login(email, password);

    if (token != null) {
      token = token;
      return true;
    }
    return false;
  }
}
