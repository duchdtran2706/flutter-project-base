import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_base/presentation/base/base_cubit.dart';

import 'base_state.dart';

abstract class BaseWidget<C extends BaseCubit<S>, S extends BaseState>
    extends StatelessWidget {
  const BaseWidget({super.key});

  bool rebuildWhen(BuildContext context, S preState, S state) {
    return false;
  }

  Widget builder(BuildContext context, C cubit, S state);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<C, S>(
      buildWhen: (preState, state) => rebuildWhen(context, preState, state),
      builder: (context, state) {
        return builder(context, context.read<C>(), state);
      },
    );
  }
}
