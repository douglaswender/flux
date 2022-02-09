import 'package:flutter/material.dart';
import '../../../../../core/core.dart';
import '../../../data/models/place_model.dart';
import '../../home_store.dart';

class PlaceItemWidget extends StatelessWidget {
  final PlaceModel place;
  final AddressInputType? addressInputType;
  final VoidCallback onPressed;

  const PlaceItemWidget({
    Key? key,
    required this.place,
    required this.onPressed,
    this.addressInputType = AddressInputType.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  place.mainText,
                  style: AppTextStyles.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: AppSizes.s8,
                ),
                Text(
                  place.secondaryText ?? "",
                  style: AppTextStyles.body,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
