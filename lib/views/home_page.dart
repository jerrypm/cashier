import 'package:cashier_mate/models/product_type.dart';
import 'package:cashier_mate/utilities/string_constant.dart';
import 'package:cashier_mate/view_models/main_view_models.dart';
import 'package:cashier_mate/widgets/grid_item.dart';
import 'package:cashier_mate/utilities/data_constant.dart';
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

  int _crossAxisCount = 2;
  double _aspectRatio = 1.5;

  @override
  void initState() {
    // homeViewModel.handleViewType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                ? Icons.grid_on
                : Icons.view_list),
            onPressed: () {
              if (homeViewModel.viewType == ViewType.list) {
                _crossAxisCount = 2;
                _aspectRatio = 1.5;
                homeViewModel.viewType = ViewType.grid;
              } else {
                _crossAxisCount = 1;
                _aspectRatio = 5;
                homeViewModel.viewType = ViewType.list;
              }
              setState(() {});
            },
          )
        ],
      ),

      //MARK: Body
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Container(
          margin: const EdgeInsets.all(8),
          child: GridView.count(
            crossAxisCount: _crossAxisCount,
            childAspectRatio: _aspectRatio,
            children: itemList.map((ItemArrayList item) {
              return getGridItem(item, homeViewModel.viewType);
            }).toList(),
          ),
        ),

        // ListView.builder(
        //   itemCount: listData().length + 1,
        //   physics: const ScrollPhysics(),
        //   itemBuilder: (BuildContext context, int index) {
        //     if (index == 0) {
        //       return Container(
        //         height: 100.0,
        //         decoration: const BoxDecoration(
        //           color: Colors.orange,
        //           borderRadius: BorderRadius.all(
        //             Radius.circular(
        //               16.0,
        //             ),
        //           ),
        //         ),
        //       );
        //     } else {
        //       return ItemCardWidget(
        //         context: context,
        //         imageUrl: listData()[index - 1].imageUrl,
        //         title: listData()[index - 1].title,
        //         price: listData()[index - 1].price,
        //       );
        //     }
        //   },
        // ),
      ),
    );
  }
}
