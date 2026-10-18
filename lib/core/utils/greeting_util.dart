class GreetingUtil {
  static String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 4 && hour < 11) {
      return 'Ohayou gozaimasu';
    } else if (hour >= 11 && hour < 15) {
      return 'Konnichiwa';
    } else if (hour >= 15 && hour < 18) {
      return 'Konnichiwa';
    } else {
      return 'Konbanwa';
    }
  }
}