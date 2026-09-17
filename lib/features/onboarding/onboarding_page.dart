import 'package:flutter/material.dart';
import 'package:flutter_app/core/styles/Color_manager.dart';
import 'package:flutter_app/core/styles/Units.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: Units.height(context, 40)),
            Row(
              mainAxisAlignment: .center,
              children: [
                SizedBox(width: Units.width(context, 5)),
                Text(
                  'Docdoc',
                  style: TextStyle(
                    fontSize: Units.textSize(context, 25),
                    fontWeight: FontWeight.w700,
                    color: ColorManager.text,
                  ),
                ),
              ],
            ),
            SizedBox(height: Units.height(context, 35)),
            SizedBox(
              width: double.infinity,
              height: Units.height(context, 390),
              child: Image.asset('assets/images/doctor.png', fit: BoxFit.cover),
            ),
            const Spacer(),
            Text(
              'Best Doctor',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Units.textSize(context, 31),
                fontWeight: FontWeight.w700,
                color: ColorManager.primary,
              ),
            ),
            Text(
              'Appointment App',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Units.textSize(context, 31),
                fontWeight: FontWeight.w700,
                color: ColorManager.primary,
              ),
            ),
            SizedBox(height: Units.height(context, 18)),
            Padding(
              padding: .symmetric(horizontal: Units.width(context, 35)),
              child: Text(
                'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                textAlign: .center,
                style: TextStyle(
                  fontSize: Units.textSize(context, 11),
                  color: ColorManager.secondary,
                  height: 1.4,
                ),
              ),
            ),
            SizedBox(height: Units.height(context, 15)),
            Padding(
              padding: .symmetric(horizontal: Units.width(context, 32)),
              child: SizedBox(
                width: double.infinity,
                height: Units.height(context, 52),
                child: ElevatedButton(
                  onPressed: () {
                    context.go('/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: .circular(Units.radius(context, 15)),
                    ),
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: Units.textSize(context, 16),
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: Units.height(context, 45)),
          ],
        ),
      ),
    );
  }
}
