import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';

class ESectionHeading extends StatelessWidget {
  const ESectionHeading({
    super.key,
    required this.title,
    this.buttonTitle = 'view all',
    this.textColor,
    this.showActionButton = true,
    this.onPressed,
    this.onTap
  });

  final String title, buttonTitle;
  final Color? textColor;
  final bool showActionButton;
  final void Function()? onPressed;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: ESizes.defaultSpace),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: Theme.of(context).textTheme.headlineSmall!.apply(color: textColor), maxLines: 1, overflow: TextOverflow.ellipsis,),
                if(showActionButton) TextButton(onPressed: onPressed, child: Text(buttonTitle))
              ],
            ),
          ],
        ),
      ),
    );
  }
}