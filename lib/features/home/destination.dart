import 'package:flutter/cupertino.dart';

class DestinationPage extends StatefulWidget {
  final Route<dynamic>? Function(RouteSettings) onGenerateRoute;
  const DestinationPage({super.key, required this.onGenerateRoute});

  @override
  State<DestinationPage> createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: widget.onGenerateRoute,
    );
  }
}
