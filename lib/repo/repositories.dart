import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ticketapp/model/allTicketModel.dart';

Dio _dio = Dio();

class TicketRepository {
  String BASE_URL =
      "https://dev.citytech.global/web-api/finpos-dev-mobile-support-backend/";
  String getAllTickets = "v1/mobile-support/tickets/all-tickets-details";
  String myTickets = "v1/mobile-support/tickets/my-tickets-details/{userId}";
  Future getAllTicket() async {
    var response = await _dio.get(BASE_URL + getAllTickets);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.data);
      var tickets = TicketModel.fromJson(result);
      return tickets;
    } else {
      throw Exception(response.statusMessage);
    }
  }
}
