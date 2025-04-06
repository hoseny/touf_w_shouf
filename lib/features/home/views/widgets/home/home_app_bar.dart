import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/features/home/views/manager/home_cubit/home_cubit.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HomeCubit cubit = context.read<HomeCubit>();
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Image.asset(
        Assets.logo,
        width: 100.w,
        height: 48.h,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: TextButton(
            onPressed: () {
              isEnglish(context)
                  ? context.setLocale(
                      const Locale('ar'),
                    )
                  : context.setLocale(
                      const Locale('en'),
                    );
              cubit.getActivePrograms();
            },
            style: TextButton.styleFrom(
              backgroundColor: AppColors.orange,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 6.h,
              ),
            ),
            child: Text(
              isEnglish(context) ? 'العربية' : 'English',
              style: TextStyles.font18WhiteRegular,
            ),
          ),
        ),
      ],
      backgroundColor: AppColors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
