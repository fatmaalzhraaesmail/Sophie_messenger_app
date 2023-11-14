import 'package:flutter/material.dart';
import '../../../utilities/components/custom_page_body.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomPageBody(
      // appBar: AppBar(
      //   title: Text("Home"),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: Column(
          children: [

          ],
        ),
      ),
      
      // body: BlocProvider(
      //   create: (context) => VerifictionCodeBloc(),
      //   child: SafeArea(
      //     child: SingleChildScrollView(
      //       child: Column(
      //         children: [
      //           BlocBuilder<VerifictionCodeBloc, verificationState>(
      //             builder: (context, state) {
      //               var bloc = context.read<VerifictionCodeBloc>();
      //               return CustomBtn(
      //                 text: 'click',
      //                 onTap: () {
      //                   bloc.sendVerificationCodeee();
      //                 },
      //               );
      //             },
      //           )
      //           // SizedBox(height: 30,),
      //           // Container(
      //           //   width: MediaHelper.width,
      //           //   height: MediaHelper.height,

      //           // decoration: BoxDecoration(
      //           //   color: Colors.amber,
      //           //   borderRadius: BorderRadius.only(
      //           // topLeft: Radius.circular(20.0),
      //           // topRight: Radius.circular(20.0),

      //           //   ),
      //           // ),
      //           // child: DraggableScrollableSheet(
      //           //   builder: (BuildContext context, ScrollController scrollController) {
      //           // return SingleChildScrollView(
      //           //   controller: scrollController,
      //           //   child:Column(
      //           // children: [
      //           //   Text("ffffff",style: TextStyle(color: Colors.black),),
      //           //   Text("ffffff"),
      //           //   Text("ffffff"),
      //           //   Text("ffffff"),
      //           //   Text("ffffff"),
      //           // ],
      //           //   ) // Your content here
      //           // );
      //           //   },
      //           // ),
      //           // ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
   
    );
  }
}
