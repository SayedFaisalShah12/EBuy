import 'package:ebuy/common/styles/rounded_container.dart';
import 'package:ebuy/common/widgets/appbar/appbar.dart';
import 'package:ebuy/features/personalization/screens/address/add_new_address.dart';
import 'package:ebuy/features/personalization/screens/address/widgets/single_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/sizes.dart';

class UserAddressesScreen extends StatelessWidget {
  const UserAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: EColors.primaryColor,
        onPressed: ()=> Get.to(()=> AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: Colors.white,),
      ),
      appBar: EAppBar(
        showBackArrow: true,
        title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),
      ),

      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              ESingleAddress(SelectedAddress: false),
              ESingleAddress(SelectedAddress: false),
            ],
          ),
        ),
      ),
    );
  }
}

