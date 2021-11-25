import 'package:flutter/material.dart';
import 'package:flux_client/app/core/core.dart';
import 'package:flux_client/app/modules/home/data/models/place_model.dart';

class PlaceItemWidget extends StatelessWidget {
  final PlaceModel place;

  const PlaceItemWidget({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                place.mainText!,
                style: AppTextStyles.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              SizedBox(
                height: AppSizes.s8,
              ),
              Text(
                place.secondaryText!,
                style: AppTextStyles.body,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
