import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_base/presentation/base/base_page.dart';
import 'package:flutter_project_base/presentation/resources/locale_keys.dart';
import 'package:flutter_project_base/presentation/router/app_router.gr.dart';
import 'package:flutter_project_base/presentation/views/pages/login/login_cubit.dart';
import 'package:flutter_project_base/presentation/views/pages/login/login_state.dart';
import 'package:flutter_project_base/presentation/views/widgets/app_checkbox.dart';
import 'package:flutter_project_base/presentation/views/widgets/app_form_field.dart';
import 'package:flutter_project_base/presentation/views/widgets/app_text.dart';
import 'package:flutter_project_base/shared/common/error_entity.dart';
import 'package:flutter_project_base/shared/common/validation_model.dart';
import 'package:flutter_project_base/shared/extensions/context_extensions.dart';

@RoutePage()
class LoginPage extends BasePage<LoginCubit, LoginState> {
  const LoginPage({super.key});

  @override
  Widget builder(context, cubit, state) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 250),
            AppText(
              LocaleKeys.login_title,
              style: context.theme.textTheme.headlineLarge,
              color: Colors.red,
            ).tr(),
            BlocSelector<LoginCubit, LoginState,
                (ValidationModel<String>, ErrorEntity?)>(
              selector: (state) => (state.username, state.errorEntity),
              builder: (context, data) {
                return AppFormField(
                  value: data.$1,
                  error: data.$2,
                  decoration: const InputDecoration(hintText: 'Username'),
                  onChanged: cubit.updateUsername,
                );
              },
            ),
            const SizedBox(height: 8),
            BlocSelector<LoginCubit, LoginState,
                (ValidationModel<String>, ErrorEntity?)>(
              selector: (state) => (state.password, state.errorEntity),
              builder: (context, state) {
                return AppFormField(
                  value: state.$1,
                  error: state.$2,
                  decoration: const InputDecoration(hintText: 'Password'),
                  onChanged: cubit.updatePassword,
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                BlocSelector<LoginCubit, LoginState, bool>(
                  selector: (LoginState state) => state.isRemember,
                  builder: (BuildContext context, bool isRememberMe) {
                    return AppCheckBox(
                      value: isRememberMe,
                      onChanged: cubit.updateRememberMe,
                    );
                  },
                ),
                const Text(LocaleKeys.login_remember_me).tr(),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text(LocaleKeys.login_forgot_password).tr(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await cubit.login();
                context.pushRoute(const StartRoute());
              },
              child: const Text(LocaleKeys.login_title).tr(),
            ),
          ],
        ),
      ),
    );
  }
}
