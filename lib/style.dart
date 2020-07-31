// style.dart

import 'package:flutter/material.dart';

const AppBarTextSize = 20.0;
const TitleTextSize = 15.0;
const DescriptionTextSize = 13.0;

const String FontNameDefault = 'Roboto';

const AppBarTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w400,
  fontSize: AppBarTextSize,
  color: Colors.white,
);

const TitleTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w400,
  fontSize: TitleTextSize,
  color: Colors.black,
);

const DescriptionTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: DescriptionTextSize,
  color: Colors.black,
);

