import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sppp/src/presentation/pages/student/profile/ProfileInfoContent.dart';
import 'package:sppp/src/presentation/pages/student/profile/bloc/ProfileInfoBloc.dart';
import 'package:sppp/src/presentation/pages/student/profile/bloc/ProfileInfoState.dart';

class ProfileInfoPage extends StatefulWidget {
  const ProfileInfoPage({super.key});

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<ProfileInfoBloc, ProfileInfoState>(
      builder: (context, state) {
        return ProfileInfoContent(state.user);
      },
    ));
  }
}