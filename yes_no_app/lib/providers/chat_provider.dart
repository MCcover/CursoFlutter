import 'package:flutter/material.dart';
import 'package:yes_no_app/configurations/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();

  List<Message> messages = [
    Message(text: 'No lo puedo creer, no lo puedo creer', fromWho: FromWho.mine),
    Message(text: 'Soy tu fan!!!', fromWho: FromWho.mine)
  ];

  Future<void> sendMessage(String text) async {

    if(text.isEmpty) {
      return;
    }  

    final newMessage = Message(text: text, fromWho: FromWho.mine);

    messages.add(newMessage);
    notifyListeners();
    moveScrollToBottom();
    
    if(text.endsWith('?')) {
      await otherReply();
    }
  }

  Future<void> otherReply() async {
    final otherResponse = await GetYesNoAnswere().getAnswer();

    messages.add(otherResponse);

    notifyListeners();

    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {

    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease
    );

  }
}