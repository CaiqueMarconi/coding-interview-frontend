import 'package:flutter_triple/flutter_triple.dart';

abstract base class NewStore<State extends Object> extends Store<State> {
  NewStore(super.initialState);

  bool get hasError => triple.event == TripleEvent.error;
}
