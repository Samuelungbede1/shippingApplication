import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monie_point/use_cases/home/views/home_screen.dart';

import '../use_cases/home/widgets/custom_search_bar.dart';
import '../use_cases/search/view/search_screen.dart';
import '../util/app_color_palette.dart';

class CustomSearchBarContainer extends StatelessWidget {


  const CustomSearchBarContainer({super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColorPalette.violet,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                height: 110,
                color: AppColorPalette.violet,
                padding: const EdgeInsets.only(
                  top: 15,
                  right: 10.0,
                  left: 10,
                  bottom: 5.0,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 13,
                    ),
                    CustomSearchBar(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                        print("ATTEMPTING SEARCH");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
