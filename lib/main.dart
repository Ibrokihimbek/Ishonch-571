import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishonch/app/app.dart';
import 'package:ishonch/app/app_bloc_observer.dart';
import 'package:ishonch/data/storage_repository/storage_repository.dart';
import 'package:ishonch/service/get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setup();
  StorageRepository.getInstance();
  Bloc.observer = AppBlocObserver();
  runApp(App());
}
