import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/shared/widgets/soft_button/soft_button_model.dart';
import 'package:flux_client/app/shared/widgets/soft_button/soft_button_widget.dart';

import 'filter_buttons_store.dart';

class FilterButtons extends StatefulWidget {
  final List<SoftButtonModel> softButtonsModels;
  final int currentIndex;
  final VoidCallback? iconButtonAction;
  final IconData? icon;

  const FilterButtons({
    Key? key,
    required this.softButtonsModels,
    this.currentIndex = 0,
    this.iconButtonAction,
    this.icon,
  }) : super(key: key);

  @override
  _FilterButtonsState createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  @override
  Widget build(BuildContext context) {
    final FilterButtonStore store = Modular.get();

    return Observer(
      builder: (_) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...widget.softButtonsModels.map(
            (e) => SoftButtonWidget(
              selected: store.index == widget.softButtonsModels.indexOf(e),
              onPress: () {
                store.setIndex(widget.softButtonsModels.indexOf(e));
                if (e.onTap != null) {
                  e.onTap!();
                }
              },
              text: e.label!,
            ),
          ),
          if (widget.iconButtonAction != null)
            IconButton(
                onPressed: widget.iconButtonAction, icon: Icon(widget.icon))
        ],
      ),
    );
  }
}
