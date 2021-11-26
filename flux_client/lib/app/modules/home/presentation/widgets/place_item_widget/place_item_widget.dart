import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/core/core.dart';
import 'package:flux_client/app/modules/home/data/models/place_model.dart';
import 'package:flux_client/app/modules/home/presentation/home_store.dart';

class PlaceItemWidget extends StatelessWidget {
  final PlaceModel place;

  const PlaceItemWidget({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeStore homeStore = Modular.get<HomeStore>();
    return GestureDetector(
      onTap: () {
        //TODO: implementar lógica pro loading ser através do controller
        // showDialog(
        //     context: context,
        //     builder: (context) => ProgressDialog(status: "Aguarde..."));
        homeStore.getPlaceDetails(place.placeId);
        // Navigator.pop(context);
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
