import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../shared/widgets/soft_button/soft_button_model.dart';
import '../../../../../shared/widgets/soft_button/soft_button_widget.dart';

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
    this.icon = Icons.clear,
  }) : super(key: key);

  @override
  _FilterButtonsState createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  @override
  Widget build(BuildContext context) {
    final FilterButtonStore store = Modular.get();

    return Observer(
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.iconButtonAction != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      store.clearIndex();
                      widget.iconButtonAction!;
                    },
                    icon: Icon(widget.icon)),
              ],
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...widget.softButtonsModels.map(
                (e) => Expanded(
                  child: SoftButtonWidget(
                    selected:
                        store.index == widget.softButtonsModels.indexOf(e),
                    onPress: () {
                      store.setIndex(widget.softButtonsModels.indexOf(e));
                      if (e.onTap != null) {
                        e.onTap!();
                      }
                    },
                    text: e.label!,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
