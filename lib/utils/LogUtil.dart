class LogUtil {
  static bool isDeBug = true;

  static void e(String tag, String msg) {
    _showLog("LogE", tag, msg);
  }

  static void w(String tag, String msg) {
    _showLog("LogW", tag, msg);
  }

  static void i(String tag, String msg) {
    if (isDeBug) {
      _showLog("LogI", tag, msg);
    }
  }

  static void d(String tag, String msg) {
    if (isDeBug) {
      _showLog("LogD", tag, msg);
    }
  }

  static void _showLog(String level, String tag, String msg) {
    print("Level:" + level + "   Tag:" + tag + "  Message:" + msg);
  }
}
