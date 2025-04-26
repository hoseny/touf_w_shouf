import 'package:flutter/material.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/core/shared/shared_pref.dart';
import 'package:touf_w_shouf/core/shared/shared_pref_keys.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset(
              Assets.logo,
            ),
          ),
          ListTile(
            title: Text(
              'My Reservations',
              style: TextStyles.font16BlackMedium,
            ),
            onTap: () {
              final int? custCode = SharedPref.getInt(key: SharedPrefKeys.custCode);
              if (custCode != null) {
                context.pushNamed(Routes.myReservations);
              } else {
                context.pushNamed(Routes.loginView);
              }
            },
          ),
          ListTile(
            title: Text(
              'Contact Us',
              style: TextStyles.font16BlackMedium,
            ),
            onTap: () {
              context.pushNamed(Routes.contactUs);
            },
          ),
          ListTile(
            title: Text(
              'Complaints & Suggestions',
              style: TextStyles.font16BlackMedium,
            ),
            onTap: () {
              context.pushNamed(Routes.complaint);
            },
          ),
        ],
      ),
    );
  }
}
