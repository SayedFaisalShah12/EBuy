import 'package:ebuy/common/styles/rounded_container.dart';
import 'package:ebuy/common/widgets/appbar/appbar.dart';
import 'package:ebuy/common/widgets/success_screen/success_screen.dart';
import 'package:ebuy/features/shop/screens/cart/widget/cart_item.dart';
import 'package:ebuy/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ebuy/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ebuy/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ebuy/navigation_menu.dart';
import 'package:ebuy/utils/constants/sizes.dart';
import 'package:ebuy/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/product/cart/coupon_widget.dart';
import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/image_strings.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});
  @override
  Widget build(BuildContext context){
    final dark = EHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: EAppBar(showBackArrow: true, title: Text('Order Review', style: Theme.of(context).textTheme.headlineSmall)),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              ///Item in Cart
              const ECartItems(showAddRemoveButton: false,),
              const SizedBox(height: ESizes.spaceBtwItems,),

              ///Coupon TextField
              ECouponCode(dark: dark),
              const SizedBox(height: ESizes.spaceBtwSection,),

              ERoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(ESizes.md),
                backgroundColor: dark ? EColors.black : EColors.white,
                child:  const Column(
                  children: [
                    ///Pricing
                    EBillingAmountSection(),
                    SizedBox(height: ESizes.spaceBtwItems),


                    ///Divider
                    Divider(),
                    SizedBox(height: ESizes.spaceBtwItems),

                    ///Payment Methods
                    EBillingPaymentSection(),
                    SizedBox(height: ESizes.spaceBtwItems),

                    ///Address
                    EBillingAddressSection(),
                    SizedBox(height: ESizes.spaceBtwItems),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: ElevatedButton
          (
          onPressed: ()=> Get.to(()=> SuccessScreen(
              image: EImages.paymentSuccess,
              title: 'Payment Success',
              subTitle: 'Your Item will be shipped soon',
              onPressed: ()=> Get.offAll(() => const NavigationMenu())),
        ), child: Text('Checkout \$256.0'),
      ),
      )
    );
  }
}


