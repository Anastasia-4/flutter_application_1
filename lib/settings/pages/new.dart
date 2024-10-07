import 'package:flutter/material.dart';
import 'package:dynamic_tabbar/dynamic_tabbar.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/edited_tab.dart';


class DynamicTabExample extends StatefulWidget {
  const DynamicTabExample({super.key});
  @override
  State<DynamicTabExample> createState() => _DynamicTabExampleState();
}

class _DynamicTabExampleState extends State<DynamicTabExample> {
  List<TabData> tabs = [
    TabData(
      index: 1,
      title: const Tab(
        child: EditedTab(text: 'Tab 1', id: 1,),
      ),
      content: const Center(child: Text('Content for Tab 1')),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example for Dynamic Tab'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(
                onPressed: addTab,
                child: const Text('Add Tab'),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () => tabs.length > 1 ? removeTab(tabs.length) : null,
                child: const Text('Remove Last Tab'),
              ),
              const SizedBox(width: 16),
            ],
          ),
          Expanded(
            child: DynamicTabBarWidget(
              indicator: BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.greyText)),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.cornerRadius20), topRight: Radius.circular(Dimensions.cornerRadius20)), // Creates border
                          color: AppColors.darkMainColor
                          ),
              
              dividerColor: AppColors.darkMainColor,
              physicsTabBarView: NeverScrollableScrollPhysics(),
              dynamicTabs: tabs,
              isScrollable: true,
              onTabControllerUpdated: (controller) {},
              onTabChanged: (index) {},
              onAddTabMoveTo: MoveToTab.last,
              showBackIcon: false,
              showNextIcon: false,
              tabAlignment: TabAlignment.start,
              labelPadding: EdgeInsets.zero,
              trailing : Container(color: Colors.blue,
              width: 300, height: 50,),
            ),
          ),
        ],
      ),
    );
  }

  void addTab() {
    setState(() {
      var tabNumber = tabs.last.index+1;
      tabs.add(
        TabData(
          index: tabNumber,
          title: Tab(
            child: EditedTab(text: 'Tab $tabNumber', id: tabNumber,),
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Dynamic Tab $tabNumber'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => removeTab(tabNumber),
                child: const Text('Remove this Tab'),
              ),
            ],
          ),
        ),
      );
    });
  }

  void removeTab(int id) {
    setState(() {
      tabs.removeWhere((item) => item.index == id);
    });
  }
}