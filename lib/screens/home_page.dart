import 'package:flutter/material.dart';
import '../widgets/home_page_widgets/appbar_widgets.dart';
import '../widgets/home_page_widgets/body_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: DarkModeButton(),
        ),
        title: const AppbarTitle(),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: SettingsButton(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Stack(
                fit: StackFit.expand,
                children: [
                  TimeIndicatorWidget(),
                  StudyBreakWidget(),
                ],
              ),
            ),
            const MediaButtons(),
            const RoundsWidget(),
          ],
        ),
      ),
    );
  }
}
