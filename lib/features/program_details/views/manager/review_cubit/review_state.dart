part of 'review_cubit.dart';

@immutable
sealed class ReviewState {}

final class ReviewInitial extends ReviewState {}

final class ReviewLoading extends ReviewState {}

final class ReviewSuccess extends ReviewState {
  final List<ReviewModel> reviews;

  ReviewSuccess(this.reviews);
}

final class ReviewFailure extends ReviewState {
  final String errorMessage;

  ReviewFailure(this.errorMessage);
}
