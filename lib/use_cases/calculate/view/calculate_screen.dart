import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:monie_point/use_cases/calculate/widgets/category_item.dart';
import 'package:monie_point/use_cases/extimated_amount/view/extimated_amount_screen.dart';
import 'package:monie_point/use_cases/home/views/home_screen.dart';
import 'package:monie_point/use_cases/shipment_history/widgets/shipment_card.dart';

import '../../../common_widgets/app_button.dart';
import '../../../res/base_styles.dart';
import '../../../util/app_color_palette.dart';
import '../../../util/app_strings.dart';
import '../../../util/base_styles.dart';
import '../../../util/navigation_builder.dart';
import '../../../util/navigation_functions.dart';
import '../../home/controller/home_controller.dart';
import '../../home/widgets/custom_search_bar.dart';
import '../../home/widgets/shipment_card.dart';
import '../../nav_wrapper/controller/nav_wrapper_controller.dart';
import '../../nav_wrapper/view/nav_wrapper.dart';
import '../../search/view/search_screen.dart';
import '../widgets/calculator_card.dart';
import '../widgets/drop_down_component.dart';

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({
    super.key,
  });

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen>
    with TickerProviderStateMixin {

  late AnimationController _appBarController;
  late Animation<double> _appBarHeight;
  final ScrollController _scrollController = ScrollController();
  final NavWrapperController navController = Get.put(NavWrapperController());
  late Animation<double> _arrowIconAnim;
  late Animation<double> _appBarTextAnim;
  late AnimationController animatedSizeBoxHeight;
  final HomeController homeController = Get.put(HomeController());


  /// Some Dummy Data that will be replaced
  ///
  final List<String> categoryItemsListTab = [
    'Books',
    'Glass',
    'Shoes',
    'Liquid',
    'Food',
    'Phone',
    'Others',
  ];


  late TabController tabController;
  int selectedIndex = -1; //

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: categoryItemsListTab.length, vsync: this);

    _appBarController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 320),
    );

    animatedSizeBoxHeight = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    animatedSizeBoxHeight.forward();

    _appBarController.forward();
    _appBarController.addListener(() {
      print("_appBarHeight===${_appBarHeight.value}");
    });
    _appBarHeight = Tween<double>(
      begin: 150.0,
      end: 60.0,
    ).animate(CurvedAnimation(
      parent: _appBarController,
      curve: Curves.linear,
    ));

    _appBarTextAnim = Tween<double>(
      begin: 0.0,
      end: 10.0,
    ).animate(CurvedAnimation(
      parent: _appBarController,
      curve: Curves.linear,
    ));
    _arrowIconAnim = Tween<double>(
      begin: -20.0,
      end: 10.0,
    ).animate(CurvedAnimation(
      parent: animatedSizeBoxHeight,
      curve: Curves.easeIn,
    ));
  }

  void handleCategoryTap(int index) {
    setState(() {
      selectedIndex = index;
      print("PASSED INDEX $selectedIndex");
    });
  }

  @override
  void dispose() {
    _appBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColorPalette.bgColor,
          body: CustomScrollView(
            controller: _scrollController,
            slivers: [
              AnimatedBuilder(
                animation: _appBarHeight,
                builder: (context, child) {
                  return SliverAppBar(
                    backgroundColor: AppColorPalette.violet,
                    collapsedHeight: _appBarHeight.value,
                    leading: GestureDetector(
                      onTap: () {
                        navController.goToPage(0);
                        },
                      child: Transform.translate(
                        offset: Offset(_arrowIconAnim.value, 0.0), // Move horizontally
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 25,
                          color: AppColorPalette.white,
                        ),
                      ),
                    ),
                    centerTitle: true,
                    title:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(AppStrings.calculate, style: plainWhiteText),
                        SizedBox(height: _appBarTextAnim.value,),
                      ],
                    ),
                  );
                },
              ),
              SliverPadding(
                padding:  EdgeInsets.only(
                    right: 30.w, left: 30.w, top: 10.h, bottom: 12),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    children: [
                      const Text(
                        AppStrings.destination,
                        style: headerText2,
                      ),
                      SizedBox(width: 12.w),
                    ],
                  ),
                ),
              ),
              CalculatorCard(),
              SliverPadding(
                padding:  EdgeInsets.only(
                    right: 20, left: 30.w, top: 5.h, bottom: 1),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    children: [
                      const Text(
                        AppStrings.packaging,
                        style: headerText2,
                      ),
                      SizedBox(width: 12.w),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding:  EdgeInsets.only(
                    right: 20, left: 30.w, top: 4.h, bottom: 5),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    children: [
                      const Text(
                        AppStrings.whatAreYouSend,
                        style: bigSubtitleText,
                      ),
                      SizedBox(width: 12.w),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                ),
                sliver: SliverToBoxAdapter(
                  child: DropDownComponent(
                    rightIcon: Icons.keyboard_arrow_down_outlined,
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(
                    right: 20, left: 20, top: 20, bottom: 1),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    children: [
                      const Text(
                        AppStrings.categories,
                        style: headerText2,
                      ),
                      SizedBox(width: 12.w),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding:  EdgeInsets.only(
                    right: 20, left: 45.w, top: 1.h, bottom: 5),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    children: [
                      const Text(
                        AppStrings.whatAreYouSend,
                        style: bigSubtitleText,
                      ),
                      SizedBox(width: 12.w),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding:  EdgeInsets.only(
                    right: 20.w, left: 30.w, top: 10, ),
                sliver: SliverToBoxAdapter(
                  child: SizedBox(
                    width: 60.w,
                    height: 55.h,
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: List.generate(
                        categoryItemsListTab.length,
                        (index) => Padding(
                          padding:  EdgeInsets.all(10.0.w),
                          child: CategoryItem(
                            index: index,
                            selectedColor: AppColorPalette.black,
                            selectedIndex: selectedIndex,
                            onTap: (int ) {  handleCategoryTap(int);},
                            text: categoryItemsListTab[index],),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SliverPadding(
                padding:  EdgeInsets.only(
                    right: 2.w, left: 30.w, bottom: 5),
                sliver: SliverToBoxAdapter(
                  child: AppButton(
                    size: Size(MediaQuery.of(context).size.width - 148, 50),
                    color: AppColorPalette.orange,
                    onTap: () {
                      push(page: const EstimatedAmountScreen());
                    },
                    child: const Text('Calculate'),
                  ),
                ),
              ),

            ],
          ),
        ),

      ],
    );
  }
}
