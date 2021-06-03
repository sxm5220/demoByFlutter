import 'package:flutter/material.dart';

class DemoFlowPopMenu extends StatefulWidget {
  DemoFlowPopMenu({Key key}) : super(key: key);

  @override
  _DemoFlowPopMenuState createState() => _DemoFlowPopMenuState();
}

class _DemoFlowPopMenuState extends State<DemoFlowPopMenu>
    with SingleTickerProviderStateMixin {
  AnimationController _ctrlAnimationPopMenu;
  IconData lastTapped = Icons.notifications;
  final List<IconData> menuItems = <IconData>[
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    Icons.menu,
  ];

  void _updateMenu(IconData icon) {
    if (icon != Icons.menu) {
      setState(() {
        lastTapped = icon;
      });
    } else {
      _ctrlAnimationPopMenu.status == AnimationStatus.completed
          ? _ctrlAnimationPopMenu.reverse()
          : _ctrlAnimationPopMenu.forward();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ctrlAnimationPopMenu = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250), //动画时长250毫秒
    );
  }

  Widget flowMenuItem(IconData icon) {
    final double buttonDiameter =
        MediaQuery.of(context).size.width * 2 / (menuItems.length * 3);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: RawMaterialButton(
        onPressed: () {
          _updateMenu(icon);
        },
        fillColor: lastTapped == icon ? Colors.amber[700] : Colors.blue,
        splashColor: Colors.amber[100],
        shape: CircleBorder(),
        constraints: BoxConstraints.tight(Size(buttonDiameter, buttonDiameter)),
        child: Icon(
          icon,
          color: Colors.white,
          size: 30.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flow(
        delegate: FlowMenuDelegate(animation: _ctrlAnimationPopMenu),
        children: menuItems
            .map<Widget>((IconData icon) => flowMenuItem(icon))
            .toList(),
      ),
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  FlowMenuDelegate({this.animation}) : super(repaint: animation);
  final Animation<double> animation;

  @override
  void paintChildren(FlowPaintingContext context) {
    double x = 50.0; //起始位置
    double y = 50.0; //横向展开,y不变
    for (int i = 0; i < context.childCount; ++i) {
      x = context.getChildSize(i).width * i * animation.value;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(x, y, 0),
      );
    }
  }

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) =>
      animation != oldDelegate.animation;
}
