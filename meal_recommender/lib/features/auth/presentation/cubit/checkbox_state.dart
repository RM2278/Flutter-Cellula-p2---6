part of 'checkbox_cubit.dart';

sealed class CheckboxState {
  final bool isChecked;
  const CheckboxState(this.isChecked);
}

final class CheckboxInitial extends CheckboxState {
  const CheckboxInitial() : super(false);
}

final class CheckboxToggled extends CheckboxState {
  const CheckboxToggled(bool isChecked) : super(isChecked);
}
