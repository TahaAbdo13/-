import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleOpservingCupit implements BlocObserver {
  @override
  void onChange(Object bloc, Change change) {
    debugPrint("onChane: $change");
  }

  @override
  void onClose(BlocBase bloc) {
      debugPrint("onClose: $bloc");
  }

  @override
  void onCreate(BlocBase bloc) {
     debugPrint("onCreate: $bloc");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }
}
