import 'package:flutter/cupertino.dart';
import 'package:t/widgets/dnsys_autoSearch_widget.dart';

class DnsysSearchWidget extends StatefulWidget {
  const DnsysSearchWidget({super.key});

  @override
  State<DnsysSearchWidget> createState() => _DnsysSearchWidgetState();
}

class _DnsysSearchWidgetState extends State<DnsysSearchWidget> {
  final List<String> names = [
    "Ayden Ram",
    "Rowan Trevon",
    "Garrison Faisal",
    "Bridie Ford",
    "Rameel Xavier",
    "Abriel Yestin",
    "Cal Heston",
    "Ryland Nick",
    "Orson Kaylen",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: DnsysAutoSearchWidget(
        data: names,
        maxElementsToDisplay: 10,
        onItemTap: (index) {},
      ),
    );
  }
}
