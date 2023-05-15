import 'package:flutter/material.dart';
import 'package:korek_app/utils/constants.dart';

class ItemBox extends StatelessWidget {
  const ItemBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: kGrayColor.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 3))
          ]),
      child: Stack(
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/item-image-test.png",
                width: 140,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: kGrayDarkColor,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Center(
                                child: Icon(Icons.favorite,
                                    size: 22, color: kWhiteColor),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Center(
                                child: Icon(Icons.shopping_cart,
                                    size: 22, color: kWhiteColor),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Text("Alternator",
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                      const SizedBox(
                        height: 6,
                      ),
                      const Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae nisi eget nunc ultricies aliquet. ",
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: kGrayColor),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...["2018", "Camry", "Toyota"]
                              .map((item) => Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    decoration: BoxDecoration(
                                        color: kSecondaryColor,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Text(
                                      item,
                                      maxLines: 1,
                                      style:
                                          const TextStyle(color: kWhiteColor),
                                    ),
                                  ))
                              .toList()
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
              child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    bottomRight: Radius.circular(6))),
            child: const Text(
              "500 L.E",
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ))
        ],
      ),
    );
  }
}
