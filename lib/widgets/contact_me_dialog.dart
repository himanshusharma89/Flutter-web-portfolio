import 'package:flutter/material.dart';

import 'package:my_portfolio/helpers/colors.dart';
import 'package:my_portfolio/helpers/responsive_layout.dart';
import 'package:my_portfolio/main.dart';
import 'package:my_portfolio/model/api/send_message.dart';
import 'package:my_portfolio/widgets/button.dart';

class ContactMeDialog extends StatefulWidget {
  const ContactMeDialog({super.key});

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
                            color: ProfileColors.formColor,
                            width: 2,
                          ),
                        ),
                      ),
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
                            color: ProfileColors.formColor,
                            width: 2,
                          ),
                        ),
                      ),
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
                            color: ProfileColors.formColor,
                            width: 2,
                          ),
                        ),
                      ),
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
                      ),
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
      final res = await sendMessage(
        name: _nameController.text,
        email: _emailController.text,
        message: _messageController.text,
      );
      if (res) {
        status = 'Message Sent';
        setState(() {});
        if (!context.mounted) return;
        Navigator.pop(context);
      } else {
        status = 'Not Sent';
        setState(() {});
      }
    }
  }
}
