import 'package:flutter/material.dart';
import 'package:islami/core/resources/Color_Manager.dart';
import 'package:islami/core/resources/assets_manager.dart';
import 'package:islami/ui/home/tabs/radio/model/radio_model.dart';
import 'package:islami/ui/home/tabs/radio/provider/radio_tab_provider.dart';
import 'package:provider/provider.dart';

class RadioCard extends StatelessWidget {
  final Radios? radio;

  const RadioCard({super.key, required this.radio});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: ColorsManager.gold),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            AssetsManager.mosqueHadethDetails,
            color: ColorsManager.black.withValues(alpha: .5),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  radio?.name ?? "",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.black),
                ),
              ),
              Consumer<RadioTabProvider>(
                builder: (context, provider, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 56,
                      ),
                      IconButton(
                        onPressed: () {
                          if (radio != null) provider.playRadio(radio!);
                        },
                        icon: Icon(
                          provider.selectedRadio == radio
                              ? Icons.pause_rounded
                              : Icons.play_arrow_rounded,
                          color: ColorsManager.black,
                          size: 56,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (radio != null) provider.changeVolume(radio!);
                        },
                        icon: Icon(
                          provider.selectedRadioForVolume == radio
                              ? Icons.volume_off_rounded
                              : Icons.volume_up_rounded,
                          color: ColorsManager.black,
                          size: 40,
                        ),
                      ),
                    ],
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
