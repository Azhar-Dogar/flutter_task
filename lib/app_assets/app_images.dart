class AppImages {

  static String base = "assets/images/";

  static String image1 = getName("image1.png");
  static String electronics = getName("electronics.png");
  static String appliances = getName("appliances.png");
  static String getName(String str) {
    return "$base$str";
  }

}