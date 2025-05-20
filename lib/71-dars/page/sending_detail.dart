import 'package:flutter/material.dart';
import 'package:loggy/71-dars/manager/notification_provider.dart';
import 'package:loggy/core/color/app_colors.dart';
import 'package:provider/provider.dart';

class SendingDetail extends StatelessWidget {
  SendingDetail({super.key});
  final TextEditingController _sendController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.read<NotificationProvider>();
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "Sending",
          style: TextStyle(
            color: AppColors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 50,
              child: TextFormField(
                controller: _sendController,
                decoration: InputDecoration(
                  labelText: "Malumotni kiriting",
                  labelStyle: TextStyle(color: AppColors.black, fontSize: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green
              ),
              onPressed: () {
                if (_sendController.text.isNotEmpty) {
                  provider.sending(_sendController.text.trim());
                  _sendController.clear();
                }
              },
              child: Center(
                child: Text(
                  "Yuborish",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
