import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommender/features/profile/presentation/cubit/profile_cubit.dart';


import '../../../../core/dl/Dependency_Injection.dart';
import 'Profile_Screen_Content.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (_) => sl<ProfileCubit>(),
      child: ProfileScreenContent(),

    );
  }
}

