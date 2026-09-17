import 'package:flutter/material.dart';

import 'package:flutter_app/core/styles/Color_manager.dart';
import 'package:flutter_app/core/styles/Units.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:go_router/go_router.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: SafeArea(
        child: Padding(
          padding: .symmetric(horizontal: Units.width(context, 24)),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: Units.height(context, 65)),

              Text(
                'Create Account',
                style: TextStyle(
                  fontSize: Units.textSize(context, 25),
                  fontWeight: FontWeight.w700,
                  color: ColorManager.primary,
                ),
              ),

              SizedBox(height: Units.height(context, 10)),

              Text(
                "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                style: TextStyle(
                  fontSize: Units.textSize(context, 15),
                  color: ColorManager.secondary,
                  height: 1.55,
                ),
              ),

              SizedBox(height: Units.height(context, 35)),

              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    fontSize: Units.textSize(context, 14),
                    color: ColorManager.hint,
                  ),
                  contentPadding: .symmetric(
                    horizontal: Units.width(context, 20),
                    vertical: Units.height(context, 17),
                  ),
                ),
              ),

              SizedBox(height: Units.height(context, 15)),

              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    fontSize: Units.textSize(context, 14),
                    color: ColorManager.hint,
                  ),
                  contentPadding: .symmetric(
                    horizontal: Units.width(context, 20),
                    vertical: Units.height(context, 17),
                  ),
                ),
              ),

              SizedBox(height: Units.height(context, 15)),

              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: '+20 |   Your number',
                  hintStyle: TextStyle(
                    fontSize: Units.textSize(context, 14),
                    color: ColorManager.hint,
                  ),
                  contentPadding: .symmetric(
                    horizontal: Units.width(context, 20),
                    vertical: Units.height(context, 17),
                  ),
                ),
              ),

              SizedBox(height: Units.height(context, 32)),

              SizedBox(
                width: double.infinity,
                height: Units.height(context, 52),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: .circular(Units.radius(context, 15)),
                    ),
                  ),
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: Units.textSize(context, 16),
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              SizedBox(height: Units.height(context, 48)),

              Row(
                children: [
                  Padding(
                    padding: .symmetric(horizontal: Units.width(context, 110)),
                    child: Text(
                      'Or sign up with',
                      style: TextStyle(
                        fontSize: Units.textSize(context, 12),
                        color: ColorManager.secondary,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: Units.height(context, 25)),

              Row(
                mainAxisAlignment: .center,
                children: [
                  FaIcon(FontAwesomeIcons.google),
                  SizedBox(width: Units.width(context, 24)),

                  FaIcon(FontAwesomeIcons.facebook),

                  SizedBox(width: Units.width(context, 25)),

                  FaIcon(FontAwesomeIcons.apple),
                ],
              ),

              const Spacer(),

              Center(
                child: Column(
                  children: [
                    Text(
                      'By signing up, you agree to our',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: Units.textSize(context, 11),
                        color: ColorManager.secondary,
                      ),
                    ),

                    Row(
                      mainAxisAlignment: .center,
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

              SizedBox(height: Units.height(context, 25)),

              Center(
                child: Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(
                        fontSize: Units.textSize(context, 11),
                        color: ColorManager.text,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        context.go('/login');
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: Units.textSize(context, 11),
                          color: ColorManager.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: Units.height(context, 38)),
            ],
          ),
        ),
      ),
    );
  }
}
