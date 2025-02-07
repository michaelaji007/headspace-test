import 'package:go_router/go_router.dart';

import '../../features/home/domain/entities/news.dart';
import '../../features/home/presentation/pages/news_details.dart';

import '../../features/home/presentation/pages/home.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: Routes.initial,
      builder: (context, state) => const NewsPage(),
    ),
    GoRoute(
        path: Routes.details,
        builder: (context, state) => NewsDetailScreen(
              news: state.extra as NewsEntity,
            )),
  ],
);

class Routes {
  static const initial = '/';

  static const details = '/details';
}
