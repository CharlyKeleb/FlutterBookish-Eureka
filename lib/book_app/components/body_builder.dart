import 'package:flutter/material.dart';
import 'package:flutter_web_projects/book_app/enum/api_request_status.dart';

import 'error/error_widget.dart';

class BodyBuilder extends StatelessWidget {
  final APIRequestStatus? apiRequestStatus;
  final Widget? child;
  final Function() reload;

  const BodyBuilder(
      {Key? key,
      required this.apiRequestStatus,
      required this.child,
      required this.reload})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    switch (apiRequestStatus) {
      case APIRequestStatus.loading:
        return Center(
          child: Container(
            height: 50.0,
            width: 50.0,
            child: Center(child: const CircularProgressIndicator()),
          ),
        );
      case APIRequestStatus.unInitialized:
        return Center(
          child: Container(
            height: 50.0,
            width: 50.0,
            child: Center(child: const CircularProgressIndicator()),
          ),
        );
      case APIRequestStatus.connectionError:
        return MyErrorWidget(
          refreshCallBack: reload,
          isConnection: true,
        );
      case APIRequestStatus.error:
        return MyErrorWidget(
          refreshCallBack: reload,
          isConnection: false,
        );
      case APIRequestStatus.loaded:
        return child!;
      default:
        return Center(
          child: Container(
            height: 50.0,
            width: 50.0,
            child: Center(child: const CircularProgressIndicator()),
          ),
        );
    }
  }
}
