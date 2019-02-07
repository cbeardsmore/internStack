import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'widgets/gradient_app_bar.dart';

class SubmissionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(flexibleSpace: new GradientAppBar('Submit')),
      body: SubmitForm(),
    );
  }
}

class SubmitForm extends StatefulWidget {
  @override
  SubmitFormState createState() {
    return SubmitFormState();
  }
}

class TextControllers {
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _companyTextController = TextEditingController();
  final TextEditingController _otherTextController = TextEditingController();

  Map<String, dynamic> toJson() => {
        'name': _nameTextController.text,
        'email': _emailTextController.text,
        'company': _companyTextController.text,
        'other': _otherTextController.text
      };

  void dispose() {
    _nameTextController.dispose();
    _emailTextController.dispose();
    _companyTextController.dispose();
    _otherTextController.dispose();
  }
}

class SubmitFormState extends State<SubmitForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextControllers _controllers = TextControllers();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InputTextFields(_controllers),
              SubmitButton(_formKey, _controllers)
            ]));
  }

  @override
  void dispose() {
    _controllers.dispose();
    super.dispose();
  }
}

class InputTextFields extends StatelessWidget {
  final TextControllers _controllers;

  InputTextFields(this._controllers);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          color: Colors.grey[300],
          margin: EdgeInsets.all(9),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'Your Name',
                  icon: Icon(Icons.person, color: Colors.blue)),
              controller: _controllers._nameTextController,
              validator: (value) {
                if (value.length < 5) {
                  return 'Please enter your Name';
                }
              },
            ),
          ),
        ),
        Card(
          color: Colors.grey[300],
          margin: EdgeInsets.all(9),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'Your Email',
                  icon: Icon(Icons.email, color: Colors.blue)),
              keyboardType: TextInputType.emailAddress,
              controller: _controllers._emailTextController,
              validator: (value) {
                if (!value.contains('@')) {
                  return 'Please enter a valid email';
                }
              },
            ),
          ),
        ),
        Card(
          color: Colors.grey[300],
          margin: EdgeInsets.all(9),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'Company Name',
                  icon: Icon(Icons.check_circle, color: Colors.blue)),
              controller: _controllers._companyTextController,
              validator: (value) {
                if (value.length < 3) {
                  return 'Please enter the Company name';
                }
              },
            ),
          ),
        ),
        Card(
          color: Colors.grey[300],
          margin: EdgeInsets.all(9),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'Other Information',
                  icon: Icon(Icons.info, color: Colors.blue)),
              controller: _controllers._otherTextController,
            ),
          ),
        ),
        SizedBox(height: 200)
      ],
    );
  }
}

class SubmitButton extends StatelessWidget {
  final GlobalKey<FormState> _formKey;
  final TextControllers _controllers;

  SubmitButton(this._formKey, this._controllers);

  @override
  Widget build(BuildContext context) {
    double buttonHeight = MediaQuery.of(context).size.height * 0.065;
    double buttonWidth = MediaQuery.of(context).size.width * 0.4;

    return new Container(
      alignment: AlignmentDirectional(0, 0),
      child: SizedBox(
        height: buttonHeight,
        width: buttonWidth,
        child: new RaisedButton(
          child: Text('SUBMIT', style: Theme.of(context).textTheme.button),
          color: Theme.of(context).primaryColor,
          splashColor: Theme.of(context).accentColor,
          elevation: 10.0,
          highlightElevation: 20.0,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0)),
          onPressed: () {
            _uploadFormContents(context);
          },
        ),
      ),
    );
  }

  void _uploadFormContents(BuildContext context) {
    if (_formKey.currentState.validate()) {
      Firestore.instance.collection('submissions').add(_controllers.toJson());
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Submission Received. Thanks' +
              _controllers._nameTextController.text)));
    }
  }
}
