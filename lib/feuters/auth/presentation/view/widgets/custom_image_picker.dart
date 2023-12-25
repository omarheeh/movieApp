import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movies_app/core/utils/methods.dart';
import 'package:movies_app/cubit/theme/theme_cubit.dart';
import 'package:movies_app/feuters/auth/presentation/view_model/auth_cubit/auth_cubit.dart';

class CustomImagePicker extends StatefulWidget {
  const CustomImagePicker({
    super.key,
  });
  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  XFile? xFile;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            await Methods().alertDialogPick(
              context: context,
              onCamera: () async {
                await pickFunction(ImageSource.camera);

                setState(() {
                  if (xFile != null) {
                    BlocProvider.of<AuthCubit>(context)
                        .setAvatarPath(xFile!.path);
                  }
                });
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              onGallery: () async {
                await pickFunction(ImageSource.gallery);
                setState(() {
                  if (xFile != null) {
                    BlocProvider.of<AuthCubit>(context)
                        .setAvatarPath(xFile!.path);
                  }
                });
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              onRemove: () {
                setState(() {
                  xFile = null;
                  BlocProvider.of<AuthCubit>(context).setAvatarPath(null);
                });
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
            );
          },
          child: Container(
            width: 100,
            height: 100,
            decoration: ShapeDecoration(
              shape: CircleBorder(),
              color: Theme.of(context).cardColor,
              shadows: BlocProvider.of<ThemeCubit>(context).GetIsDarkTheme
                  ? []
                  : [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                      ),
                    ],
            ),
            child: xFile == null
                ? GestureDetector(
                    child: Image.asset('assets/images/user.png'),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.file(
                      File(xFile!.path),
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Add profile picture',
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Future<void> pickFunction(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    var pickerImage = await picker.pickImage(source: source, imageQuality: 50);
    xFile = pickerImage;
    if (xFile == null) {
      return;
    }
    var file = await ImageCropper().cropImage(
        sourcePath: pickerImage!.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1));
    if (file == null) {
      return;
    }
    xFile = await Methods().compressImage(file.path, 35);
  }
}
