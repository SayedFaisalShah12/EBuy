import 'package:flutter/material.dart';

class EProductPriceText extends StatelessWidget {
  const EProductPriceText({
    super.key,
    this.CurrencySign = '\$',
    required this.price,
    this.maxLines = 1,
    this.isLarge = false ,
    this.lineThrough = false,
  });

  final String CurrencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      CurrencySign + price,
      maxLines: maxLines,
      overflow:TextOverflow.ellipsis,
      style: isLarge
           ? Theme.of(context).textTheme.headlineMedium!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null)
           : Theme.of(context).textTheme.titleLarge!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null)
    );
  }
}

