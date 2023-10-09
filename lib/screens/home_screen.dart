import 'package:flutter/material.dart';
import 'package:social_media_app/data/data.dart';
import 'package:social_media_app/models/user_model.dart';
import 'package:social_media_app/widgets/following_users.dart';
import 'package:social_media_app/widgets/posts_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final PageController pageController = PageController(
    initialPage: 0,
    viewportFraction: .8,
  );

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: themeData.colorScheme.primary),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'frenzy'.toUpperCase(),
          style: TextStyle(
            color: themeData.colorScheme.primary,
            fontWeight: FontWeight.bold,
            letterSpacing: 10,
          ),
        ),
        bottom: TabBar(
          controller: tabController,
          indicatorColor: themeData.colorScheme.primary,
          indicatorWeight: 3,
          unselectedLabelStyle: const TextStyle(fontSize: 18),
          labelColor: themeData.colorScheme.primary,
          labelStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          tabs: const [
            Tab(text: 'Trending'),
            Tab(
              text: 'Latest',
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          FollowingUsers(),
          PostsCarousel(
              pageController: pageController, title: 'Posts', posts: posts),
        ],
      ),
    );
  }
}
