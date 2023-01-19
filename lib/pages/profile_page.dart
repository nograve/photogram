import 'package:flutter/material.dart';
import 'package:photogram/widgets/user_name_widget.dart';
import '../widgets/posts_grid_view.dart';
import '../widgets/profile_picture.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
        vertical: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UserNameWidget(),
          ProfilePicture(),
          PostsGridView(),
        ],
      ),
    );
  }
}
