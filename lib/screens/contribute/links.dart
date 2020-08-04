// screens/contribute/links.dart

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


void covidFormLink(BuildContext context, Widget _link) {
  Navigator.push(
    context,
    PageTransition(
        type: PageTransitionType.rightToLeft,
        child:
        _link),
  );
}
