import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sns_flutter/src/repository/user_repo.dart';

import '../home.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _userRepo = UserRepo();

  // 가입하기 버튼을 눌렀을 때 동작
  void submitButton() async {
    final prefs = await SharedPreferences.getInstance();

    if (_formKey.currentState!.validate()) {
      String name = _nameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;

      print('가입동작 name: $name, email: $email, password: $password');
      String? token = await _userRepo.login(name, email, password);
      if (token != null) {
        await prefs.setString('token', token);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (b) => Home()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Form(
            key: _formKey,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const Text(
                '회원가입',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              const Text(
                '반갑습니다 현장실습 프로젝트 교과 예제 프로젝트 SNS 서비스 입니다.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: '이름(닉네임)'),
                validator: (String? value) {
                  if (value == null || value!.trim().isEmpty) {
                    return "이름을 입력해야 합니다.";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: '아이디(email)'),
                keyboardType: TextInputType.emailAddress,
                validator: (String? value) {
                  if (value == null || value!.trim().isEmpty) {
                    return "이메일을 입력해야 합니다.";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: '비밀번호'),
                validator: (String? value) {
                  if (value == null || value!.trim().isEmpty) {
                    return "비밀번호를 입력해야 합니다.";
                  }
                  return null;
                },
              ),
              SizedBox(height: 50),
              ElevatedButton(
                child: Text('가입하기'),
                onPressed: submitButton,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
