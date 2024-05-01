import 'package:ebuy/common/widgets/appbar/appbar.dart';
import 'package:ebuy/features/shop/screens/order/widgets/order_list.dart';
import 'package:ebuy/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///Appbar
      appBar: EAppBar(
        title: Text('My Orders', style: Theme.of(context).textTheme.headlineSmall),
      ),

      ///Orders
      body: const Padding(
        padding: EdgeInsets.all(ESizes.defaultSpace),
        child: EOrderListItem(),
      ),
    );
  }
}
