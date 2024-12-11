import 'package:flutter/material.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/reviews/review_list_item.dart';

class ReviewsList extends StatelessWidget {
  const ReviewsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return ReviewListItem(index: index,);
      },
    );
  }
}
