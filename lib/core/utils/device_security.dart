import 'package:safe_device/safe_device.dart';

abstract class DeviceSecurity {
  // دالة لتتحقق من أمان الجهاز
  static Future<bool> isSafeDevice() async {
    bool isRooted = await SafeDevice.isJailBroken;
    bool isEmulator = !(await SafeDevice.isRealDevice);
    bool isMockLocation = await SafeDevice.isMockLocation;
    bool isOnExternalStorage = await SafeDevice.isOnExternalStorage;
    return !(isRooted ||
        isEmulator ||
        isMockLocation ||
        isOnExternalStorage );
  }
}
