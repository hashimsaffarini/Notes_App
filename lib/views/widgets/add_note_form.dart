import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_button.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> form = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: form,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          const SizedBox(height: 32),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hintText: 'Title',
          ),
          const SizedBox(height: 16),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            hintText: 'Content',
            maxLines: 5,
          ),
          const SizedBox(height: 32),
          CustomButton(
            onTap: () {
              if (form.currentState!.validate()) {
                form.currentState!.save();
              } else {
                setState(() {
                  autoValidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
          const SizedBox(height: 16)
        ],
      ),
    );
  }
}
