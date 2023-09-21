// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../common_widgets/custom_search_bar_t.dart';
// import '../../../util/app_color_palette.dart';
// import '../../../util/base_styles.dart';
// import '../../home/widgets/custom_search_bar.dart';
// import '../widgets/search_card.dart';
//
// class SearchScreen extends StatefulWidget {
//   SearchScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> with TickerProviderStateMixin {
//   late AnimationController _appBarController;
//   late Animation<double> _appBarHeight;
//
//   @override
//   void initState() {
//     super.initState();
//     _appBarController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 5),
//     );
//     _appBarHeight = Tween<double>(
//       begin: 100.0, // Set your desired initial expanded height
//       end: 50.0, // Set your desired final expanded height
//     ).animate(CurvedAnimation(
//       parent: _appBarController,
//       curve: Curves.linear,
//     ));
//   }
//
//   @override
//   void dispose() {
//     _appBarController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColorPalette.bgColor,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             AnimatedBuilder(
//               animation: _appBarHeight,
//               builder: (context, child) {
//                 return CustomSearchBarContainer(
//                   // animatedHeight: _appBarHeight.value,
//                 );
//               },
//             ),
//
//           //   AnimatedBuilder(
//           //   animation: _appBarHeight,
//           //   builder: (context,child){
//           //     return   SliverAppBar(
//           //       backgroundColor: AppColorPalette.violet,
//           //       toolbarHeight: 50,
//           //       // Set your desired expanded height
//           //       pinned: true,
//           //       floating: false,
//           //       automaticallyImplyLeading: false,
//           //       bottom: PreferredSize(
//           //         preferredSize: const Size.fromHeight(50),
//           //         child: Padding(
//           //           padding:
//           //           const EdgeInsets.only(bottom: 20.0, left: 1, right: 10),
//           //           child: Row(
//           //             children: [
//           //               IconButton(
//           //                 icon: const Icon(
//           //                   Icons.arrow_back_ios_new_rounded,
//           //                   // Add your back arrow icon
//           //                   color: Colors.white,
//           //                   size: 30,
//           //                 ),
//           //                 onPressed: () {
//           //                   Navigator.of(context).pop(); // Handle back navigation
//           //                 },
//           //               ),
//           //               // const SizedBox(width: 16.0), // Adjust spacing as needed
//           //               Expanded(
//           //                 child: CustomSearchBar(),
//           //               ),
//           //             ],
//           //           ),
//           //         ),
//           //       ),
//           //     );
//           //   },
//           // )],
//
//
//           SearchCard(
//             // content: ListView.builder(
//             //   itemCount: 20,
//             //   itemBuilder: (context, index) {
//             //     return Column(
//             //       mainAxisAlignment: MainAxisAlignment.start,
//             //       children: [
//             //         ListTile(
//             //           title: Row(
//             //             children: [
//             //               Container(
//             //                 decoration: const BoxDecoration(
//             //                   shape: BoxShape.circle,
//             //                   color: AppColorPalette.violet,
//             //                 ),
//             //                 child: IconButton(
//             //                   icon: Icon(
//             //                     Icons.check_box_outlined,
//             //                     size: 90.w,
//             //                   ),
//             //                   color: AppColorPalette.white,
//             //                   onPressed: () {
//             //                     // Handle notification button tap
//             //                   },
//             //                 ),
//             //               ),
//             //               SizedBox(
//             //                 width: 20.w,
//             //               ),
//             //               Column(
//             //                 crossAxisAlignment: CrossAxisAlignment.start,
//             //                 children: [
//             //                   const Text('MacBook Pro M2', style: title),
//             //                   SizedBox(
//             //                     height: 10.w,
//             //                   ),
//             //                   const Text(
//             //                     '#NE84855744GGJS Paris • -> Morocco',
//             //                     style: subtitleText,
//             //                   ),
//             //                 ],
//             //               ),
//             //             ],
//             //           ),
//             //         ),
//             //         if (index < 19) Divider(
//             //           thickness: 1,
//             //         ), // Add a Divider for all items except the last one
//             //       ],
//             //     );
//             //   },
//             // ),
//           )
//     ]),
//       ),
//     );
//   }
// }
