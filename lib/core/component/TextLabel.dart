
import 'package:flutter/cupertino.dart';

Text SmaleText(String text) => Text(text, style: TextStyle(fontSize: 12));

Text NormalText(String text, {double? fontSize, FontWeight? fontWeight}) => Text(text,style: TextStyle(fontSize: fontSize ,fontWeight: fontWeight,fontFamily: 'Cairo'));
