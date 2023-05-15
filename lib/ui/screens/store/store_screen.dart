import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:korek_app/ui/controllers/store_controller.dart';
import 'package:korek_app/ui/screens/store/components/item_box.dart';
import 'package:korek_app/ui/screens/store/components/search_box.dart';
import 'package:korek_app/ui/screens/store/components/side_badge.dart';
import 'package:korek_app/utils/constants.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  final StoreController controller = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const SearchBox(),
              SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    ...[1, 2, 3, 4, 5, 6, 7, 8, 9].map((e) => const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: ItemBox(),
                        ))
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
