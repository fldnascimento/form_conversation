import '../../../core/controller.dart';
import '../../models/form_item.dart';
import 'form_state.dart';

class FormController extends Controller<FormState> {
  FormController()
      : super(
          const FormState(
            status: FormStateStatus.initial,
            formScreenItems: [],
          ),
        );

  void init(List<FormItem> formItems) {
    emit(
      state.copyWith(
        formItems: formItems,
        currentItem: formItems.first,
        status: FormStateStatus.editing,
        formScreenItems: [],
      ),
    );
  }

  Future<void> addScreen(FormItem item) async {
    emit(state.copyWith(status: FormStateStatus.loading));
    await Future.delayed(Duration(milliseconds: item.delay), () async {
      emit(
        state.copyWith(
          formScreenItems: [...state.formScreenItems, item],
          status: FormStateStatus.editing,
        ),
      );
    });
  }

  void buildCurrentItem() {
    // first item
    if (state.formScreenItems.isEmpty) {
      addScreen(state.currentItem!);
      return;
    }

    // build next item
    if (buildNextItem) {
      int indexItem = state.formScreenItems.length;
      addScreen(state.formItems![indexItem]);
      return;
    }
  }

  bool get buildNextItem {
    bool notItemLast = state.formItems!.length > state.formScreenItems.length;
    return notItemLast;
  }

  void next({int jump = 0}) {}
}
