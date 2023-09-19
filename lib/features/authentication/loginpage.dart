import 'package:abhinash_trexis/config/colors.dart';
import 'package:abhinash_trexis/config/temp_data.dart';
import 'package:abhinash_trexis/utils/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // context.go('/home');
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  FocusNode inputNode = FocusNode();
  final _loginKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    inputNode.dispose();

    super.dispose();
  }

  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _loginKey,
            child: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: Icon(
                    Icons.ac_unit,
                    color: AppColors.primary,
                    size: MediaQuery.of(context).size.height / 3.5,
                  ),
                ),
                const Text(
                  'User Name',
                  style: TextStyle(
                      color: AppColors.textlight,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                addHeight(4),
                TextFormField(
                  key: const Key('username'),
                  cursorColor: AppColors.primary,
                  keyboardType: TextInputType.text,
                  controller: _userName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter User Name';
                    }
                    return null;
                  },
                  decoration: custInputDec('Enter username', false),
                ),
                addHeight(16),
                const Text(
                  'Password',
                  style: TextStyle(
                      color: AppColors.textlight,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                addHeight(4),
                TextFormField(
                  key: const Key('password'),
                  cursorColor: AppColors.primary,
                  keyboardType: TextInputType.text,
                  controller: _password,
                  obscureText: isPasswordVisible,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Password';
                    }
                    return null;
                  },
                  decoration: custInputDec('Enter password', true),
                ),
                addHeight(30),
                GestureDetector(
                  onTap: _loginFunction,
                  child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          color: AppColors.primary),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Login',
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  _loginFunction() {
    if (_loginKey.currentState!.validate()) {
      trexis.setUserName = _userName.text;
      context.go('/home');
    }
  }

  InputDecoration custInputDec(String hint, bool isPassword) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      hintText: hint,
      hintStyle: const TextStyle(color: Color(0xff92A0B3), fontSize: 14),
      filled: true,
      suffixIcon: isPassword
          ? GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
              child: Icon(
                isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                color: AppColors.buttonBlue,
              ),
            )
          : null,
      fillColor: const Color(0xffFFFFFF),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        borderSide: BorderSide(
          color: AppColors.buttonBlue,
          width: 1.0,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        borderSide: BorderSide(
          color: AppColors.buttonBlue,
          width: 1.0,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        borderSide: BorderSide(
          color: AppColors.red,
          width: 1.0,
        ),
      ),
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        borderSide: BorderSide(
          color: AppColors.primary,
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: const BorderSide(
          color: AppColors.primary,
          width: 1.0,
        ),
      ),
    );
  }
}
