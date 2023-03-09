import '../../../models/product_type.dart';
import '../../../utilities/string_constant.dart';
import '../../../view_models/main_view_models.dart';
import '../../../widgets/grid_item.dart';
import '../../../utilities/data_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // HomePageState({super.key});
  final HomeViewModel homeViewModel = HomeViewModel();
  List<ItemArrayList> itemList = listData();
  List<ItemArrayList> dispaly_list = List.from(listData());

  void updateList(String value) {
    //MARK: This function will filter the list
    setState(() {
      dispaly_list = itemList
          .where((element) =>
              element.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  void _incrementValue() {
    setState(() {
      homeViewModel.totalOrders = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    homeViewModel.handleItemsList(context);
    return Scaffold(
      //MARK: Main background
      backgroundColor: Colors.white.withOpacity(0.9),

      // MARK: App Bar
      appBar: AppBar(
        elevation: 0, // for background transparent
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey[900],
        title: Text(Texts.titleHome()),
        actions: [
          IconButton(
            icon: Icon(homeViewModel.viewType == ViewType.list
                ? Icons.window
                : Icons.view_list_rounded),
            onPressed: () {
              if (homeViewModel.viewType == ViewType.list) {
                homeViewModel.crossAxisCount = 2;
                homeViewModel.aspectRatio = 1.5;
                homeViewModel.viewType = ViewType.grid;
              } else {
                homeViewModel.crossAxisCount = 1;
                homeViewModel.aspectRatio = 4;
                homeViewModel.viewType = ViewType.list;
              }
              setState(() {});
            },
          )
        ],
      ),

      //MARK: Body
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 80,
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextField(
                        onTap: () {
                          debugPrint('oy');
                          _incrementValue();
                        },
                        onChanged: (value) => updateList(value),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xfff3f6f4),
                          hintText: Texts.txtSearch(),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(Icons.search),
                          prefixIconColor: Colors.grey,
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: (homeViewModel.totalOrders > 0) ? 80 : 0),
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    child: GridView.count(
                      crossAxisCount: homeViewModel.crossAxisCount,
                      childAspectRatio: homeViewModel.aspectRatio,
                      children: dispaly_list.map((ItemArrayList item) {
                        //
                        debugPrint('to late');
                        return getGridItem(item, homeViewModel.viewType);
                      }).toList(),
                    ),
                  ),
                ),
              )
            ],
          ),
          Visibility(
            visible: (homeViewModel.totalOrders > 0),
            child: Positioned(
              bottom: 24,
              left: 16,
              right: 16,
              child: InkWell(
                onTap: () {
                  // here
                  debugPrint('print');
                  Get.toNamed('/orders');
                },
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 70.0,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 93, 93, 93),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        16.0,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '2 Products',
                        style: TextStyle(color: Colors.white),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: const Text(
                            "\$14.00",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
