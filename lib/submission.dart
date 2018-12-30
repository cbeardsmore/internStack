import 'package:flutter/material.dart';

class SubmissionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('internStack - Submit')),
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

class SubmitFormState extends State<SubmitForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[InputTextFields(), SubmitButton(_formKey)]));
  }
}

class InputTextFields extends StatelessWidget {
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
                  icon: Icon(Icons.person, color: Colors.deepOrange)),
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
                  icon: Icon(Icons.email, color: Colors.deepOrange)),
              keyboardType: TextInputType.emailAddress,
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
                  icon: Icon(Icons.check_circle, color: Colors.deepOrange)),
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
                  icon: Icon(Icons.info, color: Colors.deepOrange)),
            ),
          ),
        ),
        SizedBox(height: 200)
      ],
    );
  }
}

class SubmitButton extends StatelessWidget {
  final _formKey;

  SubmitButton(this._formKey);

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: AlignmentDirectional(0, 0),
      child: new SizedBox(
        height: 70,
        width: 200,
        child: new RaisedButton(
          child: const Text('Submit',
              style: TextStyle(color: Colors.white, fontSize: 30)),
          color: Colors.black54,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('Submission Received. Thankyou')));
            }
          },
        ),
      ),
    );
  }
}
