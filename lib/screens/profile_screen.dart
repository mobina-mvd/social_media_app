import 'package:flutter/material.dart';
import 'package:social_media_app/data/data.dart';
import 'package:social_media_app/models/user_model.dart';
import 'package:social_media_app/widgets/custom_drawer.dart';
import 'package:social_media_app/widgets/posts_carousel.dart';
import 'package:social_media_app/widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  const ProfileScreen({
    super.key,
    required this.user,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late PageController yourPostController;
  late PageController favoritePostController;

  @override
  void initState() {
    super.initState();
    yourPostController = PageController(initialPage: 0, viewportFraction: .8);
    favoritePostController =
        PageController(initialPage: 0, viewportFraction: .8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image.asset(
                    currentUser.backgroundImageUrl!,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 20,
                  child: SafeArea(
                    child: IconButton(
                      onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                      icon: const Icon(Icons.menu),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 2),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        widget.user.profileImageUrl!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                widget.user.name!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  fontSize: 24,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      'Followers',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.user.followers.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'Following',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.user.following.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            PostsCarousel(
                pageController: yourPostController,
                title: 'Your Posts',
                posts: widget.user.posts!),
            const SizedBox(height: 10),
            PostsCarousel(
                pageController: favoritePostController,
                title: 'Favorites ',
                posts: widget.user.favorites!),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
