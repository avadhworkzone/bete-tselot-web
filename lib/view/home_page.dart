import 'package:bete_tselot_web/view/announcement_section.dart';
import 'package:bete_tselot_web/view/footer.dart';
import 'package:bete_tselot_web/view/home_section.dart';
import 'package:flutter/material.dart';

import 'question_section.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            AnnouncementsSection(),
            QuotesSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
