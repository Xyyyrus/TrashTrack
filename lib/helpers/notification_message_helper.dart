import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationMessageHelper {
  static Future<void> showMessageNotification(
    String id,
    String title,
    String body,
  ) async {
    const key = 'notifications';

    final prefs = await SharedPreferences.getInstance();
    final notifications = prefs.getStringList(key) ?? [];

    if (notifications.contains(id)) {
      return;
    }

    bool notifAllowed = prefs.getBool('notifAllowed') ?? false;

    if (notifAllowed) {
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 10,
          channelKey: 'basic_channel',
          title: title,
          body: body,
          notificationLayout: NotificationLayout.BigText,
        ),
      );
    }

    notifications.add(id);
    await prefs.setStringList(key, notifications);
  }
}
