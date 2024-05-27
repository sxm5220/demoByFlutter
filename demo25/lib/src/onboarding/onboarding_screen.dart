import 'package:demo25/src/onboarding/widgets/onboarding_body_widget.dart';
import 'package:flutter/material.dart';

import '../core/widget/annotated_scaffold.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnnotatedScaffold(child: OnBoardingBodyWidget());
  }
}
