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

final class InsertReviewLoading extends ReviewState {}

final class InsertReviewSuccess extends ReviewState {
  final String message;

  InsertReviewSuccess(this.message);
}

final class InsertReviewFailure extends ReviewState {
  final String errorMessage;

  InsertReviewFailure(this.errorMessage);
}
final class AutoValidateUpdated extends ReviewState {}
