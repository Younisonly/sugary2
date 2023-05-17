import 'package:Sugary/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/search_model.dart';
import '../widgets/custom_text.dart';

class Meals extends StatefulWidget {
  const Meals({Key? key}) : super(key: key);

  @override
  _MealsState createState() => _MealsState();
}

class _MealsState extends State<Meals> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final SearchModel _searchModel = SearchModel();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchModel>(
      init: _searchModel,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: primaryColor,
          title: CustomText(
            text: "الاطباق",
            fontSize: 14,
            color: Colors.white,
          ),
          bottom: TabBar(

            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 6,
                color: Colors.white70,
              ),
              insets: EdgeInsets.symmetric(horizontal: 16.0),

            ),
            controller: _tabController,
            tabs: [
              Tab(text: 'فطور'),
              Tab(text: 'غداء'),
              Tab(text: 'عشاء'),
            ],
          ),
        ),
        body: Column(
          children: [
            // if (controller.showSearch) _searchTextFormField(controller),
            SizedBox(height: 10,),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Column(children: [
                     _searchTextFormField(controller, 1),
                    Flexible(child: controller.tab1Search()),

                  ],),
                  Column(children: [
                    _searchTextFormField(controller,2),
                     Flexible(child: controller.tab2Search()),

                  ],),Column(children: [
                     _searchTextFormField(controller,3),
                    Flexible(child: controller.tab3Search()),

                  ],),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchTextFormField(SearchModel controller, int tab ) {

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        autofocus: true,
        onChanged: (value) {
          switch (tab)
          {
            case 1:
              controller.lunchSearchValue = "";
              controller.dinnerSearchValue = "";
              controller.breakSearchValue = value;
              controller.tab1Search();
              break;
            case 2:
              controller.dinnerSearchValue = "";
              controller.breakSearchValue = "";
              controller.lunchSearchValue = value;
              controller.tab2Search();
              break;
            case 3:
              controller.breakSearchValue = "";
              controller.lunchSearchValue = "";
              controller.dinnerSearchValue = value;
              controller.tab3Search();
              break;

          }

        },
        decoration: InputDecoration(
          hintText: "أبحث ",
          hintStyle: TextStyle(
            fontSize: 12,
          ),
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            size: 20,
            color: Colors.black,
          ),

        ),
      ),
    );
  }
}



