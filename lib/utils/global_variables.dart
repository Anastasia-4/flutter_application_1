class GlobalVariables {
  static bool canDelete = false;
  static int selectedTimer = 0;
  static int finalDevicesCount = 5;
  static int selectedIP = -1;
  static String selectedIP_text = "";
  
  static change(bool value){
    canDelete = value;
  }

    static changeTimer(int value){
    selectedTimer = value;
  }
}