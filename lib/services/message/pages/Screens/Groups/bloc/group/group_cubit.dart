import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Groups/model/group_model.dart';

part 'group_state.dart';

class GroupCubit extends Cubit<GroupState> {
  GroupCubit() : super(GroupInitial());
  static GroupCubit get(context) => BlocProvider.of(context);
 List<Group> Groupscollection = Group.GroupCard();

}
