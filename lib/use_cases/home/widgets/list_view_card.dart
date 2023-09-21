import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../util/app_color_palette.dart';
import '../../../util/base_styles.dart';

class ListViewCard extends StatefulWidget {
  const ListViewCard({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  State<ListViewCard> createState() => _ListViewCardState();
}

class _ListViewCardState extends State<ListViewCard>
    with TickerProviderStateMixin {
  late AnimationController animatedSizeBoxHeight;
  late Animation<double> boxHeight;

  @override
  void initState() {
    super.initState();

    animatedSizeBoxHeight = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    animatedSizeBoxHeight.forward();
    animatedSizeBoxHeight.addListener(() {
    });
    boxHeight = Tween<double>(
            begin: 30,
            end: 2
            )
        .animate(CurvedAnimation(
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
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: AnimatedBuilder(
        animation: animatedSizeBoxHeight,
        builder: (context, child) {
          return Container(
            margin: EdgeInsets.only(right: boxHeight.value),
            width: 150.0,
            height: 500,
            decoration: BoxDecoration(
              color:
                  AppColorPalette.white,
              borderRadius: BorderRadius.circular(
                  18.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 SizedBox(height: 3.0.h),
                Text(
                  widget.title,
                  style: headerText2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4.0),
                Text(
                  widget.subtitle,
                  style: subtitleText,
                  textAlign: TextAlign.center,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColorPalette.white, // Background color
                      borderRadius: BorderRadius.circular(
                          8.0),
                    ),
                    child: Image.asset(
                      'assets/images/bus.png',
                      height: 90.h,
                      width: 230,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
