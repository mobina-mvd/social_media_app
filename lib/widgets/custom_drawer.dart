import 'package:flutter/material.dart';
import 'package:social_media_app/data/data.dart';
import 'package:social_media_app/screens/home_screen.dart';
import 'package:social_media_app/screens/login_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                currentUser.backgroundImageUrl!,
                width: double.infinity,
                height: 200,
                fit: BoxFit.fill,
              ),
              Positioned(
                bottom: 15,
                left: 15,
                right: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      child: ClipOval(
                          child: Image.asset(
                        currentUser.profileImageUrl!,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      )),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      currentUser.name!,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildDrawerOption(
            const Icon(Icons.dashboard),
            'Home',
            () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
          ),
          _buildDrawerOption(const Icon(Icons.chat), 'Chat', () {}),
          _buildDrawerOption(const Icon(Icons.location_on), 'Map', () {}),
          _buildDrawerOption(
              const Icon(Icons.account_circle), 'Your Profile', () {}),
          _buildDrawerOption(const Icon(Icons.settings), 'Settings', () {}),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: _buildDrawerOption(
                const Icon(Icons.directions_run),
                'Logout',
                () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerOption(Icon icon, String title, Function() onTap) {
    return ListTile(
      onTap: onTap,
      leading: icon,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
