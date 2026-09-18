import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_app/core/styles/Color_manager.dart';
import 'package:flutter_app/core/styles/Units.dart';
import 'package:flutter_app/features/cubit/auth_cubit.dart';
import 'package:flutter_app/features/cubit/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: SafeArea(
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              context.go('/home');
            }
            if (state is AuthFail) {
              Center(child: Text(state.message ?? "error has occured"));
            }
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: Units.width(context, 24)),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                SizedBox(height: Units.height(context, 65)),
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: Units.textSize(context, 25),
                    fontWeight: FontWeight.w700,
                    color: ColorManager.primary,
                  ),
                ),
                SizedBox(height: Units.height(context, 10)),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: TextStyle(
                    fontSize: Units.textSize(context, 15),
                    color: ColorManager.secondary,
                    height: 1.55,
                  ),
                ),
                SizedBox(height: Units.height(context, 35)),

                TextField(
                  controller: emailController,

                  decoration: InputDecoration(
                    hintText: 'Email',

                    contentPadding: .symmetric(
                      horizontal: Units.width(context, 20),
                      vertical: Units.height(context, 17),
                    ),
                  ),
                ),
                SizedBox(height: Units.height(context, 15)),
                TextField(
                  controller: passwordController,

                  decoration: InputDecoration(
                    hintText: 'Password',

                    contentPadding: .symmetric(
                      horizontal: Units.width(context, 20),
                      vertical: Units.height(context, 17),
                    ),
                  ),
                ),
                SizedBox(height: Units.height(context, 18)),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (_) {}),
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
                SizedBox(height: Units.height(context, 30)),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    final loading = state is AuthLoading;
                    return SizedBox(
                      width: double.infinity,
                      height: Units.height(context, 52),
                      child: ElevatedButton(
                        onPressed: () {
                          if (!loading) {
                            context.read<AuthCubit>().login(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.primary,
                        ),
                        child: loading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: Units.textSize(context, 16),
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    );
                  },
                ),
                SizedBox(height: Units.height(context, 45)),
                Row(
                  children: [
                    Padding(
                      padding: .symmetric(horizontal: Units.width(context, 12)),
                      child: Text(
                        'Or sign in with',
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
                    const FaIcon(FontAwesomeIcons.google),
                    SizedBox(width: Units.width(context, 25)),
                    FaIcon(FontAwesomeIcons.facebook),
                    SizedBox(width: Units.width(context, 25)),
                    const FaIcon(FontAwesomeIcons.apple),
                  ],
                ),
                SizedBox(height: Units.height(context, 80)),
                Center(
                  child: Text(
                    'By logging, you agree to our Terms & Conditions and Privacy Policy.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Units.textSize(context, 11),
                      color: ColorManager.secondary,
                    ),
                  ),
                ),
                SizedBox(height: Units.height(context, 25)),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                        style: TextStyle(
                          fontSize: Units.textSize(context, 11),
                          color: ColorManager.text,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {context.go('/signin')},
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
                SizedBox(height: Units.height(context, 38)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
