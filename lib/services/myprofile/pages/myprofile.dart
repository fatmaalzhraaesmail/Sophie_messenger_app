import 'package:flutter/material.dart';
import 'package:sophie_messenger_app/handlers/icon_handler.dart';
import 'package:sophie_messenger_app/services/myprofile/constants/divider.dart';
import 'package:sophie_messenger_app/utilities/theme/media.dart';
import 'package:sophie_messenger_app/utilities/theme/text_styles.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "assets/images/person1.jpg",
      "assets/images/person2.jpg",
      "assets/images/person3.jpg",
      "assets/images/person4.jpg",
      "assets/images/person5.jpg",
      "assets/images/person6.jpg",
      "assets/images/person7.jpg",
      "assets/images/person8.jpg",
      "assets/images/person9.jpg",
      "assets/images/person10.jpg",
      "assets/images/person11.jpg",
      "assets/images/person12.jpg",
      "assets/images/person13.jpg",
      "assets/images/person14.jpg",
      "assets/images/person15.jpg",
      "assets/images/person16.jpg",
      "assets/images/person17.jpg",
      "assets/images/person6.jpg",
    ];
    if ((images.length - 1) % 4 != 0) {
      if (images.length % 10 != 0) {
        var remeder = images.length % 10;
        var endloop = 10 - remeder;
        for (int i = 0; i <= endloop; i++) {
          images.add('assets/images/white.png');
        }
      }
    } else {}

    print(images.length);
    int len = (images.length / 4).ceil();
    print(len);
    // int len2 = ;
    return Scaffold(
      backgroundColor: Colors.white38,
      // appBar: AppBar(
      //   title: Text("My Profile"),
      //   centerTitle: false,
      //   automaticallyImplyLeading: false,
      //   elevation: 0.0,
      //   bottomOpacity: 0,
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: drawSvgIcon('groupsetting', iconColor: Colors.white),
      //       splashColor: Colors.transparent,
      //       enableFeedback: false,
      //       highlightColor: Colors.transparent,
      //     ),
      //   ],
      //   // bottom: PreferredSize(
      //   //   preferredSize: Size.fromHeight(kToolbarHeight),
      //   //   child: AppBar(
      //   //     automaticallyImplyLeading: false,
      //   //   ),
      //   // ),
      // ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              // flex: 1,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    color: AppTextStyles.maincolor,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    height: 160,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'My Profile',
                            style: AppTextStyles.appBar.copyWith(fontSize: 28),
                          ),
                          drawSvgIcon('groupsetting', iconColor: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 65),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: MediaHelper.width,
                              height: MediaHelper.height,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 2,
                                              blurRadius: 1.4,
                                              offset: Offset(1, 2),
                                            ),
                                          ]),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                maxRadius: 30,
                                                backgroundImage: AssetImage(
                                                    'assets/images/person1.jpg'),
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Fatma Alzhraa Esmail",
                                                      style:
                                                          AppTextStyles.unread),
                                                  Text(
                                                    'Flutter Developer',
                                                    style: AppTextStyles
                                                        .readmessage,
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          MySeperator(),
                                          Container(
                                            // height: 66,
                                            child: Text(
                                              "I have a passion for Mobile Application Using Flutter. I enjoy researching and built applications in many fields (e-commerce, management systems,etc.…), interested in studying software engineering topics.",
                                              style: TextStyle(
                                                overflow: TextOverflow.clip,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black
                                              ),
                                            ),
                                          ),
                                          MySeperator(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    '532',
                                                    style: AppTextStyles.unread,
                                                  ),
                                                  SizedBox(
                                                    height: 2,
                                                  ),
                                                  Text(
                                                    'Public Posts',
                                                    style: AppTextStyles
                                                        .readmessage
                                                        .copyWith(fontSize: 15),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    '4389',
                                                    style: AppTextStyles.unread,
                                                  ),
                                                  SizedBox(
                                                    height: 2,
                                                  ),
                                                  Text(
                                                    'Follwers',
                                                    style: AppTextStyles
                                                        .readmessage
                                                        .copyWith(fontSize: 15),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    '8543',
                                                    style: AppTextStyles.unread,
                                                  ),
                                                  SizedBox(
                                                    height: 2,
                                                  ),
                                                  Text(
                                                    'Following',
                                                    style: AppTextStyles
                                                        .readmessage
                                                        .copyWith(fontSize: 15),
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    height: 20,
                                  ),
                                  
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 2,
                                            blurRadius: 1.4,
                                            offset: Offset(
                                              1,
                                              2,
                                            ),
                                          ),
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 15),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Friends',
                                                style: AppTextStyles.unread
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        fontSize: 18),
                                              ),
                                              Text(
                                                'See all',
                                                style: AppTextStyles.secondary
                                                    .copyWith(fontSize: 18),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 13,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 60,
                                            child: ListView.separated(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                physics:
                                                    BouncingScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  if (index == 4) {
                                                    return CircleAvatar(
                                                      maxRadius: 28,
                                                      backgroundColor:
                                                          AppTextStyles
                                                              .maincolor,
                                                      child: Text(
                                                        '+70',
                                                        style: AppTextStyles
                                                            .w300
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                    );
                                                  } else {
                                                    return CircleAvatar(
                                                      maxRadius: 28,
                                                      backgroundImage: AssetImage(
                                                          'assets/images/person1.jpg'),
                                                    );
                                                  }
                                                },
                                                separatorBuilder:
                                                    (context, index) =>
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                itemCount: 5),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      height: double.infinity,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 2,
                                              blurRadius: 1.4,
                                              offset: Offset(
                                                1,
                                                2,
                                              ),
                                            ),
                                          ]),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 15,),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Photos',
                                                    style: AppTextStyles.unread
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: 18),
                                                  ),
                                                  Text(
                                                    'See all',
                                                    style: AppTextStyles.secondary
                                                        .copyWith(fontSize: 18),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: double.infinity,
                                                child: GridView.builder(
                                                  scrollDirection: Axis.vertical,
                                                  physics: BouncingScrollPhysics(),
                                                  padding: EdgeInsets.only(top: 12),
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount:
                                                        2, // Number of columns in the grid
                                                    crossAxisSpacing:
                                                        4, // Spacing between columns
                                                    mainAxisSpacing:
                                                        4, // Spacing between rows
                                                    childAspectRatio:
                                                        1.0, // Aspect ratio for each grid item
                                                  ),
                                                  itemCount:
                                                      len, // Total number of grids
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    if (index == 0) {
                                                      // Display the first image as a larger block
                                                      return Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(4),
                                                          image: DecorationImage(image: AssetImage(
                                                             images[
                                                              index]
                                                          ),
                                                          fit: BoxFit.cover
                                                          )
                                                          ,
                                                          
                                                        ),
                                                        // child: Image.asset(
                                                        //   images[
                                                        //       index], // URL of the image
                                                        //   fit: BoxFit
                                                        //       .cover, // Adjust the image to cover the space
                                                        // ),
                                                        height:
                                                            200, // Adjust the height as needed
                                                      );
                                                    } else {
                                                      int gridIndex = index -
                                                          1; // Calculate the grid index
                                              
                                                      return GridView.builder(
                                                          padding: EdgeInsets.only(top: 0),  
                                                          physics: BouncingScrollPhysics(),                                           scrollDirection: Axis.vertical,
                                              
                                                        gridDelegate:
                                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount:
                                                              2, // Number of columns in the grid
                                                          crossAxisSpacing:
                                                              4, // Spacing between columns
                                                          mainAxisSpacing:
                                                              4, // Spacing between rows
                                                          childAspectRatio:
                                                              1.0, // Aspect ratio for each grid item
                                                        ),
                                                        itemCount:
                                                            4, // Number of images in each grid
                                                        itemBuilder:
                                                            (context, subIndex) {
                                                          int adjustedIndex =
                                                              (subIndex +
                                                                      (gridIndex *
                                                                          4)) +
                                                                  1; // Calculate the adjusted index
                                              
                                                          return Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(4),
                                                              image: DecorationImage(image: AssetImage(images[
                                                                  adjustedIndex]),
                                                                   fit: BoxFit.cover
                                                                  ),
                                                            ),
                                                            // child: Image.asset(
                                                            //   images[
                                                            //       adjustedIndex], // URL of the image
                                                            //   fit: BoxFit
                                                            //       .cover, // Adjust the image to cover the space
                                                            // ),
                                                            height:
                                                                200, // Adjust the height as needed
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Add your scrollable content here
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
