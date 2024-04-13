import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';
import 'package:notes_app/views/widgets/edit_list_view_colors.dart';

class EditNoteViewBody extends StatefulWidget {
  final NoteModel note;
  const EditNoteViewBody({super.key, required this.note});

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 55),
          CustomAppBar(
              title: 'Edit Note',
              icon: Icons.check,
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = content ?? widget.note.subTitle;

                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              }),
          const SizedBox(height: 50),
          CustomTextField(
            hintText: 'Title',
            onChanged: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            onChanged: (value) {
              content = value;
            },
            hintText: 'Content',
            maxLines: 5,
          ),
          const SizedBox(height: 16),
          EditColorsListView(
            note: widget.note,
          ),
        ],
      ),
    );
  }
}
