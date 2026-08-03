import 'package:flutter/material.dart';
import 'package:islami/core/resources/Color_Manager.dart';
import 'package:islami/ui/home/tabs/radio/provider/radio_tab_provider.dart';
import 'package:islami/ui/home/tabs/radio/widgets/radio_card.dart';
import 'package:islami/ui/home/tabs/radio/widgets/radio_tab_switcher.dart';
import 'package:provider/provider.dart';

import '../../../../core/resources/assets_manager.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetsManager.quranBack), fit: BoxFit.fill)),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 20),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AssetsManager.islamiHeader,
                    width: screenWidth * 0.75,
                  )),
              const SizedBox(
                height: 24,
              ),
              const RadioTabSwitcher(),
              Consumer<RadioTabProvider>(
                builder: (context, provider, child) {
                  switch (provider.radioState) {
                    case RadioStates.initial:
                      return const SizedBox.shrink();
                    case RadioStates.loading:
                      return const Expanded(
                          child: Center(
                        child: CircularProgressIndicator(
                          color: ColorsManager.gold,
                        ),
                      ));

                    case RadioStates.success:
                      return Expanded(
                          child: ListView.separated(
                            padding:const EdgeInsets.symmetric(vertical:24),
                              itemBuilder: (context, index) {
                                return RadioCard(
                                  radio: provider.radios?[index],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 16,
                                );
                              },
                              itemCount: provider.radios?.length ?? 0));
                    case RadioStates.failure:
                      return const Expanded(
                          child: Text(
                        "failed to load radios",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
