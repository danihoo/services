import 'package:custom_services/services/notifications/message.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class CloudMessaging {
  void onBackgroundMessage(Future<void> Function(Message message) onMessage) {
    FirebaseMessaging.onBackgroundMessage(
      (message) => onMessage(_transformMessage(message)),
    );
  }

  void onForegroundMessage(Future<void> Function(Message message) onMessage) {
    FirebaseMessaging.onMessage.listen(
      (message) => onMessage(_transformMessage(message)),
    );
  }

  Message _transformMessage(RemoteMessage message) {
    return Message(
      id: message.messageId,
      title: message.notification?.title,
      body: message.notification?.body,
    );
  }
}