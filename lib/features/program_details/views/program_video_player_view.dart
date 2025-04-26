import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:video_player/video_player.dart';

class ProgramVideoPlayer extends StatefulWidget {
  const ProgramVideoPlayer({super.key, required this.videoUrl});

  final String videoUrl;

  @override
  State<ProgramVideoPlayer> createState() => _ProgramVideoPlayerState();
}

class _ProgramVideoPlayerState extends State<ProgramVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  Future<void> _initializeVideoPlayer() async {
    try {
      _videoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
      await _videoPlayerController.initialize();

      setState(() {
        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController,
          autoPlay: true,
          looping: true,
          aspectRatio: _videoPlayerController.value.aspectRatio,
          materialProgressColors: ChewieProgressColors(
            playedColor: AppColors.orange,
            handleColor: AppColors.orange,
            backgroundColor: Colors.grey[700]!,
            bufferedColor: Colors.grey,
          ),
          cupertinoProgressColors: ChewieProgressColors(
            playedColor: AppColors.orange,
            handleColor: AppColors.orange,
            backgroundColor: Colors.grey[700]!,
            bufferedColor: Colors.grey,
          ),
          showOptions: false,
        );
      });
    } catch (e) {
      setState(() {
        _isError = true;
      });
      log('Error loading video: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Watch Video',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
          ),
        ),
      ),
      body: Center(
        child: _isError
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10.h,
                children: [
                  Icon(Icons.error, color: AppColors.orange, size: 50.sp),
                  Text(
                    'Failed to load video.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              )
            : _chewieController != null &&
                    _chewieController!.videoPlayerController.value.isInitialized
                ? Chewie(
                    controller: _chewieController!,
                  )
                : const CircularProgressIndicator(
                    color: AppColors.orange,
                  ),
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
}
