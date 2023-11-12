import 'package:flutter/material.dart';
import 'package:sophie_messenger_app/handlers/icon_handler.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Groups/model/group_model.dart';
import 'package:sophie_messenger_app/utilities/theme/media.dart';
import 'package:sophie_messenger_app/utilities/theme/text_styles.dart';

class GroupsWidget extends StatefulWidget {
  final Group groupCollection;
  const GroupsWidget(BuildContext context, this.groupCollection);

  @override
  State<GroupsWidget> createState() => _GroupsWidgetState();
}

class _GroupsWidgetState extends State<GroupsWidget> {
  @override
  Widget build(BuildContext context) {
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                drawSvgIcon("star",
                    iconColor: widget.groupCollection.isFavourite == true
                        ? Colors.amber
                        : Colors.grey.shade400),
                SizedBox(
                  width: 5,
                ),
                drawSvgIcon("groupsetting")
              ],
            ),
            Stack(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    "${widget.groupCollection.Groupimage}",
                  ),
                  maxRadius: 35,
                ),
                Positioned(
                    right: -3,
                    bottom: 3,
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        maxRadius: 9.5,
                        child: CircleAvatar(
                          backgroundColor:
                              widget.groupCollection.groupActivity ==
                                      GroupActivity.active
                                  ? AppTextStyles.maincolor
                                  : widget.groupCollection.groupActivity ==
                                          GroupActivity.inactive
                                      ? Colors.grey
                                      : Colors.amber,
                          maxRadius: 6.5,
                        ))),
              ],
            ),
            Text("${widget.groupCollection.title}",
                style: AppTextStyles.w700.copyWith(fontSize: 18)),
            widget.groupCollection.Images!.length == 0
                ? Container()
                : Container(
                    width: 114,
                    alignment: Alignment.center,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                // width: double.infinity,
                                height: 50,
                                child: Stack(
                                  clipBehavior: Clip.antiAlias,
                                  children: List.generate(
                                    widget.groupCollection.Images!
                                        .length, // Number of images you want to display
                                    (index) {
                                      if (index == 4) {
                                        return Positioned(
                                          left: 25.0 * index,
                                          
                                          child: Text(""),
                                        );
                                      } else {
                                        return Positioned(
                                          left: 25.0 * index,
                                          child: TeamMember(
                                              '${widget.groupCollection.Images![index]}'),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget TeamMember(String img) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      

      child: Padding(
        padding: const EdgeInsets.all(1.5),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage(img),
            fit: BoxFit.cover
            ),
      
          ),
          
          width: 38,
          height: 38,
        ),
      ),
    );
  }
}
