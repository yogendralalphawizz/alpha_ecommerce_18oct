import 'package:flutter/material.dart';

import '../../model/category.dart';
import '../../utils/routes.dart';

categoryCard({required BuildContext context,required categoryIndex, required categoryListIndex}) {
  return InkWell(
    onTap: () {
      Routes.navigateToCategoryDetailScreen(context);
    },
    child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.45,
      child: Column(
        children: [
          Image.asset(
            categories[categoryIndex]
                .categoryList[categoryListIndex]
                .categoryImage,
            height: 70,
            width: 90,
            fit: BoxFit.fitHeight,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            categories[categoryIndex]
                .categoryList[categoryListIndex]
                .categoryName,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    ),
  );
}
