import 'package:cc_bloc/src/cc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial()) {
    CCBloc.register(this);
  }

  void test2() async{
    CCBloc.loading<MainCubit>();
    CCBloc.updated<MainCubit>();
  }
}

abstract class MainState {}

class MainInitial extends MainState {}
