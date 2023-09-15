import 'package:flutter/material.dart';
import 'package:flutter_projects/main.dart';
import 'package:flutter_projects/presentation/pages/edit_resume_page.dart';
import 'package:flutter_projects/presentation/widgets/app_button.dart';
import 'package:flutter_projects/util/bio_icons_icons.dart';
import '../widgets/custom_app_bar.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {

    final notifier = ResumeContainer.of(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: const CustomAppBar(text: 'Résumé',),
      body: ListenableBuilder(
        listenable: notifier,
        builder: (BuildContext context, Widget? child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 100.0,
                    margin: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: Colors.grey,
                        image: const DecorationImage(
                            image: AssetImage('assets/user-image.jpeg'),
                          fit: BoxFit.cover
                        )
                    ),
                  ),
                  _buildInfoRow(BioIcons.user, notifier.myResumeInfo.fullName),
                  _buildInfoRow(BioIcons.slack, notifier.myResumeInfo.slackUserName),
                  _buildInfoRow(BioIcons.github, notifier.myResumeInfo.githubHandle),
                  const SizedBox(height: 20.0,),
                  Text(
                    notifier.myResumeInfo.bioDetails,
                  ),

                  AppButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditResumePage(resumeInfo: notifier.myResumeInfo,)));
                    },
                    buttonText: 'Edit Résumé',
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(icon),
                  const SizedBox(width: 5.0,),
                  Expanded(
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                      ),
                    ),
                  ),
                ],
              ),
    );
  }
}

