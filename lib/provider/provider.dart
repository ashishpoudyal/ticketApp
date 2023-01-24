import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketapp/apiconstant.dart';
import 'package:ticketapp/model/allTicketModel.dart';

class TicketProvider extends ChangeNotifier {
  final _dio = Dio();
  bool _isFetchData = false;
  bool get isFetchData => _isFetchData;

  bool _hasError = false;
  bool get hasError => _hasError;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;
 late TicketModel ticketModelData;
  _resetGetStatus() {
    _isFetchData = false;
    _hasError = false;
    _errorMessage = "";
  }

  fetchhTicket() async {
    try {
      _resetGetStatus();
      _isFetchData = true;

      final response = await _dio.get(
          "https://dev.citytech.global/web-api/finpos-dev-mobile-support-backend/v1/mobile-support/tickets/all-tickets-details");
      if (response.statusCode == 200) {
        log(response.data.toString());
        final temp = response.data;
        ticketModelData = TicketModel.fromJson(temp);
      }
    } catch (e) {
      log(e.toString());
    } finally {
      _isFetchData = false;
      notifyListeners();
    }
  }
}
