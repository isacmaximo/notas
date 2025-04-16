import 'package:flutter/material.dart';

class LoadingController {
  LoadingController._privateContructor();

  static final LoadingController _instance =
      LoadingController._privateContructor();

  factory LoadingController() {
    return _instance;
  }

  ValueNotifier<bool>? _isLoading;

  ValueNotifier<bool> get isLoading {
    _isLoading ??= ValueNotifier<bool>(false);
    return _isLoading!;
  }

  startLoading() {
    isLoading.value = true;
  }

  stopLoading() {
    isLoading.value = false;
  }
}
