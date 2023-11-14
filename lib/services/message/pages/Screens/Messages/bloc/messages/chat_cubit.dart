import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Messages/bloc/messages/chat_state.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Messages/constant/message_constant.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Messages/model/chat_model.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitialState());
  static ChatCubit get(context) => BlocProvider.of(context);
  List<Message> messagesList = [];
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);

  void sendMessage({required String message, required String email}) async {
    try {
      await messages
          .add({kMessage: message, kCreatedAt: DateTime.now(), 'id': email});
    } on Exception catch (e) {
      print("error $e");
    }
  }

  getMessages(){
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      messagesList.clear();
      for (var doc in event.docs) {
        messagesList.add(Message.fromJson(doc));
      }
       emit(ChatSuccessState(messages: messagesList));
    });
   

    return messagesList;
  }
}
