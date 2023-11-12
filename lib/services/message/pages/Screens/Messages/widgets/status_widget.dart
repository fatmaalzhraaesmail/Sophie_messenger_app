import 'package:flutter/material.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Messages/model/status_model.dart';

import '../../../../../../utilities/theme/text_styles.dart';
class StatusWidget extends StatefulWidget {
      final Status statuscollection;

   StatusWidget(BuildContext context,
    this.statuscollection,);
  
  @override
  State<StatusWidget> createState() => _StatusWidgetState();
}

class _StatusWidgetState extends State<StatusWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
    children: [
      Container(
        height: 75,
        width: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            style: BorderStyle.solid,
            width:widget.statuscollection.isSeen==true?2:2.5, color: widget.statuscollection.isSeen==true?Colors.grey.shade400:AppTextStyles.maincolor),
        ),
        child: Container(
          margin:widget.statuscollection.isSeen==true?EdgeInsets.all(1) :EdgeInsets.all(2.4),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(
                    "${widget.statuscollection.image}",
                  ),
                  fit: BoxFit.cover)),
        ),
      ),
     widget. statuscollection.userStatus==UserStatus.live?Positioned(
        bottom: 1,
        left: 12,
        child: Container(

        decoration: BoxDecoration(
          color: Colors.red[400],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          child: Text("Live",style: AppTextStyles.w300.copyWith(fontSize: 15),),
        ),
      )):
      Positioned(
          right: -2,
          bottom: 10,
          child: CircleAvatar(
              backgroundColor: Colors.white,
              maxRadius: 9,
              child: CircleAvatar(
                backgroundColor: widget.statuscollection.userStatus==UserStatus.active?AppTextStyles.maincolor:widget.statuscollection.userStatus==UserStatus.inactive?Colors.grey:Colors.amber,
                maxRadius: 6.5,
              ))),
    ],
  );

  }
}


