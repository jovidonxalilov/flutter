import 'package:flutter/cupertino.dart';
import 'package:loggy/71-dars/data/sending_model.dart';
import 'package:loggy/71-dars/manager/notification_servise.dart';
import 'package:provider/provider.dart';

class NotificationProvider with ChangeNotifier{

  final NotificationService _notificationService = NotificationService();
  Future<void> sending(String title) => _notificationService.sending(title);
}