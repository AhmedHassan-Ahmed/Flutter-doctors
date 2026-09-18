import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/features/home/data/home_get.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeGet homeGet=HomeGet();

  HomeCubit() : super(HomeInitial());

  Future<void> getHome() async {
    emit(HomeLoading());

    try {
      final data = await homeGet.getHomeproducts();
      emit(HomeSuccess(data));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
