import 'dart:ui';

import 'package:bete_tselot_web/routs/routs.dart';
import 'package:bete_tselot_web/utils/image_utils.dart';
import 'package:bete_tselot_web/view/mobile/home_screen.dart';
import 'package:bete_tselot_web/view/web/home/web_home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());
  await Firebase.initializeApp(options: FirebaseOptions(
    apiKey: 'AIzaSyC9onie-PXAWW4LsmDWqQtbGAgn0MWA4YM',
    appId: '1:559020877410:web:3bd083c404992f94e5d33b',
    messagingSenderId: '559020877410',
    projectId: 'bete-tselot',
    authDomain: 'bete-tselot.firebaseapp.com',
    storageBucket: 'bete-tselot.appspot.com',
    measurementId: 'G-HM8M2NV0TL',
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (context, constraints) {
      if(constraints.maxWidth>600){
        ///web
        return ScreenUtilInit(
          designSize: const Size(1466, 932),
          child: MaterialApp.router(
            scrollBehavior: MyCustomScrollBehavior(),
            title: 'Bete Tselot',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                useMaterial3: true,
                fontFamily: FontUtils.poppins
            ),
            routerConfig: RouterClass.webRouter,
            // initialRoute: RoutesClass.getHomeRoute(),
            // getPages: RoutesClass.routes,
            // home:  const WebHomeScreen(),
            // home:  const HoverUnderlineDemo(),
          ),
        );
      }else{
        ///mob
        return ScreenUtilInit(
          designSize: const Size(430, 932),
          child: MaterialApp.router(
            title: 'Bete Tselot',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                useMaterial3: true,
                fontFamily: FontUtils.poppins
            ),
            routerConfig: RouterClass.appRouter,
            // initialRoute: kIsWeb ? RoutesClass.getHomeRoute() : RoutesClass.getAppHomeRoute(),
            // getPages: RoutesClass.routes,
            // home: kIsWeb?WebHomeScreen(): const HomeScreen(),
            // home:  const HoverUnderlineDemo(),
          ),
        );

      }
    }, );
  }
}


class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
///
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       title: 'Persistent Layout Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       routerConfig: _router,
//     );
//   }
//
//   // Define router configuration
//   static final GoRouter _router = GoRouter(
//     initialLocation: '/home',
//     routes: [
//       ShellRoute(
//         builder: (context, state, child) {
//           return MainScaffold(child: child);
//         },
//         routes: [
//           GoRoute(
//             path: '/home',
//             pageBuilder: (context, state) => NoTransitionPage(
//               child: HomeContent(),
//             ),
//           ),
//           GoRoute(
//             path: '/profile',
//             pageBuilder: (context, state) => NoTransitionPage(
//               child: ProfileContent(),
//             ),
//           ),
//           GoRoute(
//             path: '/settings',
//             pageBuilder: (context, state) => NoTransitionPage(
//               child: SettingsContent(),
//             ),
//           ),
//           GoRoute(
//             path: '/notifications',
//             pageBuilder: (context, state) => NoTransitionPage(
//               child: NotificationsContent(),
//             ),
//           ),
//         ],
//       ),
//     ],
//   );
// }
//
// class MainScaffold extends StatelessWidget {
//   final Widget child;
//
//   const MainScaffold({Key? key, required this.child}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Persistent header
//       appBar: AppBar(
//         title: Text('My App'),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {
//               context.go('/notifications');
//               // Implement search functionality
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.account_circle),
//             onPressed: () {
//               // Implement account actions
//             },
//           ),
//         ],
//       ),
//
//       // Body with child content
//       body: child,
//
//       // Bottom Navigation Bar
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.notifications),
//             label: 'Notifications',
//           ),
//         ],
//         currentIndex: _getCurrentIndex(context),
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         onTap: (index) => _onItemTapped(context, index),
//         type: BottomNavigationBarType.fixed,
//       ),
//     );
//   }
//
//   // Determine current index based on current route
//   int _getCurrentIndex(BuildContext context) {
//     final String location = GoRouterState.of(context).uri.toString();
//     switch (location) {
//       case '/home':
//         return 0;
//       case '/profile':
//         return 1;
//       case '/settings':
//         return 2;
//       case '/notifications':
//         return 3;
//       default:
//         return 0;
//     }
//   }
//
//   // Navigate to corresponding route when bottom nav item is tapped
//   void _onItemTapped(BuildContext context, int index) {
//     switch (index) {
//       case 0:
//         context.go('/home');
//         break;
//       case 1:
//         context.go('/profile');
//         break;
//       case 2:
//         context.go('/settings');
//         break;
//       case 3:
//         context.go('/notifications');
//         break;
//     }
//   }
// }
//
// // Content Widgets (same as previous example)
// class HomeContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Home Content',
//         style: TextStyle(fontSize: 24),
//       ),
//     );
//   }
// }
//
// class ProfileContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Profile Content',
//         style: TextStyle(fontSize: 24),
//       ),
//     );
//   }
// }
//
// class SettingsContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Settings Content',
//         style: TextStyle(fontSize: 24),
//       ),
//     );
//   }
// }
//
// class NotificationsContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Notifications Content',
//         style: TextStyle(fontSize: 24),
//       ),
//     );
//   }
// }