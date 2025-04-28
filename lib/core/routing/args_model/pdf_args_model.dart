import 'package:pdf/widgets.dart' as pw;

class PdfArgsModel{
  final pw.Document pdf;
  final String pdfName;

  PdfArgsModel({required this.pdf, required this.pdfName});
}