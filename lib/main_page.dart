import 'package:cc_bloc/blocs/main_cubit.dart';
import 'package:cc_bloc/cc_bloc.dart';
import 'package:cc_bloc/src/cc_stateless_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends CCStatelessWidget<MainCubit>{
  MainPage({super.key});

  @override
  void loading() {
    print("Yükleniyor");
  }

  @override
  void updated() {
    print("Güncellendi");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
    CCBloc.getModule<MainCubit>().test2();
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '2',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        );
      },
    );
  }
}
