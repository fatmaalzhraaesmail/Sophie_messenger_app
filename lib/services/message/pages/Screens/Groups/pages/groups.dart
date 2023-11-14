import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Groups/bloc/group/group_cubit.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Groups/wigets/group_widget.dart';
import 'package:sophie_messenger_app/utilities/theme/media.dart';
import 'package:sophie_messenger_app/utilities/theme/text_styles.dart';

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GroupCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
                         width:double.infinity,

            height: MediaHelper.height,
            child: BlocConsumer<GroupCubit, GroupState>(
              listener: (context, state) {},
              builder: (context, state) {
                var bloc = context.read<GroupCubit>();
                return Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),

                        padding: EdgeInsets.symmetric(
                            vertical: 14, horizontal: 15),
                        itemCount: bloc.Groupscollection.length+1,
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 2.1 / 2.4,
                          crossAxisCount: 2,
                          crossAxisSpacing: 15.0,
                          mainAxisSpacing: 15.0,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return Container(
                              width: MediaHelper.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 1.4,
                                      offset: Offset(1, 2),
                                    ),
                                  ]),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.grey.shade300,
                                    maxRadius: 38,
                                    child: Icon(Icons.add,
                                        color: Colors.grey.shade600,
                                        size: 28),
                                  ),
                                  SizedBox(height: 10,),
                                  Text("Create New",style: AppTextStyles.w700.copyWith(fontSize: 19),),
                                ],
                              ),
                            );
                          } else {
                            return GroupsWidget(
                              context,
                              bloc.Groupscollection[index - 1],
                            );
                          }
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
