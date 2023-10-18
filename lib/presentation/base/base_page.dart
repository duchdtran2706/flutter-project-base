import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_base/di/di.dart';
import 'package:flutter_project_base/presentation/base/base_cubit.dart';
import 'package:flutter_project_base/shared/common/error_entity.dart';
import 'package:flutter_project_base/shared/utils/alert.dart';
import 'package:flutter_project_base/shared/extensions/object_extensions.dart';

import 'base_state.dart';

abstract class BasePage<C extends BaseCubit<S>, S extends BaseState>
    extends StatefulWidget implements AutoRouteWrapper {
  const BasePage({super.key});

  bool rebuildWhen(BuildContext context, S preState, S state) {
    return false;
  }

  Widget builder(BuildContext context, C cubit, S state);

  void onInitState(BuildContext context) {}

  void onDispose(BuildContext context) {}

  C buildCubit(BuildContext context) {
    return getIt<C>();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<C>(
      create: (_) => buildCubit(context),
      child: this,
    );
  }

  @override
  BasePageState createState() => BasePageState<C, S>();
}

class BasePageState<C extends BaseCubit<S>, S extends BaseState>
    extends State<BasePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      widget.onInitState(context);
      context.read<C>().initData();
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.onDispose(context);
  }

  void handleError(
    BuildContext context,
    Object? error, [
    StackTrace? stackTrace,
  ]) {
    if (error is! ValidationError) {
      final message = error?.as<ErrorEntity>()?.message ?? 'Something error';
      getIt<AppAlertDialog>().show(context, type: AppAlertType.error, message: message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<C, S>(
          listenWhen: (preState, state) {
            return preState.processing != state.processing;
          },
          listener: (context, state) {
            if (state.processing) {
              getIt<AppAlertDialog>().show(context, type: AppAlertType.loading, message: 'Loading...');
            } else {
              Navigator.pop(context);
            }
          },
        ),
        BlocListener<C, S>(
          listenWhen: (preState, state) {
            return preState.errorEntity != state.errorEntity &&
                state.pageStatus == PageStatus.loaded;
          },
          listener: (context, state) {
            if (state.errorEntity != null) {
              handleError(context, state.errorEntity);
            }
          },
        ),
      ],
      child: BlocBuilder<C, S>(
        buildWhen: (preState, state) => preState.pageStatus != state.pageStatus,
        builder: (context, state) {
          return switch (state.pageStatus) {
            PageStatus.initial => const _InitialPage(),
            PageStatus.loading => const _LoadingPage(),
            PageStatus.loaded => widget.builder(
                context,
                context.read<C>(),
                context.read<C>().state,
              ),
            PageStatus.error => _ErrorPage(
                message: state.errorEntity?.message ?? '',
                retry: () {
                  context.read<C>().retry();
                },
              ),
          };
        },
      ),
    );
  }
}

class _InitialPage extends StatelessWidget {
  const _InitialPage();

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class _LoadingPage extends StatelessWidget {
  const _LoadingPage();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

class _ErrorPage extends StatelessWidget {
  const _ErrorPage({required this.message, required this.retry});

  final String message;
  final VoidCallback retry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: retry, child: const Text('Retry'))
          ],
        ),
      ),
    );
  }
}
