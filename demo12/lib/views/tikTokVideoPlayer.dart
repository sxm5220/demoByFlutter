import 'package:demo12/mock/video.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoListController extends ChangeNotifier {
  VideoListController();

  /// 目前的视频序号
  ValueNotifier<int> index = ValueNotifier<int>(0);

  /// 视频列表
  List<VideoPlayerController> playerList = [];

  ///
  VideoPlayerController get currentPlayer => playerList[index.value];

  bool get isPlaying => currentPlayer.value.isPlaying;

  /// 获取指定index的player
  VideoPlayerController playerOfIndex(int index) => playerList[index];

  /// 视频总数目
  int get videoCount => playerList.length;

  loadIndex(int target) {
    if (index.value == target) return;
    // 播放当前的，暂停其他的
    var oldIndex = index.value;
    var newIndex = target;
    if (!(oldIndex == 0 && newIndex == 0)) {
      playerOfIndex(oldIndex).seekTo(Duration.zero);
      playerOfIndex(oldIndex).pause();
      playerOfIndex(oldIndex).removeListener(_didUpdateValue);
    }
    playerOfIndex(newIndex).play();
    playerOfIndex(newIndex).addListener(_didUpdateValue);
    // 完成
    index.value = target;
  }

  _didUpdateValue() {
    notifyListeners();
  }

  /// 添加视频
  addVideoInfo(List<UserVideo> list) async {
    playerList.addAll(await Future.wait(list.map(
      (info) async {
        var player = VideoPlayerController.network(info.url);
        player.setLooping(true);
        await player.initialize();
        return player;
      },
    )));
  }

  /// 初始化
  init(PageController pageController, List<UserVideo> initialList) async {
    await addVideoInfo(initialList);
    pageController.addListener(() {
      var p = pageController.page!;
      if (p % 1 == 0) {
        loadIndex(p ~/ 1);
      }
    });
    playerList.first.play();
    notifyListeners();
  }

  /// 销毁全部
  void dispose() {
    // 销毁全部
    for (var player in playerList) {
      player.dispose();
    }
    playerList = [];
    super.dispose();
  }
}
