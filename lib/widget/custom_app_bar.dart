import 'package:flutter/material.dart';
import 'package:flutter_architecture/common/presentation/router/router.dart';
import 'package:flutter_architecture/value/colors.dart';
import 'package:flutter_architecture/value/styles.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    @required BuildContext context,
    @required String title,
    bool showDebugInfo = true,
  }) : super(
          title: Text(title, style: Styles.appBarTitle),
          iconTheme: IconThemeData(color: ThemeColors.white),
          elevation: 0.5,
          backgroundColor: ThemeColors.primary,
          actions: <Widget>[
            showDebugInfo
                ? IconButton(
                    icon: Icon(Icons.info_outline),
                    tooltip: 'Debug Information',
                    onPressed: () => Router(context).toDebugInfo(),
                  )
                : Container()
          ],
        );
}
