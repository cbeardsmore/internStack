import 'package:flutter/material.dart';
import 'widgets/gradient_app_bar.dart';
import 'widgets/curver_corner_card.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(flexibleSpace: GradientAppBar(title: "About Us")),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[_buildTopCard(context), _buildBottomCard(context)],
        ),
      ),
    );
  }

  Widget _buildTopCard(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        CurverCornerCard(
            child: Column(
          children: <Widget>[
            SizedBox(
              child: Image.asset('assets/perth.jpg', fit: BoxFit.fitWidth),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Text('internStack',
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ),
            Text(
                'A community led resource to help Australian Computer Science students find Internships.',
                style: Theme.of(context).textTheme.display2,
                textAlign: TextAlign.center),
            SizedBox(height: 10)
          ],
        )),
      ],
    );
  }

  Widget _buildBottomCard(BuildContext context) {
    return CurverCornerCard(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text('F.A.Q',
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          _buildQuestionAndAnswer(
              context,
              'What internships are allowed on internStack?',
              'Any Australian based internship focusing on Computer Science, Software Engineering or Cyber Security'),
          _buildQuestionAndAnswer(context, 'How do I submit a role?',
              'Visit the submissions page from the Role listing and fill in the form. Alternatively, email us at internstack1@gmail.com'),
          _buildQuestionAndAnswer(context, 'How was this App developed?',
              'Sketch for UI design. Flutter for development with Cloud Firestore database. Unsplash for images.'),
          SizedBox(
            height: 10,
          )
        ],
      ),
    ));
  }

  Widget _buildQuestionAndAnswer(
      BuildContext context, String question, String answer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(question, style: Theme.of(context).textTheme.display3),
            SizedBox(height: 4),
            Text(answer, style: Theme.of(context).textTheme.display2),
          ]),
    );
  }
}
