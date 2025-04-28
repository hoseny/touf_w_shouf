import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:printing/printing.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/routing/args_model/pdf_args_model.dart';

class PdfPreviewScreen extends StatelessWidget {
  final PdfArgsModel pdfModel;

  const PdfPreviewScreen({super.key, required this.pdfModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Pdf Preview',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
          ),
        ),
      ),
      body: PdfPreview(
        build: (format) => pdfModel.pdf.save(),
        actionBarTheme: const PdfActionBarTheme(
          backgroundColor: Color(0xFF292A2D),
          elevation: 0,
        ),
        canChangePageFormat: false,
        canChangeOrientation: false,
        canDebug: false,
        pdfFileName: '${pdfModel.pdfName}.pdf',
        loadingWidget: const CircularProgressIndicator(
          color: Color(0xFF292A2D),
        ),
        pdfPreviewPageDecoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 4),
            ),
          ],
        ),
      ),
    );
  }
}
