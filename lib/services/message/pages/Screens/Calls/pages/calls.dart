import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Calls/bloc/calls/calls_cubit.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Calls/model/call_model.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Calls/widgets/calls_widget.dart';

import '../../../../../../utilities/theme/media.dart';

class CallsScreen extends StatefulWidget {
  const CallsScreen({super.key});

  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(
          create: (context) => CallsCubit(),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              width: MediaHelper.width,
              height: MediaHelper.height,
              child: Column(
                children: [
                
                  
                  Expanded(
                    child: BlocConsumer<CallsCubit, CallsState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        var bloc = context.read<CallsCubit>();
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
                                      
                                        return CallsWidget(context,
                                            bloc.Callscollection[index ],);
                                      
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(width: 6);
                                    },
                                    itemCount: bloc.Callscollection.length),
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