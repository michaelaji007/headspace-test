import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:headspace_test/features/home/domain/entities/news.dart';

import '../../../../core/widget/cached_image.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsEntity news;
  const NewsDetailScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SpaceCacheImage(
              height: 400.h,

              width: double.maxFinite,
              imgUrl: news.urlToImage ?? '',

              boxFit: BoxFit.cover,
            ),
            _buildTimeStamp(),
            const SizedBox(height: 16),
            _buildHeadline(),
            const SizedBox(height: 8),
            _buildDate(),
            const SizedBox(height: 24),
            _buildArticleContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeStamp() {
    return Text(
      news.publishedAt ?? '',
      style: TextStyle(
        color: Colors.grey[600],
        fontSize: 14,
      ),
    );
  }

  Widget _buildHeadline() {
    return  Text(
      news.title ?? '',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        height: 1.3,
      ),
    );
  }

  Widget _buildDate() {
    return Text(
      'April 8, 2024 19:13 IST',
      style: TextStyle(
        color: Colors.grey[600],
        fontSize: 14,
      ),
    );
  }

  Widget _buildArticleContent() {
    return Text(
      news.content ?? '',
      style: TextStyle(
        color: Colors.grey[600],
        fontSize: 14,
      ),
    );

      RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 16,
          height: 1.5,
        ),
        children: [
          const TextSpan(
            text: 'Xiaomi India ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const TextSpan(
            text: 'has denied exiting the offline market for smart TV sales.\n\n',
          ),
          const TextSpan(
            text: 'The rebuttal comes in response to a claim made by Super Plastronics Pvt Ltd chief executive officer, Ameet Singh Marwah, that Xiaomi had closed its offline television sales last year, apparently because it had ceased to serve as a viable business option.\n\n',
          ),
          TextSpan(
            text: 'In a statement shared with FE over email, a company spokesperson said that, ',
            style: TextStyle(color: Colors.grey[800]),
          ),
          const TextSpan(
            text: '"Xiaomi has a strong retail presence across multiple offline channels besides Mi stores and Mi Homes including multi-brand stores, Mi Preferred Partners as well as large format stores like Reliance, Vijay Sales, Poorvika, Sangeetha, etc." ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const TextSpan(
            text: 'adding that brick-and-mortar channels have been contributing to 50 percent of its smart TV sales in the country.\n\n',
          ),
          const TextSpan(
            text: 'Underscoring the importance of offline to showcase ',
          ),
          const TextSpan(
            text: '"the superior quality of Xiaomi smart TVs, and compare it with other marginal, fragmented players," ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const TextSpan(
            text: 'the spokesperson reiterated that Xiaomi will continue to strengthen its offline business across all categories, smart TVs included, giving the best experience and choices across channels to its customers.',
          ),
        ],
      ),
    );
  }
}