import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:t/widgets/dnsys_starrySky_widget.dart';

class DnsysMain3Page extends StatefulWidget {
  const DnsysMain3Page({super.key});

  @override
  State<DnsysMain3Page> createState() => _DnsysMain3PageState();
}

class _DnsysMain3PageState extends State<DnsysMain3Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          EasyDynamicTheme.of(context).changeTheme();
        },
        child: Icon(Icons.brightness_6),
      ),
      body: const Center(
        child: DnsysStarrySkyWidget(),
      ),
    );
  }
}
