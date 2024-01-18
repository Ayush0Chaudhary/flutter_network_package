import 'package:dart_openai/dart_openai.dart';

import '../panda.dart';

class MoreInfo {
  final nullChat = OpenAIChatCompletionModel(
      id: "",
      choices: const [],
      created: DateTime.now(),
      usage: const OpenAIChatCompletionUsageModel(
          completionTokens: -1, promptTokens: -1, totalTokens: -1), systemFingerprint: '');
  final List<OpenAIChatCompletionChoiceMessageContentItemModel> inst = [OpenAIChatCompletionChoiceMessageContentItemModel.text("Give more information about this message which I recieved as reponse of my api request"),];
  Future<void> getInfo(String errorMessage) async {

    OpenAIChatCompletionModel chatCompletion =
        await OpenAI.instance.chat.create(
      model: "gpt-3.5-turbo",
      messages: [
         OpenAIChatCompletionChoiceMessageModel(
            role: OpenAIChatMessageRole.system,
            content:
            // "You assess YouTube video JEE relevance with a YES or NO based on the title"
        inst
        ),
        OpenAIChatCompletionChoiceMessageModel(
          content:
          inst,
          // "title = '$message'",
          role: OpenAIChatMessageRole.user,
        ),
      ],
    ).then((value) {
      // setState(() {
      //   /// Stopping the loader
      //   loading = false;
      // });
      print("##########");
      print(value.choices.first.message.content);
      print("##########");
      print(value.choices.first.message);
      print("##########");
      print(value.choices.first);
      print("##########");
      print(value.choices);
      print("##########");
      print(value.usage);
      // if (value.choices.first.message.content?.toLowerCase() == "yes") {
      //   // setState(() {
      //   //   result = "Approved";
      //   // });
      // } else {
      //   // setState(() {
      //   //   result = "Denied";
      //   // });
      // }
      return value;
    }).catchError((error) {
      // setState(() {
      //   result = "Network Failed!";
      //   loading = false;
      // });
      // return nullChat;

    }).timeout(
        const Duration(
          seconds: 20,
        ), onTimeout: () {
          return nullChat;
      // setState(() {
      //   result = "Try Again! Network tooo Slow...";
      //   loading = false;
      // });
      // return nullChat;
    });
  }

}
