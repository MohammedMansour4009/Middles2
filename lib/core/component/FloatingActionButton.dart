
import 'package:flutter/material.dart';

import '../constant/color.dart';

FloatingActionButton floatingActionButton(
    Future<void>? Function() navigateToRequestScreen,
    {Icon? icon}
    ) {
  return FloatingActionButton(
    elevation: 0,
    onPressed: navigateToRequestScreen,
    backgroundColor: Colors.blue,
    foregroundColor: kOnSecondaryColor,
    child: icon ?? const Icon(Icons.add,color: Colors.white,),
  );
}
