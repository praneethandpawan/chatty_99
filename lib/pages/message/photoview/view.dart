import 'dart:developer';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:chatty/common/values/colors.dart';
import 'package:chatty/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import '../../../Image_Text/img-text.dart';
import 'controller.dart';
import 'package:photo_view/photo_view.dart';

class PhotoImgViewPage extends GetView<PhotoImgViewController> {

  AppBar _buildAppBar() {
    return AppBar(
        bottom: PreferredSize(
            child: Container(
              color: AppColors.secondaryElement,
              height: 2.0,
            ),
            preferredSize: Size.fromHeight(1.0)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "PhotoView",
              style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
            // IconButton(
            //     icon: Icon(
            //       PhosphorIcons.scan,
            //       size: 28.0,
            //     ),
            //     onPressed: ()
            //     {
            //       imagePickerModal(context, onCameraTap: () {
            //         log("Camera");
            //         pickImage(source: ImageSource.camera).then((value) {
            //           if (value != '') {
            //             imageCropperView(value, context).then((value) {
            //               if (value != '') {
            //                 Navigator.push(
            //                   context,
            //                   CupertinoPageRoute(
            //                     builder: (_) => RecognizePage(
            //                       path: value,
            //                     ),
            //                   ),
            //                 );
            //               }
            //             });
            //           }
            //         });
            //       }, onGalleryTap: () {
            //         log("Gallery");
            //         pickImage(source: ImageSource.gallery).then((value) {
            //           if (value != '') {
            //             imageCropperView(value, context).then((value) {
            //               if (value != '') {
            //                 Navigator.push(
            //                   context,
            //                   CupertinoPageRoute(
            //                     builder: (_) => RecognizePage(
            //                       path: value,
            //                     ),
            //                   ),
            //                 );
            //               }
            //             });
            //           }
            //         });
            //       });
            //     },
            // )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.white,
      body: Container(
          child: PhotoView(
            imageProvider: NetworkImage(controller.state.url.value),
          )
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {

        },

        tooltip: 'Increment',
        label: const Text("Scan photo"),
      ),
    );
  }


}
