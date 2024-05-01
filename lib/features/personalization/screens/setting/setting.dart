import 'package:ebuy/common/widgets/appbar/appbar.dart';
import 'package:ebuy/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ebuy/common/widgets/images/e_circular_images/e_circular_images.dart';
import 'package:ebuy/common/widgets/list_tiles/setting_menu_tile.dart';
import 'package:ebuy/common/widgets/texts/section_heading.dart';
import 'package:ebuy/data/repositories/authentication_repository.dart';
import 'package:ebuy/features/personalization/screens/address/addresses.dart';
import 'package:ebuy/features/personalization/screens/profile/profile.dart';
import 'package:ebuy/features/shop/screens/order/order.dart';
import 'package:ebuy/utils/constants/image_strings.dart';
import 'package:ebuy/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/list_tiles/user_profile_tiles.dart';
import '../../../../utils/constants/color.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Header
            EPrimaryHeaderContainer(
                child: Column(
                  children: [
                    ///AppBar
                    EAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: EColors.white))),
                    const SizedBox(height: ESizes.spaceBtwSection),

                    ///User Profile Card
                    EUserProfileTile(onpressed: ()=> Get.to(()=> const ProfileScreen()),),
                    const SizedBox(height: ESizes.spaceBtwSection),
                  ],
                )),

            /// Body
            Padding(
                padding:  EdgeInsets.all(ESizes.defaultSpace),
                child: Column(
                  children: [
                    const ESectionHeading(title: "Acount Setting", showActionButton: false,),
                    const SizedBox(height: ESizes.spaceBtwItems,),
                    
                    ESettingMenuTile(icon: Iconsax.safe_home, title: "My Addresses", subtitle: "Set for Shopping Deliveries", ontap: ()=> Get.to(()=> const UserAddressesScreen()),),
                    ESettingMenuTile(icon: Iconsax.shopping_cart, title: "My Cart", subtitle: "Add, remove and check order", ontap: (){},),
                    ESettingMenuTile(icon: Iconsax.bag_tick, title: "My Orders", subtitle: "In-progress and completed orders", ontap: ()=> Get.to(()=> const OrderScreen()),),
                    ESettingMenuTile(icon: Iconsax.bank, title: "Bank Account", subtitle: "withdraw balance to register account", ontap: (){},),
                    ESettingMenuTile(icon: Iconsax.discount_shape, title: "My Coupon", subtitle: "List of all Discount coupon", ontap: (){},),
                    ESettingMenuTile(icon: Iconsax.notification, title: "Notification", subtitle: "set any kind of notification", ontap: (){},),
                    ESettingMenuTile(icon: Iconsax.security_card, title: "Account Privacy", subtitle: "Manage data and connection", ontap: (){},),

                    ///App Settings
                    const SizedBox(height: ESizes.spaceBtwSection,),
                    const ESectionHeading(title: 'App Setting', showActionButton: false,),
                    const SizedBox(height: ESizes.spaceBtwItems,),
                    const ESettingMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subtitle:'Upload Data to your Cloud Firebase'),

                    ESettingMenuTile(
                        icon: Iconsax.location,
                        title: 'Geolocation',
                        subtitle: 'Set recommendation base on location',
                        trailing: Switch(value: true, onChanged: (value){},),
                    ),
                    ESettingMenuTile(
                      icon: Iconsax.security_user,
                      title: 'Safe Mode',
                      subtitle: 'Search result is safe for all ages',
                      trailing: Switch(value: true, onChanged: (value){},),
                    ),
                    ESettingMenuTile(
                      icon: Iconsax.location,
                      title: 'HD Image Quality',
                      subtitle: 'Set image quality to be seen',
                      trailing: Switch(value: true, onChanged: (value){},),
                    ),

                    const SizedBox(height: ESizes.spaceBtwSection,),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(onPressed: ()=> AuthenticationRepository.instance.logout(),
                        child: const Text('Logout'),),
                    ),
                    const SizedBox(height: ESizes.spaceBtwSection,),
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}


