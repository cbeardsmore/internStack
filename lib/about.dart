import 'package:flutter/material.dart';
import 'widgets/gradient_app_bar.dart';
import 'widgets/curver_corner_card.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(flexibleSpace: GradientAppBar("About Us")),
      body: Column(
        children: <Widget>[_buildTopCard(context), _buildBottomCard(context)],
      ),
    );
  }

  Widget _buildTopCard(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        CurverCornerCard(Column(
          children: <Widget>[
            SizedBox(
              child: Image.asset('assets/perth.jpg', fit: BoxFit.fitWidth),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text('internStack',
                  style: Theme.of(context).textTheme.display1,
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
    return CurverCornerCard(Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text('F.A.Q',
            style: Theme.of(context).textTheme.display2,
            textAlign: TextAlign.center),
        SizedBox(
          height: 300,
        )
      ],
    ));
  }
}
