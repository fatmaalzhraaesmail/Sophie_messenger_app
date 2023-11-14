import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sophie_messenger_app/handlers/icon_handler.dart';
import 'package:sophie_messenger_app/handlers/shared_handler.dart';
import 'package:sophie_messenger_app/routers/navigator.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Messages/bloc/messages/chat_cubit.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Messages/bloc/messages/chat_state.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Messages/model/chat_model.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Messages/widgets/chat_buble.dart';
import 'package:sophie_messenger_app/utilities/theme/text_styles.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  double _textFieldHeight = 50.0;
  final double _maxTextFieldHeight = 200.0;

  @override
  void dispose() {
    // Dispose the text editing controller when the screen is disposed
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var email = SharedHandler.instance!
        .getData(key: 'userEmail', valueType: ValueType.string);
    return BlocProvider<ChatCubit>(
      create: (context) => ChatCubit()..getMessages(),
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {
          if (state is ChatSuccessState) {}
        },
        builder: (context, state) {
          List<Message> messagesList = context.read<ChatCubit>().getMessages();
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  InkWell(
                    onTap: () {
                      CustomNavigator.pop();
                    },
                    child: Icon(Icons.arrow_back, size: 32, weight: 10),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fatma Alzhraa",
                        style: AppTextStyles.appBar.copyWith(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Active Now",
                        style: AppTextStyles.w400.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              centerTitle: false,
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  onPressed: () {},
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  enableFeedback: false,
                  icon: drawSvgIcon(
                    "phone",
                    iconColor: Colors.white,
                    width: 22,
                    height: 22,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  enableFeedback: false,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: drawSvgIcon(
                    "video",
                    iconColor: Colors.white,
                    width: 28,
                    height: 28,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  enableFeedback: false,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: drawSvgIcon(
                    "information",
                    iconColor: Colors.white,
                    width: 28,
                    height: 28,
                  ),
                ),
              ],
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              reverse: true,
                              itemBuilder: (context, index) {
                                return messagesList[index].id == email
                                    ? ChatBuble(
                                        message: messagesList[index],
                                      )
                                    : ChatBubleForFriend(
                                        message: messagesList[index]);
                              },
                              itemCount: messagesList.length,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            String message = _textEditingController.text.trim();
                            if (message.isNotEmpty) {
                              BlocProvider.of<ChatCubit>(context).sendMessage(
                                message: message,
                                email: email,
                              );
                              setState(() {
                                _textEditingController.clear();
                              });
                            }
                          },
                          child: CircleAvatar(
                            maxRadius: 26,
                            backgroundColor: HexColor('#f2f2f4'),
                            child: Icon(
                              Icons.add,
                              color: AppTextStyles.maincolor,
                              size: 26,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: HexColor('#f2f2f4'),
                            ),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: _maxTextFieldHeight,
                              ),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                height: _textFieldHeight,
                                child: Stack(
                                  children: [
                                    TextField(
                                      controller: _textEditingController,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      minLines: 2,
                                      decoration: InputDecoration(
                                        hintText: "Type your message",
                                        hintStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey,
                                        ),
                                        alignLabelWithHint: true,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 15,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                              color: HexColor('#f2f2f6')),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                              color: HexColor('#f2f2f6')),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                              color: HexColor('#f2f2f6')),
                                        ),
                                        fillColor: HexColor('#f2f2f4'),
                                        filled: true,
                                      ),
                                      onChanged: (value) {
                                        final numberOfLines =
                                            '\n'.allMatches(value).length + 1;
                                        final newHeight =
                                            numberOfLines * 24.0 + 18.0;
                                        setState(() {
                                          _textFieldHeight = newHeight.clamp(
                                              50.0, _maxTextFieldHeight);
                                        });
                                      },
                                      textInputAction: TextInputAction.newline,
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      onSubmitted: (data) {
                          
                                      },
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            right: 10.0, bottom: 10.0),
                                        child: Icon(
                                          Icons.emoji_emotions,
                                          size: 34,
                                          color: AppTextStyles.maincolor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
