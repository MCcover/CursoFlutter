import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswere {
  Future<Message> getAnswer() async {

    final dio = Dio();

    final response = await dio.get("https://yesno.wtf/api");

    
    final yesNo = YesNoModel.fromJson(response.data);

    return yesNo.toMessageEntity();

  }
}