class PhotoGalleryModel {
  final String image;
  final String imgName;

  PhotoGalleryModel({
    required this.image,
    required this.imgName,
  });

  factory PhotoGalleryModel.fromJson(Map<String, dynamic> json) {
    return PhotoGalleryModel(
      image: json['image'] ?? 'No image',
      imgName: json['img_name'] ?? 'No image',
    );
  }
}
