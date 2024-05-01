import 'package:flutter/cupertino.dart';
import 'curved_edges.dart';

class ECurvedEdgedWidget extends StatelessWidget {
  const ECurvedEdgedWidget({
    super.key,
    this.child,
  });

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ECurvedEdges(),
      child: child,
    );
  }
}

