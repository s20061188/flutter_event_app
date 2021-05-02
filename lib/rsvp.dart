import 'package:flutter/material.dart';
import './controllers/form_controller.dart';
import './models/form.dart';

class InputForm extends StatefulWidget {
  @override
  InputFormState createState() {
    return InputFormState();
  }
}

class InputFormState extends State<InputForm> {
  final _formKey = GlobalKey<FormState>();
  //final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController responseController = TextEditingController();

// Method to Submit Feedback and save it in Google Sheets
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      RsvpForm rsvpForm = RsvpForm(nameController.text, mobileNoController.text,
          emailController.text, responseController.text);

      FormController formController = FormController();

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Submitting')));

      // Submit 'feedbackForm' and save it in Google Sheets.
      formController.submitForm(rsvpForm, (String response) {
        print("Response: $response");

        if (response == FormController.STATUS_SUCCESS) {
          // Feedback is saved succesfully in Google Sheets.

          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Submitted')));
        } else {
          // Error Occurred while saving data in Google Sheets.
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Error occured!')));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Add TextFormFields and ElevatedButton here.
          TextFormField(
            //The validator receives the text that the user has entered.
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Name',
            ),
            onSaved: (String? value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter Valid Name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: mobileNoController,
            validator: (value) {
              if (value!.trim().length != 10) {
                return 'Enter 10 Digit Mobile Number';
              }
              return null;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Mobile Number',
            ),
          ),
          TextFormField(
            controller: emailController,
            validator: (value) {
              if (!value!.contains("@")) {
                return 'Enter Valid Email';
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
              controller: responseController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter Valid Response';
                }
                return null;
              },
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(labelText: 'Feedback')),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: _submitForm,
              child: Text('Submit Feedback'),
            ),
          )
        ],
      ),
    );
  }
}
