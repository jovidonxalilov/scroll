// import 'package:flutter/material.dart';
// import 'package:loggy/64-category/view_models/cart_viewmodel.dart';
// import 'package:loggy/64-category/view_models/products_viewmodel.dart';
// import 'package:loggy/64-category/views/screens/products_screen.dart';
// import 'package:provider/provider.dart';
//
// void main() {
//   runApp(const MainApp());
// }
//
// class MainApp extends StatelessWidget {
//   const MainApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (ctx) => CartViewmodel()),
//         ChangeNotifierProvider(create: (ctx) => ProductsViewmodel()),
//       ],
//       child: const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: ProductsScreen(),
//       ),
//     );
//   }
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loggy/66-dars/page/journal_daily_detail.dart';
import 'package:loggy/67-dars/data/image_provider.dart';
import 'package:loggy/71-dars/manager/notification_provider.dart';
import 'package:loggy/core/dependetsy/provider.dart';
import 'package:loggy/core/natigation/router.dart';
import 'package:loggy/loggy/page/user_detail.dart';
import 'package:loggy/malumotlar/provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ImagePickedProvider(),
        ),
        ChangeNotifierProvider(create: (context) => PostProvider(),),
        ChangeNotifierProvider(create: (context) => NotificationProvider(),),
      ],
      builder: (context, child) => ScreenUtilInit(
        designSize: Size(430, 932),
        child: MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
        ),
      ),
    );
  }
}
