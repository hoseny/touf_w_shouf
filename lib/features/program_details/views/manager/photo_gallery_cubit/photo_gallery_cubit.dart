
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/home/data/models/program_model.dart';
import 'package:touf_w_shouf/features/program_details/data/models/photo_gallery_model.dart';
import 'package:touf_w_shouf/features/program_details/data/repos/program_details_repo_impl.dart';

part 'photo_gallery_state.dart';

class PhotoGalleryCubit extends Cubit<PhotoGalleryState> {
  PhotoGalleryCubit(this.programDetailsRepo, this.program) : super(PhotoGalleryInitial());
  final ProgramDetailsRepoImpl programDetailsRepo;
  final ProgramModel program;

  Future<void> getPhotoGallery() async {
    emit(PhotoGalleryLoading());
    final result = await programDetailsRepo.getPhotoGallery(
      programCode: program.code.toString(),
      programYear: program.programYear.toString(),
    );
    result.fold(
      (failure) => emit(PhotoGalleryFailure(failure.message)),
      (photoGallery) => emit(PhotoGallerySuccess(photoGallery)),
    );
  }
}
