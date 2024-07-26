import 'package:cc_bloc/cc_bloc.dart';
import 'package:cc_bloc/src/cc_provider_handler.dart';

mixin CCProvider<T> implements CCProviderHandler{

  @override
  void register() {
    CCBloc.registerProvider<T>(this);
  }
}