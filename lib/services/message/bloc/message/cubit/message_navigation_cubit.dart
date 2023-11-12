import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'message_navigation_state.dart';

class MessageNavigationCubit extends Cubit<MessageNavigationState> {
  MessageNavigationCubit() : super(MessageNavigationInitial());
  static MessageNavigationCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<String> appBar = [
    "ALL Chat",
    "All Groups",
    "ALL Calls",
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeMessageNavBarState(currentIndex));
  }
}