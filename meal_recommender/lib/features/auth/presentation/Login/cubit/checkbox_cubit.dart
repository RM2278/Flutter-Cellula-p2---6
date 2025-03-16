import 'package:flutter_bloc/flutter_bloc.dart';

part 'checkbox_state.dart';

class CheckboxCubit extends Cubit<CheckboxState> {
  CheckboxCubit() : super(CheckboxInitial());

  void toggleCheckbox() {
    emit(CheckboxToggled(!state.isChecked));
  }
}
