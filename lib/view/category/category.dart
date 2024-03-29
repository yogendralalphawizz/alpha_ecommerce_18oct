import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../../model/category.dart';
import '../cart/savedItems.dart';
import '../widget_common/commonBackground.dart';
import '../widget_common/common_header.dart';
import '../profile/common_header.dart';
import 'categoryCard.dart';

class AllCategory extends StatefulWidget {
  const AllCategory({Key? key}) : super(key: key);

  @override
  State<AllCategory> createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<bool> isTabSelectedList =
      List.generate(categories.length, (index) => index == 0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const LightBackGround(),
        Scaffold(
          resizeToAvoidBottomInset: false,
          key: _scaffoldKey,
          extendBody: true,
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const Stack(
                children: [
                  ProfileHeader(),
                  DashboardHeader(),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Explore Categories",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemCount: categories.length,
                                  itemBuilder: (context, i) {
                                    return buildTabButton(categories[i].name,
                                        isTabSelectedList[i], () {
                                      setState(() {
                                        for (int j = 0;
                                            j < isTabSelectedList.length;
                                            j++) {
                                          isTabSelectedList[j] = (i == j);
                                        }
                                      });
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: TextFormField(
                                  onChanged: (value) {},
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    fillColor: colors.textFieldBG,
                                    filled: true,
                                    hintText: 'Search',
                                    hintStyle:
                                        const TextStyle(color: Colors.white),
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.grey, width: 1)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.grey, width: 1)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.grey, width: 1)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.grey, width: 1)),
                                  ),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: categories.length,
                                  itemBuilder: (context, i) {
                                    if (isTabSelectedList[i]) {
                                      return SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              categories[i].name,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            const SizedBox(height: 10),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.55,
                                              child: GridView.builder(
                                                shrinkWrap: true,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 20),
                                                physics:
                                                    const AlwaysScrollableScrollPhysics(),
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  mainAxisSpacing: 2,
                                                  childAspectRatio: 0.7,
                                                ),
                                                itemCount: categories[i]
                                                    .categoryList
                                                    .length,
                                                itemBuilder: (context, j) {
                                                  return categoryCard(
                                                      context: context,
                                                      categoryIndex: i,
                                                      categoryListIndex: j);
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    } else {
                                      return const SizedBox();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTabButton(String label, bool isSelected, VoidCallback onPressed) {
    return Container(
      color: colors.textFieldBG,
      width: MediaQuery.of(context).size.width * 0.35,
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: isSelected ? colors.buttonColor : Colors.transparent,
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }
}
