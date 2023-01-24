import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class TicketEvent extends Equatable {
  const TicketEvent();
}

class LoadTicketEvent extends TicketEvent {
  @override
  List<Object> get props => [];
}
