import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trashtrack_user/blocs/post/add_post/add_post_bloc.dart';
import 'package:trashtrack_user/blocs/post/get_posts/get_posts_bloc.dart';
import 'package:trashtrack_user/helpers/message_dialog_helper.dart';
import 'package:trashtrack_user/models/post/post.dart';
import 'package:trashtrack_user/validators/body_validator.dart';
import 'package:trashtrack_user/validators/title_validator.dart';
import 'package:trashtrack_user/widgets/custom_app_bar.dart';
import 'package:trashtrack_user/widgets/custom_elevated_button.dart';
import 'package:trashtrack_user/widgets/custom_text_field.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _addPost() {
    final formState = _formKey.currentState;

    if (formState != null) {
      if (formState.validate()) {
        BlocProvider.of<AddPostBloc>(context).add(
          AddPostEvent(
            Post(
              id: '0',
              title: _titleController.text.trim(),
              body: _bodyController.text.trim(),
              image: _image,
            ),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add Post'),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                CustomTextField(
                  textController: _titleController,
                  prefixIcon: Icons.forum,
                  labelText: 'Title',
                  onPressed: () => _titleController.clear(),
                  suffixIcon: Icons.clear,
                  validator: titleValidator,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  textController: _bodyController,
                  prefixIcon: Icons.description,
                  labelText: 'Body',
                  onPressed: () => _bodyController.clear(),
                  suffixIcon: Icons.clear,
                  validator: bodyValidator,
                  maxLines: 5,
                ),
                const SizedBox(height: 15),
                _setImageWidget(),
                const SizedBox(height: 15),
                CustomElevatedButton(
                  onPressed: _pickImage,
                  isExpanded: true,
                  backgroundColor: Colors.blue,
                  labelText: 'Upload',
                ),
                const SizedBox(height: 25),
                buildAPBC(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _setImageWidget() {
    Widget widget = const Text('No image selected');

    if (_image != null) {
      widget = Image.file(
        _image!,
        width: double.maxFinite,
        height: 200,
        fit: BoxFit.fill,
      );
    }

    return widget;
  }

  BlocConsumer<AddPostBloc, AddPostState> buildAPBC() {
    return BlocConsumer<AddPostBloc, AddPostState>(
      listener: (BuildContext context, AddPostState state) {
        if (state is AddPostSuccessfulState) {
          BlocProvider.of<GetPostsBloc>(context).add(
            GetPostsEvent(),
          );

          Navigator.pop(context);
        }

        if (state is AddPostErrorState) {
          MessageDialogHelper.showErrorDialog(
            context,
            'Adding Error',
            state.message,
          );
        }
      },
      builder: (BuildContext context, AddPostState state) {
        if (state is AddPostProcessingState) {
          return const CircularProgressIndicator();
        } else {
          return buildAddButton();
        }
      },
    );
  }

  CustomElevatedButton buildAddButton() {
    return CustomElevatedButton(
      onPressed: _addPost,
      isExpanded: true,
      labelText: 'Add',
    );
  }
}
