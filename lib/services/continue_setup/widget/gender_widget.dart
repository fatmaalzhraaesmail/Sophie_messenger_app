import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophie_messenger_app/handlers/icon_handler.dart';
import 'package:sophie_messenger_app/services/continue_setup/bloc/cubit.dart';
import 'package:sophie_messenger_app/services/continue_setup/bloc/state.dart';
import 'package:sophie_messenger_app/utilities/theme/text_styles.dart';

class CardGender extends StatelessWidget {
  final int index;
  final String iconSvg;
  final String label;
  CardGender(this.index, this.iconSvg, this.label);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContinueSetupCubit, ContinueSetupState>(
      builder: (context, state) {
        var bloc = ContinueSetupCubit.get(context);
        bool isSelected = index == bloc.selectedIndex;
        return Expanded(
          child: Card(
            elevation: isSelected?4:0.5,
            shadowColor: Colors.grey.shade300,
            color: isSelected?Colors.white:Colors.grey[100],
            child: InkWell(
              onTap: () {
               bloc.selectCard(index);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: isSelected ? Icon(Icons.check_circle_sharp,color:AppTextStyles.maincolor,size: 28,):Icon(Icons.circle,color: Colors.grey[300],size: 27,),
                      
                    ),
                    drawSvgIconColored(
                      iconSvg,
                      width: 50,
                      height: 50,
                    ),
                    Text(label),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
