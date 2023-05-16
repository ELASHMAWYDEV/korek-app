// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:korek_app/ui/controllers/store_controller.dart';
import 'components/item_box.dart';
import 'components/search_box.dart';
import 'components/side_badge.dart';
import 'components/wishlist_modal.dart';
import 'components/cart_modal.dart';
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
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 80),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const SearchBox(),
              Column(
                children: [
                  ...[1, 2, 3, 4, 5, 6, 7, 8, 9].map((e) => const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: ItemBox(),
                      ))
                ],
              )
            ],
          ),
        ),
        Positioned(
            bottom: 80,
            right: 0,
            child: Column(
              children: [
                SideBadge(
                  count: 5,
                  onClick: () {
                    Get.dialog(CartModal(), name: "cart");
                  },
                  icon: const Icon(
                    Icons.shopping_cart_rounded,
                    color: kWhiteColor,
                    size: 24,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SideBadge(
                  count: 2,
                  onClick: () {
                    Get.dialog(WishlistModal(), name: "wishlist");
                  },
                  color: kPrimaryColor,
                  icon: const Icon(
                    Icons.favorite,
                    color: kWhiteColor,
                    size: 24,
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
