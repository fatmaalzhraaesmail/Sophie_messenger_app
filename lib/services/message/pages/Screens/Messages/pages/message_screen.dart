import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Messages/bloc/messages/chat_cubit.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Messages/bloc/messages/messages_cubit.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Messages/bloc/status/status_cubit.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Messages/widgets/message_widget.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Messages/widgets/status_widget.dart';
import 'package:sophie_messenger_app/utilities/theme/media.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StatusCubit(),
        ),
        BlocProvider(
          create: (context) => MessagesCubit(),
        ),
        BlocProvider(
          create: (context) => ChatCubit(),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              width:double.infinity,
              height: MediaHelper.height,
              child: Column(
                children: [
                
                  BlocConsumer<StatusCubit, StatusState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      var bloc = context.read<StatusCubit>();
                      return Container(
                        height: 75,


                        width: double.infinity,
                        margin: EdgeInsets.only(top: 8, bottom: 2, left: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    if (index == 0) {
                                      return CircleAvatar(
                                        backgroundColor: Colors.grey.shade300,
                                        maxRadius: 32,
                                        child: Icon(Icons.add,
                                            color: Colors.grey.shade600,
                                            size: 28),
                                      );
                                    } else {
                                      return StatusWidget(context,
                                          bloc.Statuscollection[index - 1]);
                                    }
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(width: 6);
                                  },
                                  itemCount: bloc.Statuscollection.length),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  
                  Expanded(
                    child: BlocConsumer<MessagesCubit, MessagesState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        var bloc = context.read<MessagesCubit>();
                        return Container(
                          height: double.infinity,
                          width: double.infinity,
                         
                          child: Row(
                            children: [
                              Expanded(
                                child: ListView.separated(
                                    scrollDirection: Axis.vertical,
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      
                                        return MessageWidget(context,
                                            bloc.Messagescollection[index ],);
                                      
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(width: 6);
                                    },
                                    itemCount: bloc.Messagescollection.length),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
