import 'package:equatable/equatable.dart';
import 'package:ticketapp/model/allTicketModel.dart';

abstract class TicketState extends Equatable {}

class TicketLoadingState extends TicketState {
  @override
  List<Object?> get props => [];
}

class TicketLoadedState extends TicketState {
  TicketLoadedState(this.tickets);
  var tickets;
  @override
  List<Object?> get props => [tickets];
}

class TicketErrorState extends TicketState {
  TicketErrorState(this.error);
  var error;
  @override
  List<Object?> get props => [error];
}
