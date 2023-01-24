// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:ticketapp/blocs/app_events.dart';
// import 'package:ticketapp/blocs/app_state.dart';
// import 'package:ticketapp/repo/repositories.dart';

// class TicketBloc extends Bloc<TicketEvent, TicketState> {
//   final TicketRepository _ticketRepository;
//   TicketBloc(this._ticketRepository) : super(TicketLoadingState()) {
//     on<LoadTicketEvent>((event, emit) async {
//       emit(TicketLoadingState());
//       try {
//         final tickets = await _ticketRepository.getAllTicket();
//         emit(TicketLoadedState(tickets));
//       } catch (e) {
//         emit(TicketErrorState(e.toString()));
//       }
//     });
//   }
// }
