import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/supplements_cubit/supplements_cubit.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/supplement/supplement_list_item.dart';

class SupplementList extends StatelessWidget {
  const SupplementList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.read<SupplementsCubit>().state as SupplementsSuccess;
    return state.supplements.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: state.supplements.length,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return SupplementListItem(
                supplement: state.supplements[index],
              );
            },
          )
        : SizedBox(
            height: 100.w,
            child: Center(
              child: Text(
                isEnglish(context) ? 'No Supplements' : 'لا يوجد اضافات',
                style: TextStyles.font18OrangeMedium,
              ),
            ),
          );
  }
}
