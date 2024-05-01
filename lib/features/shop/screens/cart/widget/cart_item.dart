import 'package:flutter/cupertino.dart';
import '../../../../../common/widgets/product/cart/add_remove_button.dart';
import '../../../../../common/widgets/product/cart/cart_item.dart';
import '../../../../../common/widgets/product/product_price_text/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class ECartItems extends StatelessWidget {
  const ECartItems({
    super.key,
    this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) =>
      const SizedBox(height: ESizes.spaceBtwItems,),
      itemCount: 2,
      shrinkWrap: true,
      itemBuilder: (_, index) =>
           Column(
            children: [
              ECartItem(),
              if(showAddRemoveButton) const SizedBox(height: ESizes.spaceBtwItems),

              ///Add Remove button with total price
              if(showAddRemoveButton)
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 70,),

                      ///Add and remove Button
                      EProductQuantityWithAddAndRemove(),
                    ],
                  ),

                  ///Product total price
                  EProductPriceText(price: '256'),
                ],
              )
            ],
          ),
    );
  }
}
