import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ebuy/utils/popups/loaders.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionState = ConnectivityResult.none.obs;

  ///Initialize the network manager and check the current state.
  @override
  void onInit(){
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future <void> _updateConnectionStatus (ConnectivityResult result) async{
    _connectionState .value = result;
    if(_connectionState.value == ConnectivityResult.none){
      ELoader.warningSnackbar(title : 'No Internet connection');
    }
  }

  ///Check the connection status
  ///Returns true if the connection, 'false' otherwise
  Future<bool> isConnected () async{
    try{
      final result = await _connectivity.checkConnectivity();
      if(result == ConnectivityResult.none){
        return false;
      }
      else
        {
          return true;
        }
    } on PlatformException catch(_){
      return false;
    }
  }

  ///Dispose or cancel the connection Stream
  void onClose(){
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
