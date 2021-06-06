import 'dart:convert';
import 'dart:io';

void getHttpCilentData() async {
  try {
    HttpClient httpClient = HttpClient();
    HttpClientRequest request =
        await httpClient.getUrl(Uri.parse('http://www.baidu.com'));
    HttpClientResponse response = await request.close();
    var result = await response.transform(utf8.decoder).join();
    print(result);
    httpClient.close();
  } catch (e) {
    print('请求失败:$e');
  } finally {}
}
