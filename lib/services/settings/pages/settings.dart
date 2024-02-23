import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sophie_messenger_app/services/settings/widget/setting_widget.dart';
import 'package:sophie_messenger_app/utilities/theme/text_styles.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text('Settings'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
            child: GestureDetector(
              child: Text(
                'Reset',
                style: AppTextStyles.appBar
                    .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            color: AppTextStyles.maincolor,
            height: 58,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: 15),
                  // margin: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      color: HexColor('#e8e4e3').withAlpha(100),
                      borderRadius: BorderRadius.circular(20)),
                  width: MediaQuery.of(context).size.width - 25,
                  height: 45,
                  child: TextField(
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      // border: Border(bottom: BorderSide(color: Colors.w)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: 'Search Settings',
                      contentPadding: EdgeInsets.symmetric(vertical: 6),

                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      hoverColor: Colors.white,
                      hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          height: 2.7,
                          fontWeight: FontWeight.w500),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: Colors.white,
                          size: 27,
                        ),
                        onPressed: () {},
                        // onPressed: () => searchController.clear(),
                      ),
                      // Add a search icon or button to the search bar
                      prefixIcon: IconButton(
                        icon: Icon(
                          Icons.search_sharp,
                          color: Colors.white,
                          size: 27,
                        ),
                        onPressed: () {
                          // Perform the search here
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProfileOtherServices(
                    leading: CircleAvatar(
                      maxRadius: 18,
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.dark_mode,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                    trailing: SizedBox(
                      width: 50,
                      child: FlutterSwitch(
                        height: 22.0,
                        width: 40.0,
                        padding: 4.0,
                        toggleSize: 15.0,
                        borderRadius: 10.0,
                        value: false,
                        toggleColor: Colors.white,
                        activeColor: AppTextStyles.maincolor,
                        onToggle: (value) {},
                      ),
                    ),
                    title: 'Dark Mode',
                    ontap: () {},
                  ),
                  ProfileOtherServices(
                    leading: CircleAvatar(
                      maxRadius: 18,
                      backgroundColor: AppTextStyles.maincolor,
                      child: Icon(
                        Icons.person,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                    trailing: SizedBox(
                      width: 50,
                      child: FlutterSwitch(
                        height: 22.0,
                        width: 40.0,
                        padding: 4.0,
                        toggleSize: 15.0,
                        borderRadius: 10.0,
                        value: true,
                        toggleColor: Colors.white,
                        activeColor: AppTextStyles.maincolor,
                        onToggle: (value) {},
                      ),
                    ),
                    title: 'Profile Lock',
                    ontap: () {},
                  ),
                  ProfileOtherServices(
                    leading: CircleAvatar(
                      maxRadius: 18,
                      backgroundColor: HexColor('#5496ff'),
                      child: Icon(
                        Icons.messenger,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade500,
                      size: 26,
                    ),
                    title: 'Chat Customize',
                  ),
                  ProfileOtherServices(
                    leading: CircleAvatar(
                      maxRadius: 18,
                      backgroundColor: Colors.redAccent,
                      child: Icon(
                        Icons.notifications_active,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade500,
                      size: 26,
                    ),
                    title: 'Notification',
                    ontap: () {},
                  ),
                  ProfileOtherServices(
                    leading: CircleAvatar(
                      maxRadius: 18,
                      backgroundColor: Color.fromARGB(255, 243, 7, 255),
                      child: Icon(
                        Icons.privacy_tip,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade500,
                      size: 26,
                    ),
                    title: 'Privacy',
                    ontap: () {},
                  ),
                  ProfileOtherServices(
                    leading: CircleAvatar(
                      maxRadius: 18,
                      backgroundColor: Colors.redAccent,
                      child: Icon(
                        Icons.exit_to_app,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                    trailing: Icon(
                      Icons.logout,
                      color: Colors.grey.shade500,
                      size: 26,
                    ),
                    title: 'Log Out',
                    ontap: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),

          // CustomBtn(
          //   text: 'Log Out',
          //   buttonColor: AppTextStyles.maincolor,
          //   textColor: Colors.white,
          //   radius: 20,
          //   height: 56,
          // )
        ],
      ),
    );
  }
}
