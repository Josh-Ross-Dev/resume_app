import 'package:flutter/cupertino.dart';
import '../model/resume_info.dart';

class ResumeController extends ChangeNotifier{

  ResumeInfo myResumeInfo = ResumeInfo(
    fullName: 'Ugwuta Kingsley',
    slackUserName: 'Ugwuta Kingsley',
    githubHandle: 'Josh-Ross-Dev',
    bioDetails: 'More than 2+ years experience as a Mobile App Developer. I possess a deep understanding and have a comprehensive '
        'grasp of designing and developing mobile applications '
        'for both native and cross platform. ',
  );

  void updateResumeInfo(ResumeInfo resumeInfo){
    myResumeInfo = resumeInfo;
    notifyListeners();
  }

}
