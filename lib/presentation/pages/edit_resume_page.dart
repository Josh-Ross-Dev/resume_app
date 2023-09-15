import 'package:flutter/material.dart';
import 'package:flutter_projects/model/resume_info.dart';
import 'package:flutter_projects/presentation/widgets/app_button.dart';
import 'package:flutter_projects/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_projects/presentation/widgets/input_box.dart';
import 'package:flutter_projects/util/bio_icons_icons.dart';
import '../../main.dart';

class EditResumePage extends StatefulWidget {
  const EditResumePage({super.key, required this.resumeInfo});

  final ResumeInfo resumeInfo;

  @override
  State<EditResumePage> createState() => _EditResumePageState();
}

class _EditResumePageState extends State<EditResumePage> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController slackNameController = TextEditingController();
  final TextEditingController githubNameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fullNameController.text = widget.resumeInfo.fullName;
    slackNameController.text = widget.resumeInfo.slackUserName;
    githubNameController.text = widget.resumeInfo.githubHandle;
    bioController.text = widget.resumeInfo.bioDetails;
    }

  @override
  void dispose() {
    fullNameController.dispose();
    slackNameController.dispose();
    githubNameController.dispose();
    bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final notifier = ResumeContainer.of(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: const CustomAppBar(text: 'Edit Résumé'),
      body: ListenableBuilder(
        listenable: notifier,
        builder: (BuildContext context, Widget? child) {
          return SingleChildScrollView(
            child: Form(
              key:_formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    InputBox(
                      labelText: 'FullName',
                      isFirst: true,
                      suffixIcon: const Icon(BioIcons.user),
                      controller: fullNameController,
                    ),
                    InputBox(
                      labelText: 'Slack Username',
                      suffixIcon: const Icon(BioIcons.slack),
                      controller: slackNameController,
                    ),
                    InputBox(
                      labelText: 'Github Handle',
                      suffixIcon: const Icon(BioIcons.github),
                      controller: githubNameController,
                    ),
                    InputBox(
                      isLast: true,
                      labelText: 'About me',
                      suffixIcon: const Icon(Icons.book),
                      controller: bioController,
                    ),

                    AppButton(
                        onPressed: (){
                          if (_formKey.currentState!.validate()) {
                            final info = ResumeInfo(
                                fullName: fullNameController.text,
                                slackUserName: slackNameController.text,
                                githubHandle: githubNameController.text,
                                bioDetails: bioController.text);
                            notifier.updateResumeInfo(info);
                            Navigator.pop(context,);
                          }else{
                            ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content: Text('Please fill in all fields')));
                          }

                        },
                        buttonText: 'Save'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
