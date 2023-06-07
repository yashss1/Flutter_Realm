import 'package:flutter/material.dart';
import 'package:listy/src/sample_feature/sample_item.dart';
import 'package:realm/realm.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  // final realm = Realm(Configuration.local([SampleItem.schema])); // for just local

  final app = App(
      AppConfiguration('application-0-ggbkk')); // that is appID from atlas web
  final user = app.currentUser ?? await app.logIn(Credentials.anonymous());
  final realm = Realm(Configuration.flexibleSync(
      user, [SampleItem.schema])); // for local and backend sync

  realm.subscriptions.update((mutableSubscriptions) {
    //check local too
    mutableSubscriptions.add(realm.all<SampleItem>());
  });
  final allItems =
      realm.all<SampleItem>(); // pointer -> does not fetch 20million objects
  // no need to worry about pagination and all, realm handles everything

  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(
    settingsController: settingsController,
    items: allItems,
  ));
}
