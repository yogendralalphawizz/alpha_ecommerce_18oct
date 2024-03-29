import 'package:alpha_ecommerce_18oct/utils/images.dart';
import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/routes.dart';
import 'homeTexts&Spaces.dart';

topDealCard(context) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          Routes
              .navigateToProductDetailPageScreen(
              context);
        },
        child: SizedBox(
          height: 160,
          width: 100,
          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.center,
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight:
                      Radius.circular(10),
                      topLeft:
                      Radius.circular(10)),
                ),
                width: double.infinity,
                child: Image.asset(
                  Images.onBoarding2,
                  width: 70,
                  height: 70,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: colors.buttonColor,
                    borderRadius:
                    BorderRadius.only(
                        bottomLeft:
                        Radius.circular(
                            10),
                        bottomRight:
                        Radius.circular(
                            10)),
                  ),
                  child: const Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(
                            horizontal: 10),
                        child: Text(
                          'Electric Stove',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(
                            horizontal: 10),
                        child: Text(
                          '\$699',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      spaceOfHeight(),
    ],
  );
}
