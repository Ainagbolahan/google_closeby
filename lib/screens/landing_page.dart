import 'package:flutter/material.dart';
import 'package:google_closeby/screens/interests_Screen.dart';
import 'package:google_closeby/screens/start_up_screen.dart';
import 'package:google_closeby/widgets/buttons.dart';

import '../widgets/buttons.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final PageController controller = PageController();
  @override
  void initState() {
    super.initState();
    controller;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PageView(
          controller: controller,
          children: <Widget>[
            Center(
              child: InitialPage(
                number: 1,
                title: 'Quick Help',
                description:
                    'Get help from your neighbour. It will take 60secs to post a quick help for free or money',
                buttonType: GetStarted(
                  onPressed: () {
                    if (controller.hasClients) {
                      controller.animateToPage(1,
                          duration: const Duration(microseconds: 400),
                          curve: Curves.bounceOut);
                    }
                  },
                ),
              ),
            ),
            Center(
              child: InitialPage(
                number: 2,
                title: 'Free giveaway',
                description:
                    'Easy ay to share your unused things and also you can get from your neighbours',
                buttonType: GetStarted(
                  onPressed: () {
                    if (controller.hasClients) {
                      controller.animateToPage(2,
                          duration: const Duration(microseconds: 400),
                          curve: Curves.bounceOut);
                    }
                  },
                ),
              ),
            ),
            Center(
              child: InitialPage(
                number: 3,
                title: 'Events',
                description:
                    'You can join Neighbours event or you can create an event easily',
                buttonType: GetStarted(
                  onPressed: () {
                    if (controller.hasClients) {
                      controller.animateToPage(3,
                          duration: const Duration(microseconds: 400),
                          curve: Curves.bounceOut);
                    }
                  },
                ),
              ),
            ),
            Center(
              child: InitialPage(
                number: 4,
                title: 'Short Trips',
                description:
                    'You can join Neighbours event or you can create an event easily',
                buttonType: ContinueButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => InterestScreen()));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
