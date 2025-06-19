import 'package:flutter/material.dart';
import 'package:t_store/features/shop/widgets/progress_indicator_rating.dart';

class OverallProductRating extends StatelessWidget {
  const OverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Text(
              '4.8',
              style: Theme.of(context).textTheme.displayLarge,
            )),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              RatingProgressIndicator(text: '5', value: 1,),
              RatingProgressIndicator(text: '4', value: 0.5,),
              RatingProgressIndicator(text: '3', value: 0.3,),
              RatingProgressIndicator(text: '2', value: 0.2,),
              RatingProgressIndicator(text: '1', value: 0.1,),

            ],
          ),
        )
      ],
    );
  }
}
