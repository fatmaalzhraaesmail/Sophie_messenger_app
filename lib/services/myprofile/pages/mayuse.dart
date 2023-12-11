  // child: GridView.builder(
                                      //   gridDelegate:
                                      //       SliverGridDelegateWithFixedCrossAxisCount(
                                      //     crossAxisCount:
                                      //         2, // Number of columns in the grid
                                      //     crossAxisSpacing:
                                      //         4, // Spacing between columns
                                      //     mainAxisSpacing:
                                      //         4, // Spacing between rows
                                      //     childAspectRatio:
                                      //         1.0, // Aspect ratio for each grid item
                                      //   ),
                                      //   itemCount:
                                      //       len+1, // Total number of images
                                      //   itemBuilder:
                                      //       (BuildContext context, int index) {
                                      //     // Calculate the adjusted index for each grid
                                      //     int adjustedIndex = index - 1;

                                      //     if (index == 0) {
                                      //       // Display the first image as a larger block
                                      //       return Container(
                                      //         child: Image.asset(
                                      //           images[
                                      //               index], // URL of the image
                                      //           fit: BoxFit
                                      //               .cover, // Adjust the image to cover the space
                                      //         ),
                                      //         height:
                                      //             200, // Adjust the height as needed
                                      //       );
                                      //     } else {
                                      //       return GridView.builder(
                                      //         gridDelegate:
                                      //             SliverGridDelegateWithFixedCrossAxisCount(
                                      //           crossAxisCount:
                                      //               2, // Number of columns in the grid
                                      //           crossAxisSpacing:
                                      //               4, // Spacing between columns
                                      //           mainAxisSpacing:
                                      //               4, // Spacing between rows
                                      //           childAspectRatio:
                                      //               1.0, // Aspect ratio for each grid item
                                      //         ),
                                      //         itemCount: 4,
                                      //         itemBuilder: (context, index) {
                                      //           return Container(
                                      //             child: Image.asset(
                                      //               images[adjustedIndex +
                                      //                   (index *
                                      //                       4)], // URL of the image
                                      //               fit: BoxFit
                                      //                   .cover, // Adjust the image to cover the space
                                      //             ),
                                      //             height:
                                      //                 200, // Adjust the height as needed
                                      //           );
                                      //         },
                                      //       );
                                      //     }
                                      //   },
                                      // ),

                                      // child: GridView.builder(
                                      //   gridDelegate:
                                      //       SliverGridDelegateWithFixedCrossAxisCount(
                                      //     crossAxisCount:
                                      //         2, // Number of columns in the grid
                                      //     crossAxisSpacing:
                                      //         4, // Spacing between columns
                                      //     mainAxisSpacing:
                                      //         4, // Spacing between rows
                                      //     childAspectRatio:
                                      //         1.0, // Aspect ratio for each grid item
                                      //   ),
                                      //   itemCount:
                                      //       len+1, // Total number of images
                                      //   itemBuilder:
                                      //       (BuildContext context, int index) {
                                      //     // Calculate the adjusted index for each grid
                                      //     int adjustedIndex = index - 1;

                                      //     if (index == 0) {
                                      //       // Display the first image as a larger block
                                      //       return Container(
                                      //         child: Image.asset(
                                      //           images[
                                      //               index], // URL of the image
                                      //           fit: BoxFit
                                      //               .cover, // Adjust the image to cover the space
                                      //         ),
                                      //         height:
                                      //             200, // Adjust the height as needed
                                      //       );
                                      //     } else {
                                      //       return GridView.builder(
                                      //         gridDelegate:
                                      //             SliverGridDelegateWithFixedCrossAxisCount(
                                      //           crossAxisCount:
                                      //               2, // Number of columns in the grid
                                      //           crossAxisSpacing:
                                      //               4, // Spacing between columns
                                      //           mainAxisSpacing:
                                      //               4, // Spacing between rows
                                      //           childAspectRatio:
                                      //               1.0, // Aspect ratio for each grid item
                                      //         ),
                                      //         itemCount: 4,
                                      //         itemBuilder: (context, index) {
                                      //           return Container(
                                      //             child: Image.asset(
                                      //               images[adjustedIndex +
                                      //                   (index *
                                      //                       4)], // URL of the image
                                      //               fit: BoxFit
                                      //                   .cover, // Adjust the image to cover the space
                                      //             ),
                                      //             height:
                                      //                 200, // Adjust the height as needed
                                      //           );
                                      //         },
                                      //       );
                                      //     }
                                      //   },
                                      // ),

//                                       child: GridView.builder(
//   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//     crossAxisCount: 2, // Number of columns in the grid
//     crossAxisSpacing: 4, // Spacing between columns
//     mainAxisSpacing: 4, // Spacing between rows
//     childAspectRatio: 1.0, // Aspect ratio for each grid item
//   ),
//   itemCount: len, // Total number of grids
//   itemBuilder: (BuildContext context, int index) {
//     int startIndex = index * 4; // Starting index of the images in each grid
//     int endIndex = startIndex + 4; // Ending index of the images in each grid

//     return GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2, // Number of columns in the grid
//         crossAxisSpacing: 4, // Spacing between columns
//         mainAxisSpacing: 4, // Spacing between rows
//         childAspectRatio: 1.0, // Aspect ratio for each grid item
//       ),
//       itemCount: endIndex - startIndex, // Number of images in each grid
//       itemBuilder: (context, subIndex) {
//         int imageIndex = startIndex + subIndex; // Index of the current image
//         return Container(
//           child: Image.asset(
//             images[imageIndex], // URL of the image
//             fit: BoxFit.cover, // Adjust the image to cover the space
//           ),
//           height: 200, // Adjust the height as needed
//         );
//       },
//     );
//   },
// ),

// child: GridView.builder(
//   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//     crossAxisCount: 2, // Number of columns in the grid
//     crossAxisSpacing: 4, // Spacing between columns
//     mainAxisSpacing: 4, // Spacing between rows
//     childAspectRatio: 1.0, // Aspect ratio for each grid item
//   ),
//   itemCount: (len + 3) ~/ 4, // Total number of grids
//   itemBuilder: (BuildContext context, int gridIndex) {
//     final startIndex = gridIndex * 4;
//     final endIndex = startIndex + 4;
//     final gridImages = images.sublist(startIndex, endIndex.clamp(0, len));

//     if (gridIndex == 0) {
//       // Display the first image as a larger block
//       return Container(
//         child: Image.asset(
//           images[0], // URL of the image
//           fit: BoxFit.cover, // Adjust the image to cover the space
//         ),
//         height: 200, // Adjust the height as needed
//       );
//     } else {
//       return GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2, // Number of columns in the grid
//           crossAxisSpacing: 4, // Spacing between columns
//           mainAxisSpacing: 4, // Spacing between rows
//           childAspectRatio: 1.0, // Aspect ratio for each grid item
//         ),
//         itemCount: gridImages.length, // Number of images in the grid
//         itemBuilder: (context, subIndex) {
//           final adjustedIndex = startIndex + subIndex;

//           return Container(
//             child: Image.asset(
//               images[adjustedIndex], // URL of the image
//               fit: BoxFit.cover, // Adjust the image to cover the space
//             ),
//             height: 200, // Adjust the height as needed
//           );
//         },
//       );
//     }
//   },
// ),



// child: GridView.builder(
//   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//     crossAxisCount: 2, // Number of columns in the grid
//     crossAxisSpacing: 4, // Spacing between columns
//     mainAxisSpacing: 4, // Spacing between rows
//     childAspectRatio: 1.0, // Aspect ratio for each grid item
//   ),
//   itemCount: (len + 3) ~/ 4, // Total number of grids
//   itemBuilder: (BuildContext context, int gridIndex) {
//     final startIndex = gridIndex * 4;
//     final endIndex = (startIndex + 4).clamp(0, len);
//     final gridImages = images.sublist(startIndex, endIndex);

//     if (gridIndex == 0) {
//       // Display the first image as a larger block
//       return Container(
//         child: Image.asset(
//           images[0], // URL of the image
//           fit: BoxFit.cover, // Adjust the image to cover the space
//         ),
//         height: 200, // Adjust the height as needed
//       );
//     } else {
//       return GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2, // Number of columns in the grid
//           crossAxisSpacing: 4, // Spacing between columns
//           mainAxisSpacing: 4, // Spacing between rows
//           childAspectRatio: 1.0, // Aspect ratio for each grid item
//         ),
//         itemCount: gridImages.length, // Number of images in the grid
//         itemBuilder: (context, subIndex) {
//           final adjustedIndex = startIndex + subIndex;

//           return Container(
//             child: Image.asset(
//               images[adjustedIndex], // URL of the image
//               fit: BoxFit.cover, // Adjust the image to cover the space
//             ),
//             height: 200, // Adjust the height as needed
//           );
//         },
//       );
//     }
//   },
// ),

                                      //  child: GridView.builder(
                                      //   gridDelegate:
                                      //       SliverGridDelegateWithFixedCrossAxisCount(
                                      //     crossAxisCount:
                                      //         2, // Number of columns in the grid
                                      //     crossAxisSpacing:
                                      //         4, // Spacing between columns
                                      //     mainAxisSpacing:
                                      //         4, // Spacing between rows
                                      //     childAspectRatio:
                                      //         1.0, // Aspect ratio for each grid item
                                      //   ),
                                      //   itemCount: len, // Total number of images
                                      //   itemBuilder:
                                      //       (BuildContext context, int index) {
                                      //     if (index == 0) {
                                      //       // Display the first image as a larger block
                                      //       return Container(
                                      //         child: Image.asset(
                                      //           images[
                                      //               index], // URL of the image
                                      //           fit: BoxFit
                                      //               .cover, // Adjust the image to cover the space
                                      //         ),
                                      //         height:
                                      //             200, // Adjust the height as needed
                                      //       );
                                      //     }
                                      //     else if (index == 1) {

                                      //         // Display regular images
                                      //         return GridView.builder(
                                      //           gridDelegate:
                                      //               SliverGridDelegateWithFixedCrossAxisCount(
                                      //             crossAxisCount:
                                      //                 2, // Number of columns in the grid
                                      //             crossAxisSpacing:
                                      //                 4, // Spacing between columns
                                      //             mainAxisSpacing:
                                      //                 4, // Spacing between rows
                                      //             childAspectRatio: 1.0, // As
                                      //           ),
                                      //           itemCount: 4,
                                      //           itemBuilder: (context, index) {
                                      //             print(index);
                                      //             return Container(
                                      //               child: Image.asset(
                                      //                 images[index +
                                      //                     1], // URL of the image
                                      //                 fit: BoxFit
                                      //                     .cover, // Adjust the image to cover the space
                                      //               ),
                                      //               height:
                                      //                   200, // Adjust the height as needed
                                      //             );
                                      //           },
                                      //         );

                                      //     } else if(index==2) {

                                      //         print("ggg");
                                      //         print(index);
                                      //         return GridView.builder(
                                      //           gridDelegate:
                                      //               SliverGridDelegateWithFixedCrossAxisCount(
                                      //             crossAxisCount:
                                      //                 2, // Number of columns in the grid
                                      //             crossAxisSpacing:
                                      //                 4, // Spacing between columns
                                      //             mainAxisSpacing:
                                      //                 4, // Spacing between rows
                                      //             childAspectRatio: 1.0, // As
                                      //           ),
                                      //           itemCount: 4,
                                      //           itemBuilder: (context, index) {
                                      //             return Container(
                                      //               child: Image.asset(
                                      //                 images[
                                      //                     index+5], // URL of the image
                                      //                 fit: BoxFit
                                      //                     .cover, // Adjust the image to cover the space
                                      //               ),
                                      //               height:
                                      //                   200, // Adjust the height as needed
                                      //             );
                                      //           },
                                      //         );

                                      //     }
                                      //     else if(index==3) {

                                      //         print("ggg");
                                      //         print(index);
                                      //         return GridView.builder(
                                      //           gridDelegate:
                                      //               SliverGridDelegateWithFixedCrossAxisCount(
                                      //             crossAxisCount:
                                      //                 2, // Number of columns in the grid
                                      //             crossAxisSpacing:
                                      //                 4, // Spacing between columns
                                      //             mainAxisSpacing:
                                      //                 4, // Spacing between rows
                                      //             childAspectRatio: 1.0, // As
                                      //           ),
                                      //           itemCount: 4,
                                      //           itemBuilder: (context, index) {
                                      //             return Container(
                                      //               child: Image.asset(
                                      //                 images[
                                      //                     index+9], // URL of the image
                                      //                 fit: BoxFit
                                      //                     .cover, // Adjust the image to cover the space
                                      //               ),
                                      //               height:
                                      //                   200, // Adjust the height as needed
                                      //             );
                                      //           },
                                      //         );

                                      //     }
                                      //   },
                                      // ),







                                      
// class RegisterScreen extends StatefulWidget {
//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   bool _rememberMe = false;
//   bool isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => RegisterCubit(),
//       child: Scaffold(
//         body: Container(
//           width: double.infinity,
//           height: MediaHelper.height,
//           decoration: BoxDecoration(
//               image: DecorationImage(
//             image: AssetImage(
//               "assets/images/stefan-stefancik-QXevDflbl8A-unsplash.jpg",
//             ),
//             fit: BoxFit.cover,
//           )),
//           child: Column(
//             children: [
//               Expanded(
//                 flex: 1,
//                 child: SingleChildScrollView(
//                   child: SafeArea(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 15),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           GestureDetector(
//                             onTap: () => CustomNavigator.pop(),
//                             child: Icon(
//                               Icons.arrow_back,
//                               size: 28,
//                               color: Colors.white,
//                             ),
//                           ),
//                           GestureDetector(
//                               onTap: () => CustomNavigator.push(Routes.login),
//                               child: Text(
//                                 "Get Login",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 18),
//                               ))
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),

//               BlocConsumer<RegisterCubit, RegisterState>(
//                 listener: (context, state) {
//                   // TODO: implement listener
//                 },
//                 builder: (context, state) {
//                   var bloc = context.read<RegisterCubit>();
//                   return ModalProgressHUD(
//                     inAsyncCall: isLoading,
//                     progressIndicator: CircularProgressIndicator(
//                       // Customize the color and size of the progress indicator
//                       valueColor: AlwaysStoppedAnimation<Color>(
//                           AppTextStyles.maincolor),
//                       strokeWidth: 4.0,
//                       semanticsLabel: 'Wating',
//                     ),
//                     child: Expanded(
//                       child: Container(
//                         width: double.infinity,
//                         decoration: const BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(20),
//                               topRight: Radius.circular(20),
//                             )),
//                         child: SingleChildScrollView(
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     vertical: 12, horizontal: 20),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           vertical: 10),
//                                       child: Text(
//                                         "Signup",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.w900,
//                                             fontSize: 25),
//                                       ),
//                                     ),
//                                     TextInputField(
//                                       hintText: 'User Name',
//                                       controller: bloc.namecontroller,
//                                       keyboardType: TextInputType.name,
//                                       hasError: !bloc.nameIsValid,
//                                       errorText: bloc.nameError,
//                                       onChange: (p0) {
//                                         if (!bloc.nameIsValid) {
//                                           bloc.nameIsValid = true;
//                                         }
//                                       },
//                                     ),
//                                     TextInputField(
//                                       controller: bloc.emailcontroller,
//                                       keyboardType: TextInputType.emailAddress,
//                                       hintText: 'Email Address',
//                                       hasError: !bloc.emailIsValid,
//                                       errorText: bloc.emailError,
//                                       onChange: (p0) {
//                                         if (!bloc.emailIsValid) {
//                                           bloc.emailIsValid = true;
//                                         }
//                                       },
//                                     ),
//                                     TextInputField(
//                                       hintText: 'Password',
//                                       controller: bloc.passwordcontroller,
//                                       keyboardType:
//                                           TextInputType.visiblePassword,
//                                       hasError: !bloc.passwordIsValid,
//                                       errorText: bloc.passwordError,
//                                       onChange: (p0) {
//                                         if (!bloc.passwordIsValid) {
//                                           bloc.passwordIsValid = true;
//                                         }
//                                       },
//                                     ),
//                                     TextInputField(
//                                       hintText: 'Confirm Password',
//                                       controller:
//                                           bloc.confirmPasswordcontroller,
//                                       keyboardType:
//                                           TextInputType.visiblePassword,
//                                       hasError: !bloc.confirmPasswordIsValid,
//                                       errorText: bloc.confirmPasswordError,
//                                       onChange: (p0) {
//                                         if (!bloc.confirmPasswordIsValid) {
//                                           bloc.confirmPasswordIsValid = true;
//                                         }
//                                       },
//                                       withBottomPadding: false,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 11),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Checkbox(
//                                       checkColor: HexColor('#FFFFFF'),
//                                       focusColor: HexColor('24bbb4'),
//                                       materialTapTargetSize:
//                                           MaterialTapTargetSize.shrinkWrap,
//                                       activeColor: HexColor('FFFFFF'),
//                                       hoverColor: HexColor('24bbb4'),
//                                       overlayColor: MaterialStatePropertyAll(
//                                           HexColor('24bbb4')),
//                                       fillColor: MaterialStatePropertyAll(
//                                         _rememberMe == false
//                                             ? Colors.white
//                                             : HexColor('#24bbb4'),
//                                       ),
//                                       side: BorderSide(
//                                           style: BorderStyle.solid,
//                                           color: HexColor('#24bbb4'),
//                                           width: 1.3),
//                                       value: _rememberMe,
//                                       splashRadius: 5,
//                                       tristate: false,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           _rememberMe = value!;
//                                         });
//                                       },
//                                     ),
//                                     Text.rich(
//                                       TextSpan(
//                                         text: 'I need & agree with',
//                                         style: TextStyle(
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.w600),
//                                         children: [
//                                           TextSpan(
//                                               text: ' Terms & Codition',
//                                               style: AppTextStyles.secondary),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 20, vertical: 10),
//                                 child: CustomBtn(
//                                   onTap: () => bloc.click(),
//                                   // onTap: () => CustomNavigator.push(
//                                   //     Routes.continue_setup), //will remove
//                                   radius: 18,
//                                   textColor: Colors.white,
//                                   height: 48,
//                                   text: "Signup Now",
//                                   buttonColor: HexColor('56cfca'),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               )
//               //
//             ],
//           ),
//         ),
//       ),
//     );
//     // return BlocProvider(
//     //   create: (context) => RegisterCubit(),
//     //   child: BlocConsumer<RegisterCubit, RegisterState>(
//     //     listener: (context, state) {
//     //       if (state is LoginLoading) {
//     //         isLoading = true;
//     //       } else if (state is LoginFailure) {
//     //         SnackbarComponent.showSnackbar(context, state.errorMessage);
//     //       }
//     //     },
//     //     builder: (context,RegisterState state) {
//     //       var bloc = context.read<RegisterCubit>();
//     //       return ModalProgressHUD(
//     //         inAsyncCall: isLoading,

//     //         progressIndicator: CircularProgressIndicator(
//     //           // Customize the color and size of the progress indicator
//     //           valueColor:
//     //               AlwaysStoppedAnimation<Color>(AppTextStyles.maincolor),
//     //           strokeWidth: 4.0,
//     //           semanticsLabel: 'Wating',

//     //         ),
//     //         child: Scaffold(
//     //           body: Container(
//     //             width: double.infinity,
//     //             height: MediaHelper.height,
//     //             decoration: BoxDecoration(
//     //                 image: DecorationImage(
//     //               image: AssetImage(
//     //                 "assets/images/stefan-stefancik-QXevDflbl8A-unsplash.jpg",
//     //               ),
//     //               fit: BoxFit.cover,
//     //             )),
//     //             child: Column(
//     //               children: [
//     //                 Expanded(
//     //                   flex: 1,
//     //                   child: SingleChildScrollView(
//     //                     child: SafeArea(
//     //                       child: Padding(
//     //                         padding: const EdgeInsets.symmetric(horizontal: 15),
//     //                         child: Row(
//     //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     //                           crossAxisAlignment: CrossAxisAlignment.start,
//     //                           children: [
//     //                             GestureDetector(
//     //                               onTap: () => CustomNavigator.pop(),
//     //                               child: Icon(
//     //                                 Icons.arrow_back,
//     //                                 size: 28,
//     //                                 color: Colors.white,
//     //                               ),
//     //                             ),
//     //                             GestureDetector(
//     //                                 onTap: () =>
//     //                                     CustomNavigator.push(Routes.login),
//     //                                 child: Text(
//     //                                   "Get Login",
//     //                                   style: TextStyle(
//     //                                       color: Colors.white,
//     //                                       fontWeight: FontWeight.w500,
//     //                                       fontSize: 18),
//     //                                 ))
//     //                           ],
//     //                         ),
//     //                       ),
//     //                     ),
//     //                   ),
//     //                 ),

//     //                 Expanded(
//     //                   child: Container(
//     //                     width: double.infinity,
//     //                     decoration: const BoxDecoration(
//     //                         color: Colors.white,
//     //                         borderRadius: BorderRadius.only(
//     //                           topLeft: Radius.circular(20),
//     //                           topRight: Radius.circular(20),
//     //                         )),
//     //                     child: SingleChildScrollView(
//     //                       child: Column(
//     //                         children: [
//     //                           Padding(
//     //                             padding: const EdgeInsets.symmetric(
//     //                                 vertical: 12, horizontal: 20),
//     //                             child: Column(
//     //                               mainAxisAlignment: MainAxisAlignment.start,
//     //                               crossAxisAlignment: CrossAxisAlignment.start,
//     //                               children: [
//     //                                 Padding(
//     //                                   padding: const EdgeInsets.symmetric(
//     //                                       vertical: 10),
//     //                                   child: Text(
//     //                                     "Signup",
//     //                                     style: TextStyle(
//     //                                         fontWeight: FontWeight.w900,
//     //                                         fontSize: 25),
//     //                                   ),
//     //                                 ),
//     //                                 TextInputField(
//     //                                   hintText: 'User Name',
//     //                                   controller: bloc.namecontroller,
//     //                                   keyboardType: TextInputType.name,
//     //                                   hasError: !bloc.nameIsValid,
//     //                                   errorText: bloc.nameError,
//     //                                   onChange: (p0) {
//     //                                     if (!bloc.nameIsValid) {
//     //                                       bloc.nameIsValid = true;
//     //                                     }
//     //                                   },
//     //                                 ),
//     //                                 TextInputField(
//     //                                   controller: bloc.emailcontroller,
//     //                                   keyboardType: TextInputType.emailAddress,
//     //                                   hintText: 'Email Address',
//     //                                   hasError: !bloc.emailIsValid,
//     //                                   errorText: bloc.emailError,
//     //                                   onChange: (p0) {
//     //                                     if (!bloc.emailIsValid) {
//     //                                       bloc.emailIsValid = true;
//     //                                     }
//     //                                   },
//     //                                 ),
//     //                                 TextInputField(
//     //                                   hintText: 'Password',
//     //                                   controller: bloc.passwordcontroller,
//     //                                   keyboardType:
//     //                                       TextInputType.visiblePassword,
//     //                                   hasError: !bloc.passwordIsValid,
//     //                                   errorText: bloc.passwordError,
//     //                                   onChange: (p0) {
//     //                                     if (!bloc.passwordIsValid) {
//     //                                       bloc.passwordIsValid = true;
//     //                                     }
//     //                                   },
//     //                                 ),
//     //                                 TextInputField(
//     //                                   hintText: 'Confirm Password',
//     //                                   controller:
//     //                                       bloc.confirmPasswordcontroller,
//     //                                   keyboardType:
//     //                                       TextInputType.visiblePassword,
//     //                                   hasError: !bloc.confirmPasswordIsValid,
//     //                                   errorText: bloc.confirmPasswordError,
//     //                                   onChange: (p0) {
//     //                                     if (!bloc.confirmPasswordIsValid) {
//     //                                       bloc.confirmPasswordIsValid = true;
//     //                                     }
//     //                                   },
//     //                                   withBottomPadding: false,
//     //                                 ),
//     //                               ],
//     //                             ),
//     //                           ),
//     //                           Padding(
//     //                             padding:
//     //                                 const EdgeInsets.symmetric(horizontal: 11),
//     //                             child: Row(
//     //                               mainAxisAlignment: MainAxisAlignment.start,
//     //                               children: [
//     //                                 Checkbox(
//     //                                   checkColor: HexColor('#FFFFFF'),
//     //                                   focusColor: HexColor('24bbb4'),
//     //                                   materialTapTargetSize:
//     //                                       MaterialTapTargetSize.shrinkWrap,
//     //                                   activeColor: HexColor('FFFFFF'),
//     //                                   hoverColor: HexColor('24bbb4'),
//     //                                   overlayColor: MaterialStatePropertyAll(
//     //                                       HexColor('24bbb4')),
//     //                                   fillColor: MaterialStatePropertyAll(
//     //                                     _rememberMe == false
//     //                                         ? Colors.white
//     //                                         : HexColor('#24bbb4'),
//     //                                   ),
//     //                                   side: BorderSide(
//     //                                       style: BorderStyle.solid,
//     //                                       color: HexColor('#24bbb4'),
//     //                                       width: 1.3),
//     //                                   value: _rememberMe,
//     //                                   splashRadius: 5,
//     //                                   tristate: false,
//     //                                   onChanged: (value) {
//     //                                     setState(() {
//     //                                       _rememberMe = value!;
//     //                                     });
//     //                                   },
//     //                                 ),
//     //                                 Text.rich(
//     //                                   TextSpan(
//     //                                     text: 'I need & agree with',
//     //                                     style: TextStyle(
//     //                                         fontSize: 15,
//     //                                         fontWeight: FontWeight.w600),
//     //                                     children: [
//     //                                       TextSpan(
//     //                                           text: ' Terms & Codition',
//     //                                           style: AppTextStyles.secondary),
//     //                                     ],
//     //                                   ),
//     //                                 ),
//     //                               ],
//     //                             ),
//     //                           ),
//     //                           Padding(
//     //                             padding: const EdgeInsets.symmetric(
//     //                                 horizontal: 20, vertical: 10),
//     //                             child: CustomBtn(
//     //                               onTap: () => bloc.click(),
//     //                               // onTap: () => CustomNavigator.push(
//     //                               //     Routes.continue_setup), //will remove
//     //                               radius: 18,
//     //                               textColor: Colors.white,
//     //                               height: 48,
//     //                               text: "Signup Now",
//     //                               buttonColor: HexColor('56cfca'),
//     //                             ),
//     //                           ),
//     //                         ],
//     //                       ),
//     //                     ),
//     //                   ),
//     //                 )
//     //                 //
//     //               ],
//     //             ),
//     //           ),
//     //         ),
//     //       );
//     //     },
//     //   ),
//     // );
//   }
// }

// email verfy

 // Completer<bool> emailVerificationCompleter = Completer<bool>();

        // await user.user!.sendEmailVerification();

        // print("////////////////");

// Wait for the email verification to complete
        // bool isEmailVerified = await emailVerificationCompleter.future;

        // print(isEmailVerified);

        // if (isEmailVerified) {
        //   // Redirect the user
        //   emit(LoginSuccess());
        //   // Navigator.pushReplacement(
        //   //   context,
        //   //   MaterialPageRoute(
        //   //     builder: (context) => ContinueSetupScreen(),
        //   //   ),
        //   // );
        // }

        // await user.user!.sendEmailVerification().then((value) {
        //   FirebaseAuth.instance.authStateChanges().listen((User? user) async {
        //     if (user != null && user.emailVerified) {
        //       print("trueeeee");
        //       // Update isVerified field to true
        //       await FirebaseFirestore.instance
        //           .collection('users')
        //           .doc(user.uid)
        //           .update({'isVerified': true});

        //       // RedLoginSuccess());
        //       emit(LoginSuccess());
        //       // Navigator.pushReplacement(
        //       //   context,
        //       //   MaterialPageRoute(
        //       //     builder: (context) => ContinueSetupScreen(),
        //       //   ),
        //       // );
        //     }
        //   });
        // });

        // print("////////////////");
        // print(user.user!.emailVerified);

        // await user.user!.sendEmailVerification();

        // // Store user data in Firestore
        // // await storeDatabaseFirestore(user.user!.uid.toString(), data);

        // // Listen for changes in email verification status
        // FirebaseAuth.instance.authStateChanges().listen((User? user) async {
        //   if (user != null && user.emailVerified) {
        //     // Update isVerified field to true
        //     await FirebaseFirestore.instance
        //         .collection('users')
        //         .doc(user.uid)
        //         .update({'isVerified': true});

        //     // Redirect to ContinueSetup screen
        //     CustomNavigator.push(Routes.continue_setup);
        //     // Navigator.pushReplacement(
        //     //   context,
        //     //   MaterialPageRoute(
        //     //     builder: (context) => ContinueSetupScreen(),
        //     //   ),
        //     // );
        //   }
        // });

 // storeDatabaseFirestore(user.user!.uid.toString()).then((value) {});
        // await user.user!.sendEmailVerification();
        // if (user.user!.emailVerified) {
        //   DocumentReference userRef = FirebaseFirestore.instance
        //       .collection('users')
        //       .doc(FirebaseAuth.instance.currentUser!.uid.toString());
        //   await userRef
        //       .set({"isVerified": true}, SetOptions(merge: true)).then((value) {
        //     print("Field updated successfully");
        //     emit(LoginSuccess());
        //   }).catchError((error) {
        //     print("Failed to update field: $error");
        //   });
        // }
        // await updatedVerification(user.user!.uid.toString(), data);

        // Future<void> updatedVerification(String id, Map<String, dynamic> data) async {
  //   data['isVerified'] = false; // Set initial value of isVerified to false
  //   await FirebaseFirestore.instance.collection('users').doc(id).set(data);

  //   // Listen for changes in email verification status
  //   FirebaseAuth.instance.authStateChanges().listen((User? user) async {
  //     if (user != null && user.emailVerified == false) {
  //       // Update isVerified field to true
  //       await FirebaseFirestore.instance
  //           .collection('users')
  //           .doc(id)
  //           .update({'isVerified': true});
  //       emit(LoginSuccess());
  //     }
  //   });
  // }
  // Future<void> checkEmailVerification()async{
  //   user= auth.

  // }