import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:monie_point/use_cases/shipment_history/widgets/shipment_card.dart';

import '../../../util/app_strings.dart';
import '../../../util/base_styles.dart';
import '../../home/controller/home_controller.dart';


class AllShipmentTab extends StatefulWidget {
  const AllShipmentTab({
    super.key,
  });

  @override
  State<AllShipmentTab> createState() => _AllShipmentTabState();
}

class _AllShipmentTabState extends State<AllShipmentTab>  with TickerProviderStateMixin{
  late AnimationController animatedSizeBoxHeight;
  late Animation<double> _appBarHeight;
  late Animation<double> _trackingTextAnim;
  final HomeController homeController = Get.put(HomeController());

  List<Shipment> shipmentList = [
    Shipment(
      textOne: 'Arriving Today!',
      textTwo: 'Your Delivery #NEJ230899342231 from Atlanta, is arriving today',
      amountText: '550 USD',
      dateText: "Sep 20, 2023",
      status: 'In Progress'
    ),

    Shipment(
      textOne: 'Arriving Today!',
      textTwo: 'Your Delivery #NEJ230899342231 from Atlanta, is arriving today',
      amountText: '550 USD',
      dateText: "Sep 20, 2023",
        status: 'Loading'
    ),

    Shipment(
      textOne: 'Arriving Today!',
      textTwo: 'Your Delivery #NEJ230899342231 from Atlanta, is arriving today',
      amountText: '550 USD',
      dateText: "Sep 20, 2023",
        status: 'Pending'

    ),

    Shipment(
      textOne: 'Arriving Today!',
      textTwo: 'Your Delivery #NEJ230899342231 from Atlanta, is arriving today',
      amountText: '550 USD',
      dateText: "Sep 20, 2023",
        status: 'In Progress'

    ),

    Shipment(
      textOne: 'Arriving Today!',
      textTwo: 'Your Delivery #NEJ230899342231 from Atlanta, is arriving today',
      amountText: '550 USD',
      dateText: "Sep 20, 2023",
        status: 'In Progress'

    ),

    Shipment(
      textOne: 'Arriving Today!',
      textTwo: 'Your Delivery #NEJ230899342231 from Atlanta, is arriving today',
      amountText: '550 USD',
      dateText: "Sep 20, 2023",
        status: 'Loading'

    ),
    Shipment(
      textOne: 'Arriving Today!',
      textTwo: 'Your Delivery #NEJ230899342231 from Atlanta, is arriving today',
      amountText: '550 USD',
      dateText: "Sep 20, 2023",
        status: 'In Progress'

    ),
    Shipment(
      textOne: 'Arriving Today!',
      textTwo: 'Your Delivery #NEJ230899342231 from Atlanta, is arriving today',
      amountText: '550 USD',
      dateText: "Sep 20, 2023",
        status: 'Pending'

    ),
    Shipment(
      textOne: 'Arriving Today!',
      textTwo: 'Your Delivery #NEJ230899342231 from Atlanta, is arriving today',
      amountText: '550 USD',
      dateText: "Sep 20, 2023",
        status: 'In Progress'

    ),
  ];


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
      begin: 80.0,
      end: 20.0,
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
    return Stack(
      children:[
        CustomScrollView(
          scrollDirection: Axis.vertical,
        slivers: [
          AnimatedBuilder(
            animation: animatedSizeBoxHeight,
            builder: (context, child){
              return SliverPadding(
                padding:  EdgeInsets.only(right: 20, left: 30.w, top:_trackingTextAnim.value , bottom: 10),
                sliver: SliverToBoxAdapter(
                  child:  Row(
                    children: [
                      const Text(AppStrings.shipments,
                        style: headerText1,),
                      SizedBox(width: 12.w),
                    ],
                  ),
                ),
              );
            },
          ),

          SliverPadding(
            padding:  EdgeInsets.only(right: 20, left: 30.w, top: 5, bottom: 10),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final shipment = shipmentList[index];

                      return ShipmentCard(
                        textOne: shipment.textOne,
                        textTwo: shipment.textTwo,
                        amountText: shipment.amountText,
                        dateText: shipment.dateText,
                        status: shipment.status,
                  );
                },
                childCount: shipmentList.length,
              ),
            ),
          ),
        ],
      ),
      ],
    );
  }


}


class Shipment {
  final String textOne;
  final String textTwo;
  final String amountText;
  final String dateText;
  final String status;

  Shipment({
    required this.textOne,
    required this.textTwo,
    required this.amountText,
    required this.dateText,
    required this.status
  });
}
