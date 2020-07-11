
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:maxeem_gallery/ui/ui.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

///
/// App common utils
///

bool isEmpty(String s)    => s?.trim()?.isEmpty    ?? true;
bool isNotEmpty(String s) => s?.trim()?.isNotEmpty ?? false;

twitterUrlByUser(String user) => 'https://twitter.com/$user';
instagramUrlByUser(String user) => 'https://www.instagram.com/$user';

launchUrl(String url) {
  print(url);
  launcher.launch(url);
}
launchTwitter(String user)   => launchUrl(twitterUrlByUser(user));
launchInstagram(String user) => launchUrl(instagramUrlByUser(user));

copyToClipboard(String text, {BuildContext ctx, String toastMsg}) {
  Clipboard.setData(ClipboardData(text: text));
  if (toastMsg != null && ctx != null)
    toast(ctx, toastMsg);
}

String prepareAvatarUrl(Window window, int size, String url, ) {
  final uri = Uri.parse(url);
  final params = Map.of(uri.queryParameters);
  params['w'] = '$size';
  params['h'] = '$size';
  params['dpr'] = '${window.devicePixelRatio}';
  return Uri.https(uri.host, uri.path, params).toString();
}

String preparePhotoUrl(Window window, Size size, String url) => '$url&w=${size.width}&dpr=${window.devicePixelRatio}';
