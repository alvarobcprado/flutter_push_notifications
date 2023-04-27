import 'package:flutter/material.dart';
import 'package:flutter_push_notifications/app/pages/home/home_notifier.dart';
import 'package:flutter_push_notifications/app/pages/home/home_state.dart';
import 'package:re_state_action/re_state_action.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.homeNotifier});

  final HomeNotifier homeNotifier;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeNotifier get _homeNotifier => widget.homeNotifier;

  @override
  void initState() {
    super.initState();
    _homeNotifier.process(const SetupNotificationListeners());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Push Notifications'),
      ),
      body: ReStateWidget(
        reState: _homeNotifier,
        builder: (context, state, child) {
          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return const Center(
            child: Text('All listeners are set!'),
          );
        },
      ),
    );
  }
}
