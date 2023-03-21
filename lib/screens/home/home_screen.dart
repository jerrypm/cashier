import 'package:cashier_mate/utilities/color_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/product_type.dart';
import '../../../utilities/string_constant.dart';
import '../../../view_models/main_view_models.dart';
import '../../../widgets/grid_item.dart';
import '../../../utilities/data_constant.dart';
import '../../models/menu_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomeScreen> {
  final HomeViewModel homeViewModel = Get.put(HomeViewModel());
  List<ItemArrayList> itemList = listData(); // controller
  List<ItemArrayList> dispalylist = List.from(listData()); // screen

  void updateList(String value) {
    //MARK: This function will filter the list
    setState(() {
      dispalylist = itemList
          .where((element) =>
              element.title.toLowerCase().contains(value.toLowerCase()))
          .toList(); // array
    });
  }

  void _incrementValue() {
    setState(() {
      homeViewModel.totalOrders = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //MARK: Main background
      backgroundColor: AppColors.backgroundColor,

      //MARK: Body
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                //MARK: Custom AppBar
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, top: 18, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            Texts.iconTopHome(),
                            height: 25,
                            width: 25,
                            // color: Colors.blue,
                          ),
                          const SizedBox(width: 12.0),
                          Text(
                            Texts.titleAppHome(),
                            style: const TextStyle(
                              color: AppColors.darkBlue,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          // color: Colors.blueAccent[200],
                          border: Border.all(color: Colors.blueGrey),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ),

                //MARK: Search
                Container(
                  height: 80,
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) => updateList(value),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: Texts.txtSearch(),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                            ),
                            prefixIcon: const Icon(Icons.search),
                            prefixIconColor: Colors.grey,
                            contentPadding: const EdgeInsets.all(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //MARK: Head Section Menu
                Padding(
                  padding: const EdgeInsets.only(left: 25, bottom: 8),
                  child: Row(
                    children: [
                      Text(
                        Texts.titleMenu(),
                        style: TextStyle(
                          color: Colors.blueGrey[700],
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                //MARK: Items
                Obx(() => Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            bottom: (homeViewModel.totalOrders > 0) ? 80 : 0),
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 25, right: 25, top: 4, bottom: 8),
                          child: GridView.count(
                            mainAxisSpacing: homeViewModel.spacing,
                            crossAxisSpacing: homeViewModel.spacing,
                            crossAxisCount: homeViewModel.crossAxisCount,
                            childAspectRatio: homeViewModel.aspectRatio,
                            children: homeViewModel.resultFoods
                                .map((DataSubModel item) {
                              return getGridItem(item, homeViewModel.viewType);
                            }).toList(),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
