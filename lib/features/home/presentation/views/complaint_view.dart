import 'package:flutter/material.dart';
import 'package:touf_w_shouf/features/home/presentation/views/widgets/complaint/complaint_body.dart';

class ComplaintView extends StatelessWidget {
  const ComplaintView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: ComplaintBody()),
    );
  }
}
