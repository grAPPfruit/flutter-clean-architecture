import 'package:flutter/material.dart';
import 'package:flutter_architecture/util/app_physics.dart';
import 'package:flutter_architecture/value/colors.dart';
import 'package:flutter_architecture/widget/custom_app_bar.dart';
import 'package:flutter_architecture/widget/white_text_button.dart';
import 'package:get_version/get_version.dart';

class DebugInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DebugInfoPageState();
}

class _DebugInfoPageState extends State<DebugInfoPage> {
  String _platformVersion = "";
  String _versionName = "";
  String _buildNumber = "";
  String _appId = "";
  String _appName = "";

  @override
  void initState() {
    super.initState();
    _getPlatformVersion();
    _getVersionName();
    _getVersionCode();
    _getAppId();
    _getAppName();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      );

  Widget _buildAppBar() {
    return CustomAppBar(
      context: context,
      title: "Debug Information",
      showDebugInfo: false,
    );
  }

  Widget _buildBody() => ListView(
        physics: appScrollPhysics(),
        children: <Widget>[
          _buildInfoItem("Running on", "$_platformVersion"),
          Divider(),
          _buildInfoItem("Version name", "$_versionName"),
          Divider(),
          _buildInfoItem("Build number", "$_buildNumber"),
          Divider(),
          _buildInfoItem("App id", "$_appId"),
          Divider(),
          _buildInfoItem("App name", "$_appName"),
          Divider(),
          Padding(padding: EdgeInsets.only(bottom: 8)),
          _buildCrashButton(),
          Padding(padding: EdgeInsets.only(bottom: 16)),
        ],
      );

  Widget _buildInfoItem(String title, String message) => ListTile(
        title: Text(title),
        subtitle: Text(message),
      );

  Widget _buildCrashButton() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: WhiteTextButton(
          color: ThemeColors.primary,
          child: Text("force crash"),
          onPressed: () => throw new Exception("forced crash"),
        ),
      );

  Future _getPlatformVersion() async {
    String platformVersion;
    try {
      platformVersion = await GetVersion.platformVersion;
    } catch (_) {
      platformVersion = 'Failed to get platform version.';
    }
    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future _getVersionName() async {
    String versionName;
    try {
      versionName = await GetVersion.projectVersion;
    } catch (_) {
      versionName = 'Failed to get version name.';
    }
    setState(() {
      _versionName = versionName;
    });
  }

  Future _getVersionCode() async {
    String buildNumber;
    try {
      buildNumber = await GetVersion.projectCode;
    } catch (_) {
      buildNumber = 'Failed to get build number.';
    }
    setState(() {
      _buildNumber = buildNumber;
    });
  }

  Future _getAppId() async {
    String appId;
    try {
      appId = await GetVersion.appID;
    } catch (_) {
      appId = 'Failed to get app id.';
    }
    setState(() {
      _appId = appId;
    });
  }

  Future _getAppName() async {
    String appName;
    try {
      appName = await GetVersion.appName;
    } catch (_) {
      appName = 'Failed to get app name.';
    }
    setState(() {
      _appName = appName;
    });
  }
}
