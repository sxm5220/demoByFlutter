/// 检查邮箱格式
bool duIsEmail(String email) {
  if (email.isEmpty) return false;
  //邮箱正则
  String regexEmail = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";
  return RegExp(regexEmail).hasMatch(email);
}

/// 检查字符长度
bool duCheckStringLength(String value, int length) {
  if (value.isEmpty) return false;
  return value.length >= length;
}
