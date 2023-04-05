import 'package:cashier_mate/utilities/color_custom.dart';
import 'package:cashier_mate/utilities/items_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities/string_constant.dart';
import '../../../view_models/main_view_models.dart';
import '../../../widgets/grid_item.dart';
import '../../models/menu_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomeScreen> {
  final HomeViewModel homeViewModel = Get.put(HomeViewModel());
  List<DataSubModel> dispalylist = <DataSubModel>[].obs;

  //MARK: Search
  void updateList(String value) {
    //MARK: This function will filter the list
    setState(() {
      dispalylist = homeViewModel.resultFoods
          .where((element) =>
              element.title!.toLowerCase().contains(value.toLowerCase()))
          .toList(); // array
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
                          ),
                          const SizedBox(width: 12.0),
                          Text(
                            Texts.titleAppHome(),
                            style: const TextStyle(
                              color: AppColors.secondaryColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
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
                Expanded(
                  child: Obx(
                    () => homeViewModel.resultFoods.isEmpty
                        ? Center(
                            child: Container(
                              height: 300.0,
                              child: Image.asset(Texts.placeholderHome()),
                            ),
                          )
                        : SingleChildScrollView(
                            child: Column(
                              children: [
                                //MARK: Search
                                Container(
                                  height: 80,
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          onChanged: (value) =>
                                              updateList(value), // HERE FIXING
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            hintText: Texts.txtSearch(),
                                            border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(25.0)),
                                            ),
                                            prefixIcon:
                                                const Icon(Icons.search),
                                            prefixIconColor: Colors.grey,
                                            contentPadding:
                                                const EdgeInsets.all(10),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // MARK: Top Tab items
                                Container(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    bottom: 16,
                                    top: 16,
                                  ),
                                  child: Row(
                                    children: [
                                      TabsItemsbar()
                                          .tabs(() => updateList("burger"))[0],
                                      const Spacer(),
                                      TabsItemsbar()
                                          .tabs(() => updateList("pizza"))[1],
                                      const Spacer(),
                                      TabsItemsbar().tabs(
                                          () => updateList("sandwich"))[2],
                                      const Spacer(),
                                      TabsItemsbar()
                                          .tabs(() => updateList("salad"))[3],
                                      const Spacer(),
                                      TabsItemsbar()
                                          .tabs(() => updateList("chick"))[4],
                                    ],
                                  ),
                                ),

                                //MARK: Head Section Menu
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25, bottom: 8, right: 25),
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
                                      const Spacer(),
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.blueGrey),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: IconButton(
                                          color: Colors.blueGrey,
                                          icon:
                                              const Icon(Icons.refresh_rounded),
                                          iconSize: 20.0,
                                          onPressed: () {
                                            updateList(Texts.empty());
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                //MARK: Items
                                Obx(
                                  () => Container(
                                    padding: EdgeInsets.only(
                                        bottom: (homeViewModel.totalOrders > 0)
                                            ? 80
                                            : 0),
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 25,
                                          right: 25,
                                          top: 4,
                                          bottom: 8),
                                      child: GridView.count(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        mainAxisSpacing: homeViewModel.spacing,
                                        crossAxisSpacing: homeViewModel.spacing,
                                        crossAxisCount:
                                            homeViewModel.crossAxisCount,
                                        childAspectRatio:
                                            homeViewModel.aspectRatio,
                                        children: (dispalylist.isEmpty)
                                            ? homeViewModel.resultFoods
                                                .map((DataSubModel item) {
                                                return getGridItem(item,
                                                    homeViewModel.viewType);
                                              }).toList()
                                            : dispalylist
                                                .map((DataSubModel item) {
                                                return getGridItem(item,
                                                    homeViewModel.viewType);
                                              }).toList(),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
