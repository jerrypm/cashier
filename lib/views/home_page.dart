import '../../models/product_type.dart';
import '../../utilities/string_constant.dart';
import '../../view_models/main_view_models.dart';
import '../../widgets/grid_item.dart';
import '../../utilities/data_constant.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // HomePageState({super.key});
  final HomeViewModel homeViewModel = HomeViewModel();
  List<ItemArrayList> itemList = listData();

  @override
  Widget build(BuildContext context) {
    homeViewModel.handleItemsList(context);
    return Scaffold(
      //MARK: Main background
      backgroundColor: Colors.white.withOpacity(0.9),

      // MARK: App Bar
      appBar: AppBar(
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
                homeViewModel.aspectRatio = 1.4;
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
      body: Column(
        children: [
          Container(
            height: 80,
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Center(
                  child: Icon(Icons.search),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Container(
                margin: const EdgeInsets.all(4),
                child: GridView.count(
                  crossAxisCount: homeViewModel.crossAxisCount,
                  childAspectRatio: homeViewModel.aspectRatio,
                  children: itemList.map((ItemArrayList item) {
                    debugPrint('to late');
                    return getGridItem(item, homeViewModel.viewType);
                  }).toList(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
