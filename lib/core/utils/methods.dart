import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:movies_app/cubit/theme/theme_cubit.dart';
import 'package:movies_app/feuters/auth/presentation/view/widgets/alert_text_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class Methods {
  List<BoxShadow> ButtonShadow(BuildContext context) {
    return BlocProvider.of<ThemeCubit>(context).GetIsDarkTheme
        ? []
        : [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: Offset(0, 1),
              blurRadius: 5,
            ),
          ];
  }

  static LinearGradient ButtomsColors() {
    return const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xffffbb3b),
          Color(0xffffa90b),
        ]);
  }

  Future<void> alertDialogPick(
      {required BuildContext context,
      VoidCallback? onCamera,
      VoidCallback? onGallery,
      VoidCallback? onRemove}) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Center(
              child: Text('Choose option'),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AlertTextTile(
                  title: 'Camera',
                  icon: IconlyLight.camera,
                  onTap: onCamera,
                ),
                AlertTextTile(
                  title: 'Gallery',
                  icon: IconlyLight.image,
                  onTap: onGallery,
                ),
                AlertTextTile(
                  title: 'Remove',
                  icon: IconlyLight.delete,
                  onTap: onRemove,
                ),
              ],
            ),
          );
        });
  }

  Future<XFile> compressImage(String path, int quality) async {
    final newPath = p.join((await getTemporaryDirectory()).path,
        '${DateTime.now()}.${p.extension(path)}');
    final result = await FlutterImageCompress.compressAndGetFile(
      path,
      newPath,
      quality: quality,
    );
    return result!;
  }

  Future<String?> uploadFile(String? path) async {
    final ref = await FirebaseStorage.instance
        .ref()
        .child('images')
        .child('${DateTime.now().toIso8601String() + p.basename(path!)}');

    if (path != '') {
      final result = await ref.putFile(
        File(path),
        SettableMetadata(contentType: 'image/png'),
      );
      final resultUrl = await result.ref.getDownloadURL();
      return resultUrl;
    }
    return null;
  }
}
