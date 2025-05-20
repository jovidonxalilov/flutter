import 'package:flutter/material.dart';
import 'package:loggy/core/color/app_colors.dart';

class ShowNotificationDetail extends StatelessWidget {
  const ShowNotificationDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          "Show Notification",
          style: TextStyle(
            color: AppColors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


        ],
      ),
    );
  }
}


// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
// import 'package:image_picker/image_picker.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   File? _imageFile;
//
//   Future<void> _pickImage() async {
//     final picedFile = await ImagePicker().pickImage(
//       source: ImageSource.camera,
//     );
//     if (picedFile != null) {
//       setState(() {
//         _imageFile = File(picedFile.path);
//       });
//       _processImage();
//     }
//   }
//
//   Future<void> _processImage() async {
//     final inputImage = InputImage.fromFilePath(_imageFile!.path);
//     final textRecognizer = TextRecognizer();
//     final RecognizedText recognizedText = await textRecognizer.processImage(
//       inputImage,
//     );
//     String extractedText = recognizedText.text;
//     print(extractedText);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               _imageFile == null
//                   ? const Text('Select an image to analyze')
//                   : Image.file(_imageFile!),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _pickImage,
//         child: const Icon(Icons.document_scanner_outlined),
//       ),
//     );
//   }
// }
