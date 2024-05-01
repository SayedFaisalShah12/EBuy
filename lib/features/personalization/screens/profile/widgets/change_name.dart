import 'package:ebuy/common/widgets/appbar/appbar.dart';
import 'package:ebuy/features/personalization/controller/user_controller.dart';
import 'package:ebuy/utils/constants/sizes.dart';
import 'package:ebuy/utils/constants/text_strings.dart';
import 'package:ebuy/utils/validators/validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../controller/change_name_controller/change_name_controller.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context){
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      //custom AppBar
      appBar: EAppBar(
        showBackArrow: true,
        title: Text('Edit Names', style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ///Heading
          Text(
              'Use real name for easy verification. This name will appear on several pages.',
              style: Theme.of(context).textTheme.labelMedium,
          ),
            const SizedBox(height: ESizes.spaceBtwSection),

          ///Text field and button
          Form(
            key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstname,
                    validator: (value) => EValidator.validateEmptyText('First Name', value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: EString.firstname,
                      prefixIcon: Icon(Iconsax.user)
                    ),
                  ),
                  const SizedBox(height: ESizes.spaceBtwInputField,),
                  TextFormField(
                    controller: controller.lastname,
                    validator: (value) => EValidator.validateEmptyText('Last Name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: EString.lastname,
                        prefixIcon: Icon(Iconsax.user)
                    ),
                  ),
                  const SizedBox(height: ESizes.spaceBtwInputField,),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text('Save'),
                      onPressed: () => controller.updateUserName(),
                    ),
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }
}
