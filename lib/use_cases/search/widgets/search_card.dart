import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../util/app_color_palette.dart';
import '../../../util/base_styles.dart';
import '../../home/controller/home_controller.dart';

class SearchCard extends StatefulWidget {
  SearchCard({
    Key? key,
  });

  @override
  State<SearchCard> createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> with TickerProviderStateMixin {
  late AnimationController animatedSizeBoxHeight;
  late Animation<double> _appBarHeight;
  late Animation<double> _trackingTextAnim;
  final HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    animatedSizeBoxHeight = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 550),
    );
    animatedSizeBoxHeight.forward();

    animatedSizeBoxHeight.addListener(() {
      print("_appBarHeight===${_appBarHeight.value}");
    });
    _appBarHeight = Tween<double>(
      begin: homeController
          .appBarHeightBegin.value,
      end: homeController
          .appBarHeightEnd.value,
    ).animate(CurvedAnimation(
      parent: animatedSizeBoxHeight,
      curve: Curves.ease,
    ));

    _trackingTextAnim = Tween<double>(
      begin: 70.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: animatedSizeBoxHeight,
      curve: Curves.linearToEaseOut,
    ));
  }

  @override
  void dispose() {
    animatedSizeBoxHeight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 50.0.w,
      ),
      child: Container(
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.builder(
            padding: EdgeInsets.only(bottom:_trackingTextAnim.value,top: 15),
            itemCount: 16,
            itemBuilder: (context, index) {
              return Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
                    title: Row(
                      children: [
                        AnimatedBuilder(
                          animation: _trackingTextAnim,
                          builder: (context, child) {
                            return Container(
                              margin:  EdgeInsets.symmetric(
                                  vertical: _trackingTextAnim.value),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColorPalette.violet,
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.check_box_outlined,
                                  size: 30,
                                ),
                                color: AppColorPalette.white,
                                onPressed: () {
                                },
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('MacBook Pro M2', style: title),
                            SizedBox(
                              height: 10.w,
                            ),
                            const Text(
                              '#NE84855744GGJS Paris • -> Morocco',
                              style: subtitleText,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (index < 19)
                    Divider(
                      thickness: 1,
                    ),
                ],
              );
            },
          ),
          // Use the content parameter here
        ),
      ),
    );
  }
}
