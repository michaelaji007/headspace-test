import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:headspace_test/core/widget/cached_image.dart';
import 'package:headspace_test/features/home/domain/entities/news.dart';


import '../../../../core/routes/routes.dart';

// class NewsCard extends StatelessWidget {
//   final NewsEntity? news;
//
//   const NewsCard({super.key, required this.news});
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         context.push(Routes.details, extra: news);
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               news?.title ?? "",
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               '${news?.author} • Published ${news?.publishedAt}',
//               style: TextStyle(color: Colors.grey[600], fontSize: 14),
//             ),
//           ],
//         ),
//       )
//     );
//   }
// }


class NewsCard extends StatelessWidget {
  final NewsEntity news;

  const NewsCard({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          context.push(Routes.details, extra: news);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (news.urlToImage != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SpaceCacheImage(
                    imgUrl:  news.urlToImage!,
                    height: 100,
                    width: double.infinity,
                    boxFit: BoxFit.cover,

                  ),
                ),
              const SizedBox(height: 12),
              Text(
                news.title ?? 'No Title',
                style: Theme.of(context).textTheme.titleLarge,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              if (news.description != null) ...[
                Text(
                  news.description!,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
              ],
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    news.source?.name ?? 'Unknown Source',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  if (news.publishedAt != null)
                    Text(
                      _formatDate(news.publishedAt!),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(String dateString) {
    final date = DateTime.parse(dateString);
    return '${date.day}/${date.month}/${date.year}';
  }
}