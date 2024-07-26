import 'package:cc_bloc/src/cc_provider_handler.dart';

class CCBloc {
  static final Map<String, dynamic> _instances = {};

  static final Map<String, List<CCProviderHandler>> _cubitProviders = {};

  static void register<T>(T instance) {
    if (_instances.containsKey(T.runtimeType.toString())) return;
    _instances[T.runtimeType.toString()] = instance;
    _cubitProviders[T.toString()] = List.empty(growable: true);
  }

  static T getModule<T>() {
    final instance = _instances[T.runtimeType.toString()];
    if (instance != null) {
      return instance as T;
    } else {
      throw Exception('Module not found for type $T');
    }
  }

  static void registerProvider<T>(CCProviderHandler handler) async{
    if(_instances.isEmpty) await Future.delayed(const Duration(seconds: 1));
    if (!_cubitProviders.containsKey(T.toString())) return;

    print(T.toString() + " tipi " + handler.toString() + " için provider olarak kayıt edildi");
    (_cubitProviders[T.toString()] as List<CCProviderHandler>).add(handler);
  }

  static List<CCProviderHandler> getProviders<T>() {
    final instance = _cubitProviders[T.toString()];
    if (instance != null) {
      return instance;
    } else {
      throw Exception('Provider not found for type $T');
    }
  }

  static void loading<T>(){
    getProviders<T>().forEach((e) => e.loading());
  }

  static void updated<T>(){
    getProviders<T>().forEach((e) => e.updated());
  }
}
