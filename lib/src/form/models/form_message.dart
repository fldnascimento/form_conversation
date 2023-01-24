import '../../../form_conversation.dart';
import 'form_base.dart';

class FormMessage extends FormBase {
  final String text;

  FormMessage({
    required this.text,
    super.delay = -1,
  }) : super(
          widget: FormCard(
            text: text,
          ),
        );

  @override
  int get delay {
    if (super.delay == -1) {
      return delayCalc(text);
    }
    return super.delay;
  }
}
