import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class EDeviceUtils{
  static void hideKeyboard(){
    //FocusScope.of(context as BuildContext).requestFocus(FocusNode());
  }

  static Future<void> setStatusBarColor(Color color) async{
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  static bool isLandscapeOrientation(BuildContext context){
      final viewInsets = View.of(context).viewInsets;
      return viewInsets.bottom == 0;
  }

  static bool isPortraitOrientation(BuildContext context){
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  static void setFullScreen(bool enable){
    SystemChrome.setEnabledSystemUIMode(enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  static double getScreenHeight(){
    return MediaQuery.of(Get.context!).size.height;
  }

  static double getScreenWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  static double getPixelRatio(){
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }

  static double getStatusBarHeight(){
    return MediaQuery.of(Get.context!).padding.top;
  }

  static double getAppBarHeight(){
    return 40;
  }

  static double getBottomNavigationBarHeight(){
    return 20;
  }

  static double getKeyboardHeight(){
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }

  static Future<bool> isKeyboardVisible() async{
    final viewInsets = View.of(Get.context!).viewInsets;
    return viewInsets.bottom >0;
  }

  static Future<bool> isPhysicalDevice() async{
    return defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS;
  }

  static void vibrate(Duration duration){
    HapticFeedback.vibrate();
    Future.delayed(duration,()=> HapticFeedback.vibrate());
  }

  static Future<void> setfrerredOreintation(List<DeviceOrientation> orientation) async{
    await SystemChrome.setPreferredOrientations(orientation);
  }

  static void hideStatusBar() {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  static Future<bool> hasInternetConnection() async{
      try{
        final result = await InternetAddress.lookup('www.facebook.com');
        return  result.isNotEmpty &&  result[0].rawAddress.isNotEmpty;
      }
      on SocketException catch(_){
        return false;
      }
  }

  static bool isIOS(){
    return Platform.isIOS;
  }

  static bool isAndroid(){
    return Platform.isAndroid;
  }

  static void launchUrl(String url) async{
    if(await canLaunchUrl(url as Uri)){
      await launchUrlString(url);
    }else{
      throw 'Could not launch url $url';
    }
  }
}