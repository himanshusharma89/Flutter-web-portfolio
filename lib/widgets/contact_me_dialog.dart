import 'package:flutter/material.dart';
import '../helpers/colors.dart';

import '../main.dart';
import 'button.dart';

class ContactMeDialog extends StatefulWidget {
  const ContactMeDialog({Key? key}) : super(key: key);

  @override
  _ContactMeDialogState createState() => _ContactMeDialogState();
}

class _ContactMeDialogState extends State<ContactMeDialog> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  String status = '';

  static Pattern patternEmail =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regexEmail = RegExp(patternEmail.toString());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BackdropFilter(
      filter: imageFilter,
      child: Dialog(
        child: Container(
          width: width * 0.55,
          height: height * 0.6,
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  color: ProfileColors.formColor,
                  child: TextFormField(
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Enter Valid Name';
                      }
                      return null;
                    },
                    controller: _nameController,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        hintText: 'Name',
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ProfileColors.formColor, width: 2))),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  color: ProfileColors.formColor,
                  child: TextFormField(
                    validator: (String? value) {
                      if (!regexEmail.hasMatch(value!.trim())) {
                        return 'Enter Valid Email';
                      }
                      return null;
                    },
                    controller: _emailController,
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        hintText: 'Email Address',
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ProfileColors.formColor, width: 2))),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  color: ProfileColors.formColor,
                  child: TextFormField(
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Enter Valid Message';
                      }
                      return null;
                    },
                    minLines: 6,
                    maxLines: 8,
                    style: const TextStyle(fontFamily: 'Poppins'),
                    controller: _messageController,
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        hintText: 'Your Message',
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ProfileColors.formColor, width: 2))),
                  ),
                ),
                ProfileButton(
                  text: 'Send The Message',
                  onTap: () => _submitForm(),
                ),
                const SizedBox(height: 10),
                Text(
                  status,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, proceed.
      // final MessageModel feedbackForm = MessageModel(
      //     name: _nameController.text,
      //     email: _emailController.text,
      //     message: _messageController.text);

      // final MessageFormController formController = MessageFormController();

      setState(() {
        status = 'Submitting Message';
      });

      // Submit 'feedbackForm' and save it in Google Sheets.
      // formController.submitForm(feedbackForm, (String response) {
      //   debugPrint('Response: $response');
      //   if (response == MessageFormController.STATUS_SUCCESS) {
      //     // Feedback is saved succesfully in Google Sheets.
      //     debugPrint('Feedback Submitted');
      //     ScaffoldMessenger.of(context).showSnackBar(
      //         const SnackBar(content: Text('Feedback Submitted')));
      //   } else {
      //     debugPrint('Error Occurred!');
      //     // Error Occurred while saving data in Google Sheets.
      //     ScaffoldMessenger.of(context)
      //         .showSnackBar(const SnackBar(content: Text('Error Occurred!')));
      //   }
      // });
    }
  }
}
