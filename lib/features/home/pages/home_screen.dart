import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/features/home/cubit/home_cubit.dart';
import 'package:flutter_app/features/home/cubit/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is HomeFailure) {
            return Center(child: Text(state.message));
          }

          if (state is HomeSuccess) {
            final specialities = state.data['data'] as List;

            return ListView(
              padding: EdgeInsets.all(15),
              children: [
                const SizedBox(height: 50),

                ...specialities.map((speciality) {
                  final doctors = speciality['doctors'] as List;

                  return Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        speciality['name'],
                        style: const TextStyle(fontSize: 20, fontWeight: .bold),
                      ),

                      const SizedBox(height: 10),

                      ...doctors.map(
                        (doctor) => Card(
                          margin: const EdgeInsets.only(bottom: 15),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                'assets/images/doctor.png',
                              ),
                            ),

                            title: Text(
                              doctor['name'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            subtitle: Text(
                              '${doctor['degree']} • ${doctor['appoint_price']} EGP',
                            ),

                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
