part of 'photo_gallery_cubit.dart';

@immutable
sealed class PhotoGalleryState {}

final class PhotoGalleryInitial extends PhotoGalleryState {}
final class PhotoGalleryLoading extends PhotoGalleryState {}
final class PhotoGallerySuccess extends PhotoGalleryState {
  final List<PhotoGalleryModel> photos;

  PhotoGallerySuccess(this.photos);
}
final class PhotoGalleryFailure extends PhotoGalleryState {
  final String errorMessage;

  PhotoGalleryFailure(this.errorMessage);
}
