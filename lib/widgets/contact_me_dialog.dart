import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helpers/colors.dart';
import '../helpers/responsive_layout.dart';
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
          width: ResponsiveLayout.isSmallScreen(context)
              ? width * 0.65
              : width * 0.55,
          height: height * 0.55,
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Container(
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
                          contentPadding: EdgeInsets.all(12),
                          hintText: 'Name',
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: ProfileColors.formColor, width: 2))),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
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
                ),
                Flexible(
                  flex: 4,
                  child: Container(
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
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ProfileButton(
                        text: 'Send The Message',
                        onTap: () => _submitForm(),
                      ),
                      Expanded(
                        child: Text(
                          status,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: ResponsiveLayout.isSmallScreen(context)
                                ? 15
                                : 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {

      setState(() {
        status = 'Submitting Message';
      });

      // final MailOptions mailOptions = MailOptions(
      //     body: _messageController.text,
      //     subject: '${_messageController.text}|${_emailController.text}',
      //     recipients: <String>['contact@himanshusharma.tech'],
      //     ccRecipients: <String>[_emailController.text]);

      // String platformResponse;

      // try {
      //   final response = await FlutterMailer.send(mailOptions);
      //   switch (response) {
      //     case MailerResponse.saved:
      //       platformResponse = 'mail was saved to draft';
      //       break;
      //     case MailerResponse.sent:
      //       platformResponse = 'mail was sent';
      //       break;
      //     case MailerResponse.cancelled:
      //       platformResponse = 'mail was cancelled';
      //       break;
      //     case MailerResponse.android:
      //       platformResponse = 'intent was success';
      //       break;
      //     default:
      //       platformResponse = 'unknown';
      //       break;
      //   }
      //   status = platformResponse;
      // } on PlatformException catch (error) {
      //   status = error.toString();
      // }
      // setState(() {});
    }
  }
}
