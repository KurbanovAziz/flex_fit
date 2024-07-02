import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void fitView(BuildContext context, String url) async {
  final Uri gritSlka = Uri.parse(url);
  if (!await launchUrl(gritSlka)) {
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Could not launch $url'),
      ),
    );
  }
}
