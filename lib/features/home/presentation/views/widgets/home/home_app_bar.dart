import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.white,
      leadingWidth: 250.w,
      leading: _buildLeadingActions(context),
      title: Align(
        alignment: Alignment.centerRight,
        child: Image.asset(
          Assets.logo,
          width: 100.w,
          height: 48.h,
        ),
      ),
    );
  }

  /// Builds the menu and profile icon buttons
  Widget _buildLeadingActions(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: Icon(Icons.menu, color: Colors.black, size: 28.w),
        ),
        IconButton(
          onPressed: () => _showAuthDialog(context),
          icon: Icon(Icons.person, color: Colors.black, size: 28.w),
        ),
      ],
    );
  }

  /// Displays a dialog for login or logout based on auth state
  void _showAuthDialog(BuildContext context) {
    final token = SharedPref.getString(key: SharedPrefKeys.token);
    final name = SharedPref.getString(key: SharedPrefKeys.customerName);
    final isLoggedIn = token.isNotEmpty;

    final titleText = isLoggedIn
        ? (isEnglish(context) ? 'Welcome, $name' : 'اهلا بك $name')
        : (isEnglish(context) ? 'Please login' : 'قم بتسجيل الدخول');

    final buttonText = isLoggedIn
        ? (isEnglish(context) ? 'Logout' : 'تسجيل الخروج')
        : (isEnglish(context) ? 'Login' : 'تسجيل الدخول');

    void Function() buttonAction = isLoggedIn
        ? () => _logout(context)
        : () {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(Routes.loginView);
          };

    showDialog(
      context: context,
      builder: (_) => Center(
        child: Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(titleText, style: TextStyles.font20BlackMedium),
              SizedBox(height: 8.h),
              AppButton(
                onPressed: buttonAction,
                text: buttonText,
                width: 200.w,
                backgroundColor: AppColors.orange,
                borderRadius: 12.r,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Clears stored auth data and shows a logout toast
  void _logout(BuildContext context) {
    SharedPref.removeData(key: SharedPrefKeys.token);
    SharedPref.removeData(key: SharedPrefKeys.customerName);
    SharedPref.removeData(key: SharedPrefKeys.customerEmail);
    SharedPref.removeData(key: SharedPrefKeys.custCode);
    SharedPref.removeData(key: SharedPrefKeys.telephone);
    DioFactory.clearAuthToken();
    ToastHelper.showSuccessToast(
      isEnglish(context) ? 'Logout successfully' : 'تم تسجيل الخروج بنجاح',
    );
    Navigator.of(context).pop();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
