import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Calls/model/call_model.dart';

import '../../../../../../handlers/icon_handler.dart';
import '../../../../../../utilities/theme/media.dart';
import '../../../../../../utilities/theme/text_styles.dart';
import '../../Messages/model/status_model.dart';

class CallsWidget extends StatefulWidget {
  final Calls callsCollection;
  CallsWidget(
    BuildContext context,
    this.callsCollection,
  );

  @override
  State<CallsWidget> createState() => _CallsWidgetState();
}

class _CallsWidgetState extends State<CallsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                    width:double.infinity,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      "${widget.callsCollection.image}",
                    ),
                    maxRadius: 28,
                  ),
                  Positioned(
                      right: -3,
                      bottom: 3,
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          maxRadius: 9,
                          child: CircleAvatar(
                            backgroundColor:
                                widget.callsCollection.userStatus ==
                                        UserStatus.active
                                    ? AppTextStyles.maincolor
                                    : widget.callsCollection.userStatus ==
                                            UserStatus.inactive
                                        ? Colors.grey
                                        : Colors.amber,
                            maxRadius: 6.5,
                          ))),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "${widget.callsCollection.userName}",
                        style: widget.callsCollection.isSeen == true
                            ? AppTextStyles.read
                            : AppTextStyles.unread,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      widget.callsCollection.isSeen == true
                          ? CircleAvatar(
                              backgroundColor: Colors.white,
                              maxRadius: 5,
                            )
                          : CircleAvatar(
                              backgroundColor: AppTextStyles.maincolor,
                              maxRadius: 5)
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  widget.callsCollection.messageType == MessageType.call
                      ? widget.callsCollection.callsStatus == CallsStatus.missed
                          ? Row(
                            children: [
                              Icon(Icons.phone_missed,color: Colors.red,size: 20),
                              SizedBox(width: 5,),
                              Text(
                                  "You Missed ${widget.callsCollection.missedcount} call",
                                  style: TextStyle(color: Colors.red),
                                ),
                            ],
                          )
                          : Row(
                            children: [
                              drawSvgIcon("outgoing",iconColor: AppTextStyles.maincolor,width: 17,height: 17),
                              SizedBox(width: 5,),
                              Text(
                                  "Last called ${widget.callsCollection.lastTime} ago",
                                  style: AppTextStyles.readmessage),
                            ],
                          )
                      : widget.callsCollection.callsStatus == CallsStatus.missed
                          ? Row(
                            children: [
                               Icon(Icons.phone_missed,color: Colors.red,size: 20),
                              SizedBox(width: 5,),
                              Text(
                                  "You Missed ${widget.callsCollection.missedcount} Video call",
                                  style: TextStyle(color: Colors.red),
                                ),
                            ],
                          )
                          : Row(
                            children: [
                                 drawSvgIcon("outgoing",iconColor: AppTextStyles.maincolor,width: 17,height: 17),
                              SizedBox(width: 5,),
                              Text(
                                  "Last called ${widget.callsCollection.lastTime} ago",
                                  style: AppTextStyles.readmessage,
                                ),
                            ],
                          ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {},
                    icon: drawSvgIcon("video",
                        iconColor: AppTextStyles.maincolor),
                  ),
                  IconButton(
                    onPressed: () {},
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: drawSvgIcon("phone",
                        height: 18, width: 18, iconColor: HexColor('#0977fe')),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
