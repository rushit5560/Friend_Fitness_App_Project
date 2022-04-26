import 'package:flutter/material.dart';

import 'group_list_screen_widgets.dart';

class GroupListScreen extends StatelessWidget {
  const GroupListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            GroupListScreenAppBarModule(),
            SizedBox(height: 15),
            Expanded(
              child: GroupListModule(),
            ),
          ],
        ),
      ),
    );
  }
}
