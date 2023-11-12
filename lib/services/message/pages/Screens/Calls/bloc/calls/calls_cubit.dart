import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Calls/model/call_model.dart';

part 'calls_state.dart';

class CallsCubit extends Cubit<CallsState> {
  CallsCubit() : super(CallsInitial());
    static CallsCubit get(context) => BlocProvider.of(context);
  final List Callscollection = Calls.CallsCard();

}
