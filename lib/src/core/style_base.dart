abstract class StyleBase<T> {
  const StyleBase();
  T copyWith();
  T merge(T? theme);
}
