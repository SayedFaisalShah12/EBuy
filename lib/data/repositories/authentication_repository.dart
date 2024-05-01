import 'package:ebuy/data/repositories/user_repository.dart';
import 'package:ebuy/features/authentication/screens/login/login.dart';
import 'package:ebuy/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ebuy/features/authentication/screens/signup/verify_email.dart';
import 'package:ebuy/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  ///Get Authenticated User Data
  User? get authUser =>  _auth.currentUser;

  ///Called from main.dart on app launch
  @override
  void onReady(){
    //Remove the Native Splash Screen
    FlutterNativeSplash.remove();

    //Redirect to the appropriate  screen
    screenRedirect();
  }

  screenRedirect() async {
    final user = _auth.currentUser;
    if(user != null)
      {
        if(user.emailVerified){
          Get.offAll(()=>const NavigationMenu());
        }
        else{
          Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email,));        }
      }
      else{
      //Local Storage
      deviceStorage.writeIfNull('IsFirstTime',true);

      //Check if it is first time launching the application
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(()=> const LoginScreen())
          : Get.offAll(const OnBoardingScreen());
    }
  }

  /*------------------------Email and Password Sign-In ------------------------*/

  ///[Email Authentication] - Registration
  Future <UserCredential> registerWithEmailAndPassword(String email, String password) async{
    try{
        return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    }
    catch(e){
          throw 'Error while Registration : $e';
    }
   }

   loginWIthEmailAndPassword(String email, String password) async{
    try{
      return await  _auth.signInWithEmailAndPassword(email: email, password: password);
    }
    catch(e){
      throw "Error while logging : $e";
    }
   }

   ///[Email Verification] - Mail verification
   Future<void> SendEmailVerification() async{
    try{
      _auth.currentUser?.sendEmailVerification();
    }
    catch(e){
      throw 'Error while Verifying Email address: $e';
    }
   }

  ///[Reset the password] Forgot Password
  Future<void> SendPasswordResetEmail(String email) async{
    try{
      _auth.sendPasswordResetEmail(email: email);
    }
    catch(e){
      throw 'Error while sending the Reset email: $e';
    }
  }

  ///[ReAuthenticate] - Re Authenticate User
  reAuthenticateWithEmailAndPassword(String email, String Password) async{
    try{
      //Create a credential
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: Password);
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    }
    catch(e){
       throw " Something went wrong re :$e";
    }
  }


  /*---------------------Federated identity and Social sign-in---------------------*/
  ///[GoogleAuthentication] - Google SignIn
  Future<UserCredential?> SignInWIthGoogle() async{
    try{
      //trigger the the flow
      final GoogleSignInAccount? userAccount =  await GoogleSignIn().signIn();

      //obtain the auth details from request
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      //Create a new credentials
      final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      return await _auth.signInWithCredential(credentials);
    }
    catch(e){
      throw 'Error while logging using google account : $e';
    }
  }


  /*---------------------End Federated identity and Social sign-in---------------------*/
  ///[LogoutUser] - valid For any authentication
  Future<void> logout() async{
    try{
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(()=>const LoginScreen());
    }
    catch(e){
      throw 'Error while Logging out: $e';
    }
  }

  ///[Delete User] - Remove user auth and Firestore account.
  Future<void> deleteAccount() async{
    try{
      await UserRespository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    }
    catch(e){
      throw 'Something went wrong. please try again de : $e';
    }
  }
}
