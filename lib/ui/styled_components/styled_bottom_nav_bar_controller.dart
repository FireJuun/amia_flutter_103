import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StyledBottomNavBarController extends GetxController
    with SingleGetTickerProviderMixin {
  StyledBottomNavBarController({required this.tabList});

  static StyledBottomNavBarController get to => Get.find();

  final Map<String, Function> tabList;

  late final TabController _tabController;
  TabController get tabController => _tabController;

  // Used to decide which tab is active, as determined by the tab controller
  final RxInt _rxTabIndex = 0.obs;
  set rxTabIndex(value) => _rxTabIndex.value = value;
  int get rxTabIndex => _rxTabIndex.value;

  bool isTabIndexAtStart() => (_rxTabIndex.value == 0) ? true : false;
  bool isTabIndexAtEnd() =>
      (_rxTabIndex.value == _tabController.length - 1) ? true : false;

  @override
  void onInit() {
    _tabController = TabController(
        initialIndex: _rxTabIndex.value, length: tabList.length, vsync: this)
      ..addListener(() => _rxTabIndex.value = _tabController.index);
    super.onInit();
  }

  @override
  void onClose() {
    _tabController.dispose();
    super.onClose();
  }
}
