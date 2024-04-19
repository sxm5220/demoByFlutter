import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class DNsysUserItem {
  final String name, image;
  DNsysUserItem({required this.name, required this.image});
}

List<DNsysUserItem> userItemList = [user1, user2, user3, user4];

// demo user
DNsysUserItem user1 =
    DNsysUserItem(name: "James", image: "assets/images/james.png");
DNsysUserItem user2 =
    DNsysUserItem(name: "John", image: "assets/images/John.png");
DNsysUserItem user3 =
    DNsysUserItem(name: "Marry", image: "assets/images/marry.png");
DNsysUserItem user4 =
    DNsysUserItem(name: "Rosy", image: "assets/images/rosy.png");

class DnsysUser {
  const DnsysUser(
      {required this.name,
      required this.image,
      required this.date,
      required this.users});
  final String name, image;
  final DateTime date;
  final List<DNsysUserItem> users;
}

List<DnsysUser> travelSpots = [
  DnsysUser(
    users: users..shuffle(),
    name: "Red Mountains",
    image: "assets/images/Red_Mountains.png",
    date: DateTime(2020, 10, 15),
  ),
  DnsysUser(
    users: users..shuffle(),
    name: "Megical World",
    image: "assets/images/Magical_World.png",
    date: DateTime(2020, 3, 10),
  ),
  DnsysUser(
    users: users..shuffle(),
    name: "Red Mountains",
    image: "assets/images/Red_Mountains.png",
    date: DateTime(2020, 10, 15),
  ),
];

List<DNsysUserItem> users = [user1, user2, user3];

class DnsysUserCard extends StatelessWidget {
  const DnsysUserCard(
      {super.key,
      required this.user,
      this.isFullCard = false,
      required this.press});
  final DnsysUser user;
  final bool isFullCard;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (isFullCard ? 158 : 137),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: isFullCard ? 1.09 : 1.29,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(
                    image: AssetImage(user.image), fit: BoxFit.cover),
              ),
            ),
          ),
          Container(
            width: (isFullCard ? 158 : 137),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(5, 5),
                  blurRadius: 10,
                  color: const Color(0xFFE9E9E9).withOpacity(0.56),
                )
              ],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Text(
                  user.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: isFullCard ? 17 : 12,
                  ),
                ),
                if (isFullCard)
                  Text(
                    user.date.day.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                if (isFullCard)
                  Text(
                    DateFormat.MMMM().format(user.date) +
                        " " +
                        user.date.year.toString(),
                  ),
                const Gap(10),
                DnsysUsersWidget(
                  users: user.users,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DnsysUsersWidget extends StatelessWidget {
  const DnsysUsersWidget({super.key, required this.users});

  final List<DNsysUserItem> users;

  @override
  Widget build(BuildContext context) {
    int totalUser = 0;
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      height: 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ...List.generate(
            users.length,
            (index) {
              totalUser++;
              return Positioned(
                left: (22 * index).toDouble(),
                child: buildTravelerFace(index),
              );
            },
          ),
          Positioned(
            left: (22 * totalUser).toDouble(),
            child: Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                color: Color(0xFF3E4067),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  ClipOval buildTravelerFace(int index) {
    return ClipOval(
      child: Image.asset(
        users[index].image,
        height: 30,
        width: 30,
        fit: BoxFit.cover,
      ),
    );
  }
}

class AddNewPlaceCard extends StatelessWidget {
  const AddNewPlaceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (350),
      width: (158),
      decoration: BoxDecoration(
        color: Color(0xFF6A6C93).withOpacity(0.09),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 2,
          color: Color(0xFFEBE8F6),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: (53),
            width: (53),
            child: Icon(
              Icons.add,
              size: (35),
              color: Colors.white,
            ),
          ),
          Gap(10),
          Text(
            "Add New Place",
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
