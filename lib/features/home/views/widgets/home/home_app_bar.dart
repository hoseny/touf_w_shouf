import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/core/networking/dio_factory.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/core/shared/shared_pref.dart';
import 'package:touf_w_shouf/core/shared/shared_pref_keys.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';
import 'package:touf_w_shouf/features/home/views/manager/home_cubit.dart';

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
        IconButton(
          onPressed: () {
            final String token =
                SharedPref.getString(key: SharedPrefKeys.token);
            final String customerName =
                SharedPref.getString(key: SharedPrefKeys.customerName);
            showDialog(
              context: context,
              builder: (_) => Center(
                child: Container(
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: token.isNotEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          spacing: 8.h,
                          children: [
                            Text(
                              isEnglish(context) ?'Welcome, $customerName' :'اهلا بك $customerName',
                              style: TextStyles.font20BlackMedium,
                            ),
                            AppButton(
                              onPressed: () {
                                SharedPref.removeData(key: SharedPrefKeys.token);
                                SharedPref.removeData(key: SharedPrefKeys.customerName);
                                SharedPref.removeData(key: SharedPrefKeys.customerEmail);
                                SharedPref.removeData(key: SharedPrefKeys.custCode);
                                SharedPref.removeData(key: SharedPrefKeys.telephone);
                                DioFactory.clearAuthToken();
                                ToastHelper.showSuccessToast(
                                  isEnglish(context)
                                      ? 'Logout successfully'
                                      : 'تم تسجيل الخروج بنجاح',
                                );
                                context.pop();
                              },
                              text: isEnglish(context)
                                  ? 'Logout'
                                  : 'تسجيل الخروج',
                              width: 200.w,
                              backgroundColor: AppColors.orange,
                              borderRadius: 12.r,
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          spacing: 8.h,
                          children: [
                            Text(
                              'قم بتسجيل الدخول',
                              style: TextStyles.font20BlackMedium,
                            ),
                            AppButton(
                              onPressed: () {
                                context.pop();
                                context.pushNamed(Routes.loginView);
                              },
                              text: isEnglish(context) ? 'Login' : 'تسجيل الدخول',
                              width: 200.w,
                              backgroundColor: AppColors.orange,
                              borderRadius: 12.r,
                            ),
                          ],
                        ),
                ),
              ),
            );
          },
          icon: Icon(
            Icons.person,
            color: Colors.black,
            size: 32.w,
          ),
        ),
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
