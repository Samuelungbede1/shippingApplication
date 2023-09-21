import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monie_point/use_cases/calculate/widgets/custom_text_input.dart';

import '../../../util/app_color_palette.dart';


class CalculatorCard extends StatelessWidget {

  CalculatorCard({super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0.w,),
        child: Column(
          children: [
            SizedBox(
              height: 110.h,
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 3.h),
                  child: Container(
                    width: 150.0.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                      color: AppColorPalette.white,
                      borderRadius: BorderRadius.circular(18.0), // Adjust the border radius as needed
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomTextInputField(
                            hintText: 'Sender Location',
                            leadingIcon: const Icon(Icons.open_in_browser_outlined,
                              color: AppColorPalette.gray,
                              size: 32,),
                          ),
                           SizedBox(height: 4.h,),
                          CustomTextInputField(
                            hintText: 'Reciever Location',
                            leadingIcon: const Icon(
                              Icons.sim_card_download_outlined,
                              color: AppColorPalette.gray,
                              size: 32,),

                          ),
                          SizedBox(height: 4.h,),
                          CustomTextInputField(
                            hintText: 'Approx Weight',
                            leadingIcon: const Icon(Icons.scale_outlined,
                            color: AppColorPalette.gray,
                            size: 32,),

                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}






