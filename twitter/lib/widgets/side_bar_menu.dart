import 'package:flutter/material.dart';

class SideBarMenu extends StatelessWidget {
  const SideBarMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Traditional structure of Drawer (there is UserAccountsDrawerHeader but not quite right)
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            // Want DrawerHeader to be 275 rather than default 200 I think
            height: 275,
            child: DrawerHeader(
              // Separate user info from navigation (don't think this is necessary but better org)
              // Besides DrawerHeader, everything else is ListTile
              child: Column(
                  // Override default center crossAxisAlignment to text align left
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // Default user image and all other info hardcoded
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.clipartmax.com/png/full/5-55403_blank-avatar-profile-pic-icon-female.png'),
                      radius: 35,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 50, 0, 15),
                      child: Text(
                        'UserName',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Theme.of(context).primaryColorLight),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text('0 Followers',
                                style: Theme.of(context).textTheme.subtitle1)),
                        Expanded(
                            child: Text('0 Following',
                                style: Theme.of(context).textTheme.subtitle1))
                      ],
                    ),
                  ]),
            ),
          ),
          // These are the actual menu items - ideally they should be links but onTap does nothing
          ListTile(
            leading: const Icon(Icons.person),
            iconColor: Theme.of(context).primaryColorLight,
            title: const Text('Profile'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.format_list_bulleted),
            iconColor: Theme.of(context).primaryColorLight,
            title: const Text('Lists'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.bookmark),
            iconColor: Theme.of(context).primaryColorLight,
            title: const Text('Bookmark'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.flash_on),
            iconColor: Theme.of(context).primaryColorLight,
            title: const Text('Moments'),
            onTap: () => {},
          ),
          Divider(
            color: Theme.of(context).primaryColorLight,
          ),
          ListTile(
            title: const Text('Settings and privacy'),
            onTap: () => {},
          ),
          ListTile(
            title: const Text('Help Center'),
            onTap: () => {},
          ),
          Divider(
            color: Theme.of(context).primaryColorLight,
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}
