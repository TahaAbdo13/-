import 'package:financeapp/constants.dart';
import 'package:financeapp/viewes/all_activity.dart';
import 'package:financeapp/widgets/drawer_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';

import 'custom_drawer_header.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(darkModeBox).listenable(),
      builder: (context, box, child) {
        var darkMode = box.get('darkMode', defaultValue: false);
        return Drawer(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const CustomDrawerHeader(),
                DrawerListTile(
                    title: 'Dark Mode',
                    trailing: Switch(
                        value: darkMode,
                        onChanged: (value) {
                          box.put('darkMode', !darkMode);
                        })),
                const Divider(),
                DrawerListTile(
                  title: 'All Activity',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed(AllActivity.id);
                  },
                  trailing: const Icon(Icons.local_activity),
                ),
                const Spacer(),
                DrawerListTile(
                  title: 'Exist From App',
                  onTap: () {
                    SystemNavigator
                        .pop(); //بتطلع من البرنامج بس بيفضل شغال في الخلفية

                    // exit(0);//بيطلع من البرنامج ومش بيفضل شغال في الخلفية
                  },
                  trailing: const Icon(Icons.close),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
