import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/program_details_cubit.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/icon_text_button.dart';

import 'add_to_wish_list_button.dart';

class ProgramDetailsButtons extends StatelessWidget {
  const ProgramDetailsButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProgramDetailsCubit>();
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          left: isEnglish(context) ? 10.w : 64.w,
          right: isEnglish(context) ? 64.w : 10.w,
          top: 10.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddToWishListButton(
              program: cubit.program,
            ),
            10.verticalSpace,
            IconTextButton(
              svgPath: Assets.play,
              text: isEnglish(context) ? 'Watch Video' : 'مشاهدة الفيديو',
              lPadding: 4,
              onTap: () {
                final String videoUrl = context
                    .read<ProgramDetailsCubit>()
                    .state
                    .programDetails!
                    .videoUrl;
                if (videoUrl.isEmpty) {
                  ToastHelper.showErrorToast('No video available');
                  return;
                }
                context.pushNamed(
                  Routes.programVideoPlayer,
                  arguments: videoUrl,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
