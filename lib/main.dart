import 'package:flutter/material.dart';
import 'package:hotel_admin/utils/bottom_nav.dart';
import 'package:hotel_admin/utils/central.dart';
import 'package:provider/provider.dart';


main() {
  return runApp(
    ChangeNotifierProvider(
      create: (context) => Store(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNav(),
      ),
    ),
  );
} //ef

