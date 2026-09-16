import 'package:flutter/material.dart';
import 'package:flutter_app/core/styles/Color_manager.dart';
import 'package:flutter_app/core/styles/Units.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_symbols_icons/google_symbols_icons.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: SafeArea(
        child: Padding(
          padding: .symmetric(horizontal: Units.w(context, 24)),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: Units.h(context, 65)),
              Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: Units.textSize(context, 25),
                  fontWeight: FontWeight.w700,
                  color: ColorManager.primary,
                ),
              ),
              SizedBox(height: Units.h(context, 10)),
              Text(
                "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                style: TextStyle(
                  fontSize: Units.textSize(context, 15),
                  color: ColorManager.secondary,
                  height: 1.55,
                ),
              ),
              SizedBox(height: Units.h(context, 35)),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    fontSize: Units.textSize(context, 14),
                    color: ColorManager.hint,
                  ),
                  contentPadding: .symmetric(
                    horizontal: Units.w(context, 20),
                    vertical: Units.h(context, 17),
                  ),
                ),
              ),
              SizedBox(height: Units.h(context, 15)),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    fontSize: Units.textSize(context, 14),
                    color: ColorManager.hint,
                  ),
                  contentPadding: .symmetric(
                    horizontal: Units.w(context, 20),
                    vertical: Units.h(context, 17),
                  ),
                ),
              ),
              SizedBox(height: Units.h(context, 18)),
              Row(
                children: [
                  SizedBox(
                    width: Units.w(context, 22),
                    height: Units.w(context, 22),
                    child: Checkbox(value: false, onChanged: (value) {}),
                  ),
                  SizedBox(width: Units.w(context, 10)),
                  Text(
                    'Remember me',
                    style: TextStyle(
                      fontSize: Units.textSize(context, 12),
                      color: ColorManager.secondary,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: Units.textSize(context, 12),
                      color: ColorManager.primary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: Units.h(context, 40)),
              SizedBox(
                width: double.infinity,
                height: Units.h(context, 52),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: .circular(Units.r(context, 15)),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: Units.textSize(context, 16),
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Units.h(context, 48)),
              Row(
                mainAxisAlignment: .center,

                children: [
                  Padding(
                    padding: .symmetric(horizontal: Units.w(context, 120)),
                    child: Text(
                      'Or sign in with',
                      style: TextStyle(
                        fontSize: Units.textSize(context, 12),
                        color: ColorManager.secondary,
                      ),
                    ),
                  ),
                  const Expanded(child: Divider(color: ColorManager.line)),
                ],
              ),
              SizedBox(height: Units.h(context, 25)),
              Row(
                mainAxisAlignment: .center,
                children: [
                  FaIcon(FontAwesomeIcons.google),
                  SizedBox(width: Units.w(context, 25)),
                  Icon(Icons.facebook),
                  SizedBox(width: Units.w(context, 25)),
                  const FaIcon(FontAwesomeIcons.apple),
                ],
              ),
              const Spacer(),
              Center(
                child: Column(
                  children: [
                    Text(
                      'By logging, you agree to our',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: Units.textSize(context, 11),
                        color: ColorManager.secondary,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Terms & Conditions',
                          style: TextStyle(
                            fontSize: Units.textSize(context, 11),
                            color: ColorManager.text,
                          ),
                        ),
                        Text(
                          ' and ',
                          style: TextStyle(
                            fontSize: Units.textSize(context, 11),
                            color: ColorManager.secondary,
                          ),
                        ),
                        Text(
                          'Privacy Policy.',
                          style: TextStyle(
                            fontSize: Units.textSize(context, 11),
                            color: ColorManager.text,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: Units.h(context, 25)),
              Center(
                child: Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      'Already have an account yet? ',
                      style: TextStyle(
                        fontSize: Units.textSize(context, 11),
                        color: ColorManager.text,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.go('/signin');
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: Units.textSize(context, 11),
                          color: ColorManager.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Units.h(context, 38)),
            ],
          ),
        ),
      ),
    );
  }
}
