import 'dart:io';

import 'package:app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';

Future<Either<Failure, File>> pickFile() async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );
    if (result != null) {
      File file = File(result.files.single.path!);
      return right(file);
    } else {
      return left(Failure('No File Selected'));
    }
  } catch (e) {
    return left(Failure(e.toString()));
  }
}
