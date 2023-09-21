import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../common_widgets/app_button.dart';
import '../../../util/app_color_palette.dart';
import '../../../util/base_styles.dart';
import '../../home/controller/home_controller.dart';
import '../../nav_wrapper/controller/nav_wrapper_controller.dart';

class EstimatedAmountScreen extends StatefulWidget {
  const EstimatedAmountScreen({Key? key}) : super(key: key);

  @override
  State<EstimatedAmountScreen> createState() => _EstimatedAmountScreenState();
}

class _EstimatedAmountScreenState extends State<EstimatedAmountScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> _appBarHeight;
  late Animation<double> _boxAnim;
  late Animation<double> _buttonAnim;
  final NavWrapperController navController = Get.put(NavWrapperController());

  final HomeController homeController = Get.put(HomeController());
  late AnimationController buttonAnimationController;
  double buttonWidth = 380.0;
  int currentAmount = 1300;
  int targetAmount = 1400;

  @override
  void initState() {
    super.initState();
    buttonAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    buttonAnimationController.addListener(() {
      setState(() {});
    });

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );
    animationController.forward();

    animationController.addListener(() {
      print("_appBarHeight===${_appBarHeight.value}");
    });
    _appBarHeight = Tween<double>(
      begin: homeController
          .appBarHeightBegin.value,
      end: homeController
          .appBarHeightEnd.value,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOutCirc,
    ));

    _boxAnim = Tween<double>(
      begin: 200.0,
      end: 350.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInSine,
    ));

    _buttonAnim = Tween<double>(
      begin: 340.0,
      end: 20.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.linearToEaseOut,
    ));

    startCountingAnimation();
  }

  void handleButtonPress() {

    setState(() {
      buttonWidth = 290.0;
    });
    buttonAnimationController.forward();

  }

  void handleButtonRelease() {
    setState(() {
      buttonWidth = 380.0;
    });
    buttonAnimationController.forward();
  }

  void startCountingAnimation() {
    final countController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    final countTween = IntTween(begin: currentAmount, end: targetAmount);

    countController.addListener(() {
      setState(() {
        currentAmount = countTween.evaluate(countController);
      });
    });

    countController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    buttonAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColorPalette.bgColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _boxAnim,
                  builder: (context, child) {
                    return Image.asset(
                      'assets/images/move_mate.png',
                      height: _boxAnim.value,
                      width: _boxAnim.value,
                    );
                  },
                ),
                const Text(
                  'Total Estimated Amount',
                  style: headerText1,
                ),
                RichText(
                  text:  TextSpan(
                    children: [
                      TextSpan(
                        text: '\$${currentAmount}',
                        style: headerTextGreen,
                      ),
                      const TextSpan(
                        text: ' USD',
                        style: smallTextGreen,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  width: 272,
                  child: Text(
                    'This amount is estimated, this will vary if you change your weigh or location',
                    style: subtitleText,
                    maxLines: 2,
                    softWrap: true,
                    overflow:
                        TextOverflow.visible,
                  ),
                ),
                AnimatedBuilder(
                  animation: _buttonAnim,
                  builder: (context, child) {
                    return SizedBox(
                      height: _buttonAnim.value,
                    );
                  },
                ),
                GestureDetector(
                  onTapDown: (_) => handleButtonPress(),
                  onTapUp: (_) => handleButtonRelease(),
                  onTapCancel: () => handleButtonRelease(),
                  child: SizedBox(
                    width: buttonWidth,
                    child: AppButton(
                      colorWhenPressed: AppColorPalette.orange,
                      size: Size(380, 55),
                      color: AppColorPalette.orange,
                      onTap: () {
                        navController.goToPage(0);
                      },
                      child: const Text('Back to Home'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
