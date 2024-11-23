import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nebot/common/bloc/auth/auth_state.dart';
import 'package:nebot/common/bloc/auth/auth_state_cubit.dart';
import 'package:nebot/presentation/pages/auth/login_screen.dart';
import 'package:nebot/presentation/pages/first_page.dart';
import 'package:nebot/presentation/pages/guides/guide_details.dart';
import 'package:nebot/presentation/pages/home/home_screen.dart';
import 'package:nebot/presentation/pages/layout/layout_page.dart';
import 'package:nebot/service_locater.dart';
import 'common/bloc/nav_bar/nav_bar_bloc.dart';
import 'common/local/cache_helper.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  String? token =CacheHelper.getData(key: 'token');
  print("Token: $token");
  setupServiceLocator();
  runApp(const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthStateCubit()..appStarted(),
            ),
            BlocProvider(
              create: (context) => BottomNavCubit(),  // Provide the BottomNavCubit here
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Posts App',
            theme: appTheme,
            home: BlocBuilder<AuthStateCubit,AuthState>(
                builder: (context,state){
                  if(state is Authenticated){
                    return LayoutPage();
                  }
                  else{
                    return FirstPage();
                  }
                }

            )
          ),
        );
      },
    );
  }
}
// BlocBuilder<AuthStateCubit,AuthState>(
// builder: (context,state){
// if(state is Authenticated){
// return LayoutPage();
// }
// else{
// return FirstPage();
// }
// }
//
// )