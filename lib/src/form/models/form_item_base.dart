import '../widgets/form_card.dart';

abstract class FormItemBase {
  final FormCard card;
  final int delay;

  const FormItemBase({
    required this.card,
    required this.delay,
  });
}
