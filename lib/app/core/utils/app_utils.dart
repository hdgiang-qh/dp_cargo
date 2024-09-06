import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../../generated/l10n.dart';
import '../../network/exceptions/api_exception.dart';
import '../../network/exceptions/app_exception.dart';
import '../../network/exceptions/json_format_exception.dart';
import '../../network/exceptions/network_exception.dart';
import '../../network/exceptions/not_found_exception.dart';
import '../../network/exceptions/service_unavailable_exception.dart';
import '../../network/exceptions/unauthorize_exception.dart';

mixin AppUtilsAction<C extends StatefulWidget> on State<C> {
  bool isShowDialog = false;

  S get appLocalization => S.of(context);

  TextTheme get textTheme => Theme.of(context).textTheme;

  void showLoading() {
    if (isShowDialog) {
      return;
    }
    isShowDialog = true;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(children: [
            const CircularProgressIndicator(),
            Container(margin: const EdgeInsets.only(left: 7), child: const Text('Loading...')),
          ]),
        );
      },
    );
  }

  Future<bool?> showDialogConfirm(String title, {required String confirmTitle}) {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(appLocalization.confirm, style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 12),
                  Text(
                    title,
                    style: textTheme.titleMedium?.copyWith(
                      color: const Color(0xff52535C),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffFFF0F0), foregroundColor: const Color(0xffE13153)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(appLocalization.back),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          child: Text(confirmTitle),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  void showErrorMessage(String error) {
    dismissLoading();
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
                color: const Color(0xffCC382F).withOpacity(0.2),
                border: Border.all(color: const Color(0xffCC382F), width: 2),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                const Icon(
                  Icons.warning,
                  color: Color(0xffCC382F),
                ),
                const SizedBox(width: 10),
                Flexible(
                    child: Text(
                  error,
                  style: const TextStyle(color: Color(0xffCC382F)),
                )),
              ],
            ),
          ),
        );
      },
    );
  }

  void showSuccess({String? msg}) {
    dismissLoading();
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
                color: const Color(0xff00A43A).withOpacity(0.1),
                border: Border.all(color: const Color(0xff00A43A), width: 2),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                const Icon(
                  Icons.check,
                  color: Color(0xff00A43A),
                ),
                const SizedBox(width: 10),
                Flexible(
                    child: Text(
                  msg ?? 'Success',
                  style: const TextStyle(color: Color(0xff00A43A)),
                )),
              ],
            ),
          ),
        );
      },
    );
  }

  void dismissLoading() {
    if (isShowDialog) {
      isShowDialog = false;
      Navigator.pop(context);
    }
  }

  dynamic callDataService<T>(
    Future<T> future, {
    Function(Exception exception)? onError,
    Function(T response)? onSuccess,
    Function? onStart,
    Function? onComplete,
  }) async {
    Exception? _exception;

    onStart == null ? showLoading() : onStart();

    try {
      final T response = await future;

      if (onSuccess != null) {
        dismissLoading();
        onSuccess(response);
      }
      onComplete == null ? dismissLoading() : onComplete();
      return response;
    } on ServiceUnavailableException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on UnauthorizedException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on TimeoutException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message ?? 'Timeout exception');
    } on NetworkException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on JsonFormatException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on NotFoundException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on ApiException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on AppException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } catch (error) {
      _exception = AppException(message: "$error");
      Logger().e("Controller>>>>>> error $error");
    } finally {
      dismissLoading();
    }
    if (onError != null) onError(_exception);

    onComplete == null ? dismissLoading() : onComplete();
  }

}
