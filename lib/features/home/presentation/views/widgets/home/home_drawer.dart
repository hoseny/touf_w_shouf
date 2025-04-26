import 'package:flutter/material.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';

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
              context.pushNamed(Routes.myReservations);
            },
          ),
          ListTile(
            title: Text(
              'Contact Us',
              style: TextStyles.font16BlackMedium,
            ),
          ),
          ListTile(
            title: Text(
              'Complaints & Suggestions',
              style: TextStyles.font16BlackMedium,
            ),
          ),
        ],
      ),
    );
  }
}
