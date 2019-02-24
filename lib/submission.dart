import 'package:flutter/material.dart';
import 'widgets/gradient_app_bar.dart';
import 'widgets/primary_raised_button_container.dart';
import 'services/firestore.dart';

class SubmissionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(flexibleSpace: GradientAppBar(title: 'Submit')),
      body: SubmitForm(),
      resizeToAvoidBottomPadding: false,
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
        child: Stack(children: <Widget>[
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
    return PrimaryRaisedButtonContainer(
      title: 'SUBMIT',
      onPressed: () {
        _uploadFormContents(context);
      },
    );
  }

  void _uploadFormContents(BuildContext context) {
    if (_formKey.currentState.validate()) {
      saveSubmission(_controllers.toJson());
      Scaffold.of(context).showSnackBar(SnackBar(
          backgroundColor: Theme.of(context).accentColor,
          duration: Duration(seconds: 3),
          content: Text(
            'Submission Received. Thanks' +
                _controllers._nameTextController.text,
            textAlign: TextAlign.center,
          )));
    }
  }
}
