import 'package:flutter/material.dart';
import 'package:touf_w_shouf/features/home/presentation/views/widgets/contact_us/contact_us_body.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: ContactUsBody()),
    );
  }
}
