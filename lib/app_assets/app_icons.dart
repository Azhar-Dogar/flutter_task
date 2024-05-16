class AppIcons {
  static String base = "assets/icons/";

  static String home = getName("home.png");
  static String search = getName("search.png");
  static String work = getName("work.png");
  static String offer = getName("offer_icon.png");
  static String profile = getName("profile.png");
  static String chat = getName("chat_icon.png");
  static String like = getName("like_icon.png");
  static String profileIcon = getName("profile_icon.png");
  static String share = getName("share_icon.png");
  static String flag = getName("flag_icon.png");
  static String getName(String str) {
    return "$base$str";
  }
}
