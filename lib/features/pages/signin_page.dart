import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_app/core/styles/Color_manager.dart';
import 'package:flutter_app/core/styles/Units.dart';
import 'package:flutter_app/features/cubit/auth_cubit.dart';
import 'package:flutter_app/features/cubit/auth_state.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
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
              Center(child: Text(state.message));
            }
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: Units.width(context, 24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Units.height(context, 55)),
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
                  "Sign up now and start exploring all that our app has to offer.",
                  style: TextStyle(
                    fontSize: Units.textSize(context, 15),
                    color: ColorManager.secondary,
                    height: 1.55,
                  ),
                ),
                SizedBox(height: Units.height(context, 30)),
                TextField(
                  controller: nameController,

                  decoration: InputDecoration(
                    hintText: 'Name',

                    contentPadding: .symmetric(
                      horizontal: Units.width(context, 20),
                      vertical: Units.height(context, 17),
                    ),
                  ),
                ),
                SizedBox(height: Units.height(context, 15)),
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
                  controller: phoneController,

                  decoration: InputDecoration(
                    hintText: 'Phone',

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
                            context.read<AuthCubit>().register(
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              password: passwordController.text,
                              passwordConfirmation: passwordController.text,
                              gender: '0',
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              Units.radius(context, 15),
                            ),
                          ),
                        ),
                        child: loading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'Create Account',
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
                SizedBox(height: Units.height(context, 50)),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(
                          fontSize: Units.textSize(context, 11),
                          color: ColorManager.text,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => context.go('/login'),
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
                GestureDetector(
                  onTap: () => context.go('/home'),
                  child: Text(
                    'hack system and go to home ',
                    style: TextStyle(
                      fontSize: Units.textSize(context, 11),
                      color: ColorManager.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
