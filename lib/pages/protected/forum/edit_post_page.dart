import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trashtrack_user/blocs/post/edit_post/edit_post_bloc.dart';
import 'package:trashtrack_user/blocs/post/get_posts/get_posts_bloc.dart';
import 'package:trashtrack_user/helpers/message_dialog_helper.dart';
import 'package:trashtrack_user/models/post/post.dart';
import 'package:trashtrack_user/validators/body_validator.dart';
import 'package:trashtrack_user/validators/title_validator.dart';
import 'package:trashtrack_user/widgets/custom_app_bar.dart';
import 'package:trashtrack_user/widgets/custom_cached_image.dart';
import 'package:trashtrack_user/widgets/custom_elevated_button.dart';
import 'package:trashtrack_user/widgets/custom_text_field.dart';

class EditPostPage extends StatefulWidget {
  const EditPostPage({super.key, required this.post});
  final Post post;

  @override
  State<EditPostPage> createState() => _EditPostPageState();
}

class _EditPostPageState extends State<EditPostPage> {
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

  void _editPost() {
    final formState = _formKey.currentState;

    if (formState != null) {
      if (formState.validate()) {
        BlocProvider.of<EditPostBloc>(context).add(
          EditPostEvent(
            widget.post.copyWith(
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
  void initState() {
    _titleController.text = widget.post.title;
    _bodyController.text = widget.post.body;

    super.initState();
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
      appBar: const CustomAppBar(title: 'Edit Post'),
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
                buildEPBC(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _setImageWidget() {
    Widget imageWidget = const Text('No image uploaded');

    String? url = widget.post.url;

    if (_image == null) {
      if (url != null && url.isNotEmpty) {
        imageWidget = CustomCachedImage(
          url: url,
          width: double.maxFinite,
          height: 200,
          fit: BoxFit.fill,
        );
      }
    } else {
      imageWidget = Image.file(
        _image!,
        width: double.maxFinite,
        height: 200,
        fit: BoxFit.fill,
      );
    }

    return imageWidget;
  }

  BlocConsumer<EditPostBloc, EditPostState> buildEPBC() {
    return BlocConsumer<EditPostBloc, EditPostState>(
      listener: (BuildContext context, EditPostState state) {
        if (state is EditPostSuccessfulState) {
          BlocProvider.of<GetPostsBloc>(context).add(
            GetPostsEvent(),
          );

          Navigator.pop(context);
        }

        if (state is EditPostErrorState) {
          MessageDialogHelper.showErrorDialog(
            context,
            'Editing Error',
            state.message,
          );
        }
      },
      builder: (BuildContext context, EditPostState state) {
        if (state is EditPostProcessingState) {
          return const CircularProgressIndicator();
        } else {
          return buildEditButton();
        }
      },
    );
  }

  CustomElevatedButton buildEditButton() {
    return CustomElevatedButton(
      onPressed: _editPost,
      isExpanded: true,
      labelText: 'Edit',
    );
  }
}
