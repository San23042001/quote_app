import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_app/core/app_theme.dart';
import 'package:quote_app/get_it/injectable.dart';
import 'package:quote_app/presentation/cubit/favourite_cubit/favourite_cubit.dart';
import 'package:quote_app/presentation/cubit/quote_cubit/quote_cubit.dart';
import 'package:quote_app/router/router.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<QuoteCubit>()..fetchRandomQuote()),
        BlocProvider(create: (_) => getIt<FavoritesCubit>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        routerConfig: appRouter,
      ),
    );
  }
}
