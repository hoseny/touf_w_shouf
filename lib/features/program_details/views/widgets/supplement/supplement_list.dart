import 'package:flutter/material.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/supplement/supplement_list_item.dart';

class SupplementList extends StatelessWidget {
  const SupplementList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return SupplementListItem();
      },
    );
  }
}
