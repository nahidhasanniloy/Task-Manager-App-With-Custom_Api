import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderSection(context),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  _buildProfileList(),
                  const SizedBox(height: 20),
                  _buildMoreList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // এটি খুব গুরুত্বপূর্ণ, যাতে প্রোফাইল পিকচারটি কন্টেইনারের বাইরে দেখা যায়
      alignment: Alignment.center,
      children: [
        // ব্যাকগ্রাউন্ড কভার ইমেজ
        Container(
          height: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/profile_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // নিচের সাদা কন্টেইনার
        Positioned(
          top: 150, // কভার ইমেজের উপরে একটি অংশ দেখা যাবে
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100, // এটি প্রোফাইল পিকচারকে উপরে তুলে রাখবে
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
          ),
        ),
        // প্রোফাইল পিকচার
        Positioned(
          top: 100, // প্রোফাইল পিকচারের অবস্থান
          child: Container(
            width: 120,
            height: 120,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/133763369?s=400&u=2eb844ab8d62bda196edebd9c0ecd4d2ea70a532&v=4'), // এখানে আপনার প্রোফাইল ছবির URL দিন
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileList() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          _buildListItem(
            icon: Icons.person_outline,
            title: 'My Profile',
            onTap: () {},
          ),
          _buildListItem(
            icon: Icons.settings_outlined,
            title: 'Account Setting',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildMoreList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'More',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 10),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              _buildListItem(
                icon: Icons.list_alt,
                title: 'Terms & Condition',
                onTap: () {},
              ),
              _buildListItem(
                icon: Icons.privacy_tip_outlined,
                title: 'Privacy policy',
                onTap: () {},
              ),
              _buildListItem(
                icon: Icons.help_outline,
                title: 'Help/Support',
                onTap: () {},
              ),
              _buildListItem(
                icon: Icons.logout,
                title: 'Log Out',
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildListItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}