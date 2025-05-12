import 'package:clean_architecture_bloc/features/home/presentation/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<FetchProgressList>((event, emit) {
      final progressList = [
        ProgressModel(true, 'M'),
        ProgressModel(true, 'T'),
        ProgressModel(true, 'W'),
        ProgressModel(false, 'T'),
        ProgressModel(false, 'F'),
      ];
      emit(ProgressLoaded(progressList));
    });
  }
}