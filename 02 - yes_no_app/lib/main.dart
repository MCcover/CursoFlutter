import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/configurations/theme/app_theme.dart';
import 'package:yes_no_app/pages/chat/chat_page.dart';
import 'package:yes_no_app/providers/chat_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
          title: 'Yes No App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme(selectedColor: ColorsEnum.blue).theme(),
          home: const ChatPage()),
    );
  }
}

