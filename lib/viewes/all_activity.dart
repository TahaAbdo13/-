import 'package:financeapp/widgets/all_activity_body.dart';
import 'package:flutter/material.dart';


class AllActivity extends StatefulWidget {
  const AllActivity({super.key});
  static String id = "AllActivity";
  @override
  State<AllActivity> createState() => _AllActivityState();
}

class _AllActivityState extends State<AllActivity> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Activities"),
      ),
      body:const AllActivityBody()
    );
  }
}
