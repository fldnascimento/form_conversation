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

  void addScreen(FormItem item) {
    emit(state.copyWith(status: FormStateStatus.loading));
    Future.delayed(Duration(milliseconds: item.delay), () async {
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
    } else if (buildNextItem) { // build next item
      int indexItem = state.formScreenItems.length - 1;
      addScreen(state.formItems![indexItem]);
    }
  }

  bool get buildNextItem {
    bool current = state.formScreenItems.isNotEmpty &&
        state.formScreenItems.last == state.currentItem;
    bool notItemLast = state.formItems!.length > state.formScreenItems.length;
    return current && notItemLast;
  }

  void next({int jump = 0}) {}
}
