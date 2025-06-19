// import 'package:flutter/material.dart';
// import 'package:store_app/features/shop/widgets/circular_container.dart';
// import 'package:store_app/utils/helpers/helper_functions.dart';
// import '../../../utils/constants/colors.dart';
//
// class StoreChoiceChip extends StatelessWidget {
//   const StoreChoiceChip({
//     super.key,
//     required this.text,
//     required this.selected,
//     this.onSelected,
//   });
//
//   final String text;
//   final bool selected;
//   final void Function(bool)? onSelected;
//
//   @override
//   Widget build(BuildContext context) {
//     final isColor = StoreHelperFunction.getColor(text) != null;
//     return Theme(
//
//       data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
//       child: ChoiceChip(
//         label: isColor ? const SizedBox() : Text(text),
//         selected: selected,
//         onSelected: onSelected,
//         labelStyle: TextStyle(color: selected ? StoreColors.white : null),
//         avatar: isColor ? CircularContainer(
//           width: 50, height: 50, backgroundColor: StoreHelperFunction.getColor(text)!) : null,
//         shape: isColor ? const CircleBorder() : null,
//         backgroundColor: isColor ? StoreHelperFunction.getColor(text)! : null,
//         padding: isColor ? const EdgeInsets.all(0) : null,
//         labelPadding: isColor ? const EdgeInsets.all(0) : null,
//       ),
//     );
//   }
// }
