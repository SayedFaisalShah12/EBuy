import 'package:ebuy/common/widgets/appbar/appbar.dart';
import 'package:ebuy/common/widgets/images/e_circular_images/e_circular_images.dart';
import 'package:ebuy/common/widgets/texts/section_heading.dart';
import 'package:ebuy/features/personalization/controller/user_controller.dart';
import 'package:ebuy/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:ebuy/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:ebuy/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/image_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      ///Title App Bar
      appBar: const EAppBar(showBackArrow: true, title: Text('Profile'),),

      ///Body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: Column(
          children: [
            ///Profile Screen
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                   Obx((){
                     final networkImage = controller.user.value.profilePicture;
                     final image = networkImage.isNotEmpty ? networkImage : EImages.user1;
                     return  ECircularImages(image: image, width: 80, height: 80, isNetworkImage: networkImage.isNotEmpty,);
                   } ),
                  TextButton(onPressed: ()=> controller.uploadUserProfilePicture(), child: const Text("Change Profile Picture")),
                ],
              ),
            ),

            ///Details
            const SizedBox(height: ESizes.spaceBtwItems,),
            const Divider(),
            const SizedBox(height: ESizes.spaceBtwItems,),

            ///Profile Information
            const ESectionHeading(title: 'Profile Information',),
            EProfileMenu(onPressed: ()=> Get.to(()=>ChangeName()), title: 'Name', value: controller.user.value.firstName+ ' ' + controller.user.value.lastName),
            EProfileMenu(onPressed: (){}, title: 'Username', value: controller.user.value.username),

            const SizedBox(height: ESizes.spaceBtwItems,),
            const Divider(),
            const SizedBox(height: ESizes.spaceBtwItems,),

            ///Personal Details
            const ESectionHeading(title: 'Personal Information', showActionButton:false),
            EProfileMenu(onPressed: (){}, title: 'UserId', value: controller.user.value.id, icon: Iconsax.copy,),
            EProfileMenu(onPressed: (){}, title: 'Email', value: controller.user.value.email),
            EProfileMenu(onPressed: (){}, title: 'Phone Number ', value: controller.user.value.phoneNumber),
            EProfileMenu(onPressed: (){}, title: 'Gender', value: 'Male'),
            EProfileMenu(onPressed: (){}, title: 'Date Of Birth', value: '20 feb 2000'),

            const Divider(),
            const SizedBox(height: ESizes.spaceBtwItems,),

            ///Close Account
            TextButton(onPressed: ()=> controller.deleteAccountPopUp()  , child: const Text('Close Account', style: TextStyle(color: Colors.red),),)
          ],
        ),
      ),
    );
  }
}
