import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/core/core.dart';
import 'package:flux_client/app/modules/home/data/models/place_model.dart';
import 'package:flux_client/app/modules/home/presentation/home_store.dart';

class PlaceItemWidget extends StatelessWidget {
  final PlaceModel place;
  final AddressInputType? addressInputType;

  const PlaceItemWidget({
    Key? key,
    required this.place,
    this.addressInputType = AddressInputType.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeStore homeStore = Modular.get<HomeStore>();
    return TextButton(
      onPressed: () {
        homeStore.getPlaceDetails(place.placeId, addressInputType!);
      },
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
