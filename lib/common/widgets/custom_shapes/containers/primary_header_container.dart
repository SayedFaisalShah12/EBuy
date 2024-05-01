import 'package:ebuy/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:flutter/cupertino.dart';
import '../../../../utils/constants/color.dart';
import '../curved_edges/curved_edges_widgets.dart';

class EPrimaryHeaderContainer extends StatelessWidget {
  const EPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ECurvedEdgedWidget(
      child: SizedBox(
        child: Container(
        color: EColors.primaryColor,
          child: Stack(
            children: [
              Positioned(top:-150, right: -250, child: ECircularContainer(backgroundColor:  EColors.textWhite.withOpacity(0.1),)),
              Positioned(top:100, right: -300, child: ECircularContainer(backgroundColor:  EColors.textWhite.withOpacity(0.1),)),
              child,
            ],
          ),
        ),
      ),
    );
  }
}