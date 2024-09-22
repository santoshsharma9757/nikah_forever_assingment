// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:nikah_forever_assignment/core/common_widgets/custom_text_box.dart';
// import 'package:nikah_forever_assignment/core/constants/app_style.dart';
// import 'package:nikah_forever_assignment/features/auth/view_model/auth_viewmodel.dart';
// import 'package:provider/provider.dart';

// class CustomBottomSheet extends StatefulWidget {
//   final String sheetTitle;
//   final double sheetHeight;
//   final dynamic items;
//   final bool isRequiredPopClose;
//   final String information;

//   const CustomBottomSheet({
//     super.key,
//     required this.sheetTitle,
//     required this.sheetHeight,
//     required this.items,
//     this.isRequiredPopClose = true,
//     required this.information
//   });

//   @override
//   _CustomBottomSheetState createState() => _CustomBottomSheetState();
// }

// class _CustomBottomSheetState extends State<CustomBottomSheet> {
//   late PageController _pageController;
//   late AuthViewModel provider;
//   List<dynamic> currentList = [];
//   String combinedSelection = "";
//   Map<int, int?> selectedOptions = {}; // Track selected option index for each page
//   bool hasSwiped = false; // Flag to track if a swipe has occurred

//   @override
//   void initState() {
//     super.initState();
//     provider = Provider.of<AuthViewModel>(context, listen: false);
//     _pageController = PageController();
//     currentList = widget.items.keys.toList();
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: widget.sheetHeight,
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Align(
//             alignment: Alignment.topCenter,
//             child: Container(
//               width: 100,
//               height: 7,
//               decoration: BoxDecoration(
//                 color: AppColors.grey.withOpacity(0.5),
//                 borderRadius: BorderRadius.circular(2),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               widget.sheetTitle,
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Expanded(
//             child: PageView.builder(
//               controller: _pageController,
//               itemCount: currentList.length,
//               itemBuilder: (context, index) {
//                 return _buildList(
//                   title: "Select ${currentList[index]}",
//                   options: widget.items[currentList[index]],
//                   pageIndex: index,
//                   onSelected: (value) {
//                     setState(() {
//                       if (combinedSelection.isNotEmpty) {
//                         combinedSelection = "$combinedSelection,$value";
//                       } else {
//                         combinedSelection = value!;
//                       }

//                       if(widget.information=="locations"){
//                         provider.setselectedLocation(combinedSelection);
//                       }else{
//                          provider.setselectedOccupation(combinedSelection);
//                       }

//                       log("combined data $combinedSelection");
//                     });
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildList({
//     required String title,
//     required List<dynamic> options,
//     required int pageIndex,
//     required ValueChanged<String?> onSelected,
//   }) {
//     return Column(
//       key: ValueKey(title),
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           child: ListView.builder(
//             itemCount: options.length,
//             itemBuilder: (context, index) {
//               final option = options[index];
//               final isChecked = selectedOptions[pageIndex] == index;

//               return Consumer<AuthViewModel>(
//                 builder: (context, value, child) => CustomCheckbox(
//                   isChecked: isChecked,
//                   label: option.toString(),
//                   onChanged: () {
//                     if (selectedOptions[pageIndex] != index) {
//                       setState(() {
//                         selectedOptions[pageIndex] = index; // Store selected index
//                         context.read<AuthViewModel>().setSelectedIndexForCheckbox(index);
//                         onSelected(option);

//                         // Swipe to the next page if it hasn't been swiped yet
//                         if (!hasSwiped && widget.items is Map<String, dynamic> &&
//                             currentList.length > pageIndex + 1) {
//                           hasSwiped = true; // Set the flag to true after the first swipe
//                           _pageController.nextPage(
//                             duration: const Duration(milliseconds: 300),
//                             curve: Curves.easeIn,
//                           );
//                         }
//                       });
//                     } else {
//                       log("Checkbox already selected for this option.");
//                     }
//                   },
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
