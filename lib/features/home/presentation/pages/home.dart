import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:headspace_test/core/widget/shimmer.dart';
import 'package:headspace_test/features/home/presentation/bloc/news/news_bloc.dart';
import 'package:headspace_test/features/home/presentation/pages/settings_page.dart';
import 'package:headspace_test/features/home/presentation/widgets/news_card.dart';

import '../../../../core/routes/routes.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int _selectedCategory = 0;
  final List<String> categories = [
    'All',
    'apple',
    'Sports',
    'Health',
    'Tech'
  ];

  @override
  void initState() {
    super.initState();
    final taskBloc = context.read<NewsBloc>();
    taskBloc.add(GetNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grand News'),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(child: ThemeToggler()),
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCategorySelector(),

            _buildLatestNewsHeader(),
            BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
              if (state is Loading) {
                return  shimmer();
              }

              if (state is Error) {
                return Center(child: Text(state.message));
              }

              if (state is LoadedList) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.newsEntity.length,

                  itemBuilder: (context, index) {
                    return NewsCard(
                      news: state.newsEntity[index],
                    );
                  },
                );
              }
              return Container();
            })
          ],
        ),
      ),
    );
  }

  Widget shimmer() {
    return Column(
      children: [
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Row(
              children: [

                10.horizontalSpace,
                ShimmerWidget.rectangle(
                  height: 63.h,
                  width: 270.w,
                  borderRadius: 10.r,
                ),
                10.horizontalSpace,
                ShimmerWidget.circle(
                  height: 70.h,
                  width: 70.w,
                  borderRadius: 360,
                ),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return 16.verticalSpace;
          },
        ),
      ],
    );
  }

  Widget _buildCategorySelector() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ChoiceChip(
              label: Text(categories[index]),
              selected: _selectedCategory == index,
              onSelected: (selected) {
                setState(() {
                  _selectedCategory = index;
                });
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildLatestNewsHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Latest News',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('See More'),
          ),
        ],
      ),
    );
  }
}

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int _selectedCategory = 0;
  final List<String> categories = [
    'All',
    'Politics',
    'Sports',
    'Health',
    'Tech'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grand News'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCategorySelector(),
            _buildFeaturedNews(),
            _buildLatestNewsHeader(),
            _buildNewsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySelector() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ChoiceChip(
              label: Text(categories[index]),
              selected: _selectedCategory == index,
              onSelected: (selected) {
                setState(() {
                  _selectedCategory = index;
                });
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildLatestNewsHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Latest News',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('See More'),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsList() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      itemCount: 2,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return _buildNewsItem(
          title: index == 0
              ? 'Maharashtra Board Result 2024 Live: Check updates on Maha SSC,HSC result dates'
              : 'Indian-American entrepreneur Pritika Mehta shares tips for immigrant founders in San Francisco',
          category: index == 0 ? 'Education' : 'World News',
          time: index == 0 ? '47mins ago' : '24mins ago',
        );
      },
    );
  }

  Widget _buildFeaturedNews() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'KKR players flock Instagram as Phil Salt leaves IPL for Pakistan series and T20 World Cup',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Sports • Published 2h ago',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewsItem(
      {required String title, required String category, required String time}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          Text(
            '$category • Published $time',
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
        ],
      ),
    );
  }
}
