import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../popups/loaders.dart';

/// Manages network connectivity status and provides methods to check and handle connectivity changes
class
NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  // late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  /// Initialize the network manager and set up a stream to constantly check conn status
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
            (results) {
          if (results.isNotEmpty) {
            _updateConnectionStatus(results.first);
          }
        }
    );
  }
  // void onInit() {
  //   super.onInit();
  //   _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  //
  // }

  /// Update the connection status based on changes in connectivity and show a relevant popup for no internet connection
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
    if (result == ConnectivityResult.none) {
      StoreLoaders.warningSnackBar(title: 'No Internet Connection');
    }
  }

  /// Check internet connection status
  /// Returns true if connected and false otherwise
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if(result == ConnectivityResult.none){
        return false;
      }else{
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  /// Dispose or close the active connectivity stream
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}




