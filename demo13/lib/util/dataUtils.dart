import 'package:demo13/model/userInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataUtils {
  static const String SP_AC_TOKEN = "accessToken";
  static const String SP_RE_TOKEN = "refreshToken";
  static const String SP_UID = "uid";
  static const String SP_IS_LOGIN = "isLogin";
  static const String SP_EXPIRES_IN = "expiresIn";
  static const String SP_TOKEN_TYPE = "tokenType";

  static const String SP_USER_NAME = "name";
  static const String SP_USER_ID = "id";
  static const String SP_USER_LOC = "location";
  static const String SP_USER_GENDER = "gender";
  static const String SP_USER_AVATAR = "avatar";
  static const String SP_USER_EMAIL = "email";
  static const String SP_USER_URL = "url";

  static const String SP_COLOR_THEME_INDEX = "colorThemeIndex";

  // 保存用户登录信息，data中包含了token等信息
  static saveLoginInfo(Map data) async {
    if (data.isNotEmpty) {
      SharedPreferences sp = await SharedPreferences.getInstance();
      String accessToken = data['access_token'];
      await sp.setString(SP_AC_TOKEN, accessToken);

      String refreshToken = data['refresh_token'];
      await sp.setString(SP_RE_TOKEN, refreshToken);

      int uid = data['uid'];
      await sp.setInt(SP_UID, uid);

      String tokenType = data['tokenType'];
      await sp.setString(SP_TOKEN_TYPE, tokenType);

      int expiresIn = data['expires_in'];
      await sp.setInt(SP_EXPIRES_IN, expiresIn);

      await sp.setBool(SP_IS_LOGIN, true);
    }
  }

  // 清除登录信息
  static clearLoginInfo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString(SP_AC_TOKEN, "");
    await sp.setString(SP_RE_TOKEN, "");
    await sp.setInt(SP_UID, -1);
    await sp.setString(SP_TOKEN_TYPE, "");
    await sp.setInt(SP_EXPIRES_IN, -1);
    await sp.setBool(SP_IS_LOGIN, false);
    //为什么不用 sp.clear() ????
    //await sp.clear();
  }

  // 保存用户个人信息
  static Future<UserInfo?> saveUserInfo(Map data) async {
    if (data.isNotEmpty) {
      SharedPreferences sp = await SharedPreferences.getInstance();
      String name = data['name'];
      int id = data['id'];
      String gender = data['gender'];
      String location = data['location'];
      String avatar = data['avatar'];
      String email = data['email'];
      String url = data['url'];
      await sp.setString(SP_USER_NAME, name);
      await sp.setInt(SP_USER_ID, id);
      await sp.setString(SP_USER_GENDER, gender);
      await sp.setString(SP_USER_AVATAR, avatar);
      await sp.setString(SP_USER_LOC, location);
      await sp.setString(SP_USER_EMAIL, email);
      await sp.setString(SP_USER_URL, url);
      UserInfo userInfo = UserInfo(
          id: id,
          gender: gender,
          name: name,
          location: location,
          avatar: avatar,
          email: email,
          url: url);
      return userInfo;
    }
    return null;
  }

  // 获取用户信息
  static Future<UserInfo?> getUserInfo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool? isLogin = sp.getBool(SP_IS_LOGIN);
    if (isLogin != null) {
      if (isLogin) {
        return UserInfo(
            id: sp.getInt(SP_USER_ID),
            gender: sp.getString(SP_USER_GENDER),
            name: sp.getString(SP_USER_NAME),
            location: sp.getString(SP_USER_LOC),
            avatar: sp.getString(SP_USER_AVATAR),
            email: sp.getString(SP_USER_EMAIL),
            url: sp.getString(SP_USER_URL));
      }
    }
    return null;
  }

  // 是否登陆
  static Future<bool> isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool? b = sp.getBool(SP_IS_LOGIN);
    return b != null && b;
  }

  // 获取accesstoken
  static Future<String?> getAccesstoken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(SP_AC_TOKEN);
  }

  // 设置选择的主题色
  static setColorTheme(int colorThemeIndex) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt(SP_COLOR_THEME_INDEX, colorThemeIndex);
  }

  // 获取主题色
  static Future<int?> getColorThemeIndex() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getInt(SP_COLOR_THEME_INDEX);
  }
}
