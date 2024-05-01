import 'package:ebuy/features/personalization/controller/user_controller.dart';
import 'package:ebuy/features/personalization/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/e_circular_images/e_circular_images.dart';

class EUserProfileTile extends StatelessWidget {
  const EUserProfileTile({
    super.key, required this.onpressed,
  });

  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return ListTile(
      leading: Obx((){
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty ? networkImage : EImages.user1;
       return  ECircularImages(image: image, width: 50, height: 50, padding: 0, isNetworkImage: networkImage.isNotEmpty,);
      }),
      title: Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: EColors.white)),
      subtitle: Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: EColors.white)),
      trailing: IconButton(onPressed: onpressed, icon: const Icon(Iconsax.edit, color: EColors.white,),),
    );
  }
}