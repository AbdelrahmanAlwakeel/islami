import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/core/resources/Color_Manager.dart';

import '../provider/radio_tab_provider.dart';

class RadioTabSwitcher extends StatelessWidget {
  const RadioTabSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final provider= context.read<RadioTabProvider>();
    return AnimatedToggleSwitch<RadioTabTypes>.size(
      textDirection: TextDirection.ltr,
      current: context.watch<RadioTabProvider>().getSelectedTab,
      values: RadioTabTypes.values,
      iconOpacity: 1,
      indicatorSize:  Size(
        MediaQuery.sizeOf(context).width*.5,
        double.infinity
      ),
      iconList: [
        Text("Radio",
          style:provider.getTabTextStyle(RadioTabTypes.radio) ,
        ),
        Text("Reciters",
          style:provider.getTabTextStyle(RadioTabTypes.reciters) ,

        )
      ],
      borderWidth: 0,
      iconAnimationType: AnimationType.onHover,
      style: ToggleStyle(
        borderColor: Colors.transparent,
        borderRadius: BorderRadius.circular(12.0),
        indicatorColor: ColorsManager.gold,
        backgroundColor: ColorsManager.black.withValues(alpha: .7)

      ),
      onChanged: (tab){
      provider .switchTab(tab);
      },
    );
  }
}
