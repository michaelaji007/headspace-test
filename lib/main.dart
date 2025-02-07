import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:headspace_test/core/util/theme.dart';
import 'package:headspace_test/features/home/presentation/bloc/settings/theme_bloc.dart';
import 'package:headspace_test/generated/l10n.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'core/routes/routes.dart';
import 'features/home/presentation/bloc/news/news_bloc.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  runApp(MultiBlocProvider(providers: [
    BlocProvider<NewsBloc>(
      create: (context) => NewsBloc(
        getNews: di.getIt(),
      ),
    ),
    BlocProvider(
      create: (_) => ThemeBloc()..add(InitializeTheme()),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (c, i) => GestureDetector(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    currentFocus.focusedChild?.unfocus();
                  }
                },
                child: MaterialApp.router(
                  routerConfig: router,
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  locale: Locale("en"),
                  title: 'News Page',
                  themeMode:  state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
                  debugShowCheckedModeBanner: false,
                  theme: AppTheme.lightThemeData(),
                  darkTheme: AppTheme.darkThemeData(),
                )));
      },
    );
  }
}
