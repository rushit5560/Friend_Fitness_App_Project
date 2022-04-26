import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';

class GroupListScreenAppBarModule extends StatelessWidget {
  const GroupListScreenAppBarModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class GroupListModule extends StatelessWidget {
  const GroupListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return _groupListTile();
      },
    ).commonSymmetricPadding(horizontal: 10);
  }

  Widget _groupListTile() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
      ),

      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
              // image: DecorationImage(
              //   image: AssetImage(),
              // ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              "Group Name",
              style: TextStyle(

              ),
            ),
          ),
        ],
      ),
    );
  }

}

