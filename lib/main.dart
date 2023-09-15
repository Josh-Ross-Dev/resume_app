import 'package:flutter/material.dart';
import 'package:flutter_projects/presentation/pages/resume_page.dart';
import 'package:flutter_projects/service/custom_provider.dart';

void main() {
  runApp(const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResumeContainer(
      resumeController: ResumeController(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const ResumePage(),
      ),
    );
  }
}

class ResumeContainer extends InheritedWidget{
  const ResumeContainer({
    required this.resumeController,
    required super.child,
  });

  final ResumeController resumeController;

  @override
  bool updateShouldNotify(ResumeContainer oldWidget) {
    return oldWidget.resumeController != resumeController;
  }

  static ResumeController of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<ResumeContainer>()!.resumeController;
  }
  
}