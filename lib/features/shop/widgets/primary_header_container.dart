import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import 'circular_container.dart';
import 'curved_edges_widget.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
        child: Container(
      color: StoreColors.primary,
      padding: const EdgeInsets.only(bottom: 0),

      ///if [size.isFinite: is not true in Stack] error occurred
      child:  SizedBox(
        height: 400,
        child: Stack(
          children: [
            ///two circular shapes
            Positioned(top: -150, right: -250, child: CircularContainer(backgroundColor: StoreColors.textWhite.withOpacity(0.1),)),
            Positioned(top: 100, right: -300, child: CircularContainer(backgroundColor: StoreColors.textWhite.withOpacity(0.2),)),
            child,
          ],
        ),
      ),
    ));
  }
}
