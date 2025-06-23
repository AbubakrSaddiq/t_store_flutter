import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../shop/widgets/circular_container.dart';
import '../../shop/widgets/curved_edges_widget.dart';

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
        child: Stack(
          children: [
            Positioned(
                top: -150,
                right: -250,
                child: CircularContainer(
                  backgroundColor: StoreColors.textWhite.withOpacity(0.1),
                )),
            Positioned(
                top: 100,
                right: -300,
                child: CircularContainer(
                  backgroundColor: StoreColors.textWhite.withOpacity(0.1),
                )),
            child
          ],
        ),
      ),
    );
  }
}
