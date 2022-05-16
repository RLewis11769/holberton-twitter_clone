import 'package:flutter/material.dart';
import '../providers/auth_state.dart';
import '../models/user.dart';
import '../screens/signin_screen.dart';

class SideBarMenu extends StatefulWidget {
  const SideBarMenu({Key? key}) : super(key: key);

  @override
  State<SideBarMenu> createState() => _SideBarMenuState();
}

class _SideBarMenuState extends State<SideBarMenu> {
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
              child: FutureBuilder(
                  future: Auth().getCurrentUserModel(),
                  builder: (BuildContext context, AsyncSnapshot<CustomUser> snapshot) {
                    if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
                      return Column(
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
                                // Convert snapshot to UserModel
                                '${snapshot.data?.displayName}',
                                // 'User Name',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .primaryColorLight),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Text('${snapshot.data?.followers} Followers',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1)),
                                Expanded(
                                    child: Text('${snapshot.data?.following} Following',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1))
                              ],
                            ),
                          ]);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
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
            onTap: () => {
              // Logout
              Auth().logout(),
              // Navigate back to SignIn screen
              Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignIn()))
            },
          ),
        ],
      ),
    );
  }
}
