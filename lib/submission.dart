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
        SubmissionCard(
            icon: Icons.person,
            hintText: 'Your Name',
            controller: _controllers._nameTextController),
        SubmissionCard(
            icon: Icons.email,
            hintText: 'Your Email',
            controller: _controllers._emailTextController,
            validator: (email) {
              bool emailValid = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
              if (!emailValid) {
                return 'Please enter a valid email';
              }
            }),
        SubmissionCard(
            icon: Icons.check_circle,
            hintText: 'Company Name',
            controller: _controllers._companyTextController,
            validator: (company) {
              if (company.length < 3) {
                return 'Please enter the Company name';
              }
            }),
        SubmissionCard(
            icon: Icons.info,
            hintText: 'Other Information',
            controller: _controllers._otherTextController),
      ],
    );
  }
}

class SubmissionCard extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final TextEditingController controller;
  final Function validator;

  SubmissionCard({this.icon, this.hintText, this.controller, this.validator});

  @override
  _SubmissionCardState createState() => _SubmissionCardState();
}

class _SubmissionCardState extends State<SubmissionCard> {
  bool _autovalidate = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0))),
      child: TextFormField(
          onEditingComplete: () => {setState(() => _autovalidate = true)},
          autovalidate: _autovalidate,
          style: TextStyle(fontSize: 16),
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).accentColor),
            ),
            labelText: widget.hintText ?? null,
            prefixIcon: Icon(
              widget.icon ?? Icons.star,
            ),
          ),
          controller: widget.controller ?? null,
          validator: widget.validator ?? null),
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
        _showSnackbar(context);
      },
    );
  }

  void _showSnackbar(BuildContext context) {
    if (_formKey.currentState.validate()) {
      saveSubmission(_controllers.toJson());
      Scaffold.of(context).showSnackBar(SnackBar(
          backgroundColor: Theme.of(context).accentColor,
          duration: Duration(seconds: 3),
          content: Text(
            'Submission Received. Thanks ' +
                _controllers._nameTextController.text,
            textAlign: TextAlign.center,
          )));
    }
  }
}
