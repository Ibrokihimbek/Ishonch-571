import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishonch/cubit/connectivity/connectivity_cubit.dart';
import 'package:ishonch/utils/app_image.dart';

class NoInternetScreen extends StatelessWidget {
  final VoidCallback voidCallback;

  const NoInternetScreen({required this.voidCallback, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocListener<ConnectivityCubit, ConnectivityState>(
        listener: (context, state) {
          if (state.connectivityResult != ConnectivityResult.none) {
            voidCallback.call();
            Navigator.pop(context);
          }
        },
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    AppImages.noInternet,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Internetingizni yoqing!",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
