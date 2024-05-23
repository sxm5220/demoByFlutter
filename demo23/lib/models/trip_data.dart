typedef TripAdditionalInfo = ({String number, String title});

class UserData {
  final String uid;
  final String name;
  final String img;
  const UserData({
    required this.uid,
    required this.name,
    required this.img,
  });
}

class TripData {
  final String id;
  final String title;
  final String imagePath;
  final String date;
  final UserData user;
  final List<UserData> userList;
  final List<TripAdditionalInfo> tripAdditionalInfos;

  const TripData({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.date,
    required this.user,
    required this.tripAdditionalInfos,
    required this.userList,
  });
}
