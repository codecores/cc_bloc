import 'package:cc_bloc/src/cc_provider.dart';
import 'package:flutter/material.dart';

abstract class CCStatelessWidget<T> extends StatelessWidget with CCProvider<T>{
  CCStatelessWidget({super.key}){
    register();
  }
}
