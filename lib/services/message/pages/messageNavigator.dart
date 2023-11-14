import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Calls/pages/calls.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Groups/pages/groups.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Messages/bloc/messages/chat_cubit.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Messages/pages/message_screen.dart';
import 'package:sophie_messenger_app/utilities/theme/text_styles.dart';

import '../bloc/message/cubit/message_navigation_cubit.dart';

class MessageNavigatorScreen extends StatefulWidget {
  @override
  State<MessageNavigatorScreen> createState() => _MessageNavigatorScreenState();
}

class _MessageNavigatorScreenState extends State<MessageNavigatorScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MessageNavigationCubit(),
        ),
        BlocProvider(
          create: (context) => ChatCubit(),
        ),
      ],
      child: BlocConsumer<MessageNavigationCubit, MessageNavigationState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = context.read<MessageNavigationCubit>();
          var index = cubit.currentIndex;
          return DefaultTabController(
            length: cubit.appBar.length,
            initialIndex: index,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: false,
                automaticallyImplyLeading: false,
                title: Text(
                  cubit.appBar[index],
                  style: AppTextStyles.appBar.copyWith(fontSize: 28),
                ),
                bottom: TabBar(
                    indicatorWeight: 3,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 12),
                    labelPadding: EdgeInsets.symmetric(horizontal: 20),
                    tabAlignment: TabAlignment.fill,
                    physics: BouncingScrollPhysics(),
                    splashBorderRadius: BorderRadius.circular(1),
                    overlayColor: MaterialStatePropertyAll(Colors.transparent),
                    tabs: <Tab>[
                      Tab(
                        child: Row(
                          children: [
                            Text("Message", style: AppTextStyles.w400),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.circle,
                              size: 10,
                            ),
                          ],
                        ),
                      ),
                      Tab(
                        child: Text("Group", style: AppTextStyles.w400),
                      ),
                      Tab(
                        child: Text("Calls", style: AppTextStyles.w400),
                      ),
                    ]),
                // ...rest of your AppBar code...
              ),
              body: TabBarView(
                children: <Widget>[
                  MessageScreen(),
                  GroupsScreen(),
                  CallsScreen(),
                ],
              ),
              // ...rest of your Scaffold code...
            ),
          );
        },
      ),
    );
  }
}
