// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:video_player/video_player.dart';
//
// class ImagePickerPage extends StatefulWidget {
//   const ImagePickerPage({super.key});
//
//   @override
//   State<ImagePickerPage> createState() => _ImagePickerPageState();
// }
//
// class _ImagePickerPageState extends State<ImagePickerPage> {
//   String? videoPath;
//   late VideoPlayerController videoPlayer;
//   void chooseImageInGallery() async {
//     XFile? imageFile;
//     imageFile = await ImagePicker().pickVideo(
//       source: ImageSource.camera,
//     );
//     if (imageFile != null) {
//       videoPath = imageFile.path;
//       videoPlayer = VideoPlayerController.file(
//           File(
//             imageFile.path,
//           ),
//           videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true),)
//         ..initialize().then(
//               (value) {
//             videoPlayer.play();
//             videoPlayer.setLooping(false);
//           },
//         );
//       setState(() {});
//     }
//   }
//
//   @override
//   void initState() {
//     videoPlayer = VideoPlayerController.file(
//       File(
//         videoPath ?? "",
//       ),
//     );
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Chose Image"),
//       ),
//       body: Column(
//         children: [
//           DecoratedBox(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: Colors.green,
//             ),
//             child: SizedBox(
//               width: double.maxFinite,
//               height: 200,
//               child: videoPath == null
//                   ? Text("Rasm tanlang")
//                   : Stack(
//                 children: [
//                   VideoPlayer(
//                     videoPlayer,
//                   ),
//                   IconButton(
//                       onPressed: () {
//                         !videoPlayer.value.isPlaying
//                             ? videoPlayer.play()
//                             : videoPlayer.pause();
//                       },
//                       icon: Icon(
//                         videoPlayer.value.isPlaying
//                             ? Icons.play_arrow_rounded
//                             : Icons.pause_circle_rounded,
//                       ))
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 80,
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 chooseImageInGallery();
//               },
//               child: Text("Chose Imgae"))
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:loggy/67-dars/data/image_provider.dart';
import 'package:loggy/core/color/app_colors.dart';
import 'package:provider/provider.dart';

class ImagePickerDetail extends StatelessWidget {
  const ImagePickerDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back,
        ),
        title: Center(child: Text("Aprel")),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.arrow_forward_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Text("Umumiy Xarajatlar"),
          SizedBox(
            height: 100,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    40,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 130,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightGreenAccent,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(
                            40,
                          ),
                        ),
                      ),
                      child: Consumer<ImagePickedProvider>(
                        builder: (context, expenseProvider, _) {
                          final expenses = expenseProvider.expenses;
                          return ListView.builder(
                            itemCount: expenses.length,
                            itemBuilder: (context, index) {
                              final e = expenses[index];
                              return ListTile(
                                titleTextStyle: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                subtitleTextStyle: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                title: Text(e.image as String),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: Consumer<ImagePickedProvider>(
          builder: (context, value, child) {
            return FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {

                // value.addImage();
              },
              child: Icon(
                Icons.add,
                size: 30,
                color: Colors.black,
              ),
            );
          }
        ),
      ),
    );
  }
}
