// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:ticketapp/blocs/app_blocs.dart';
// import 'package:ticketapp/blocs/app_events.dart';
// import 'package:ticketapp/blocs/app_state.dart';
// import 'package:ticketapp/repo/repositories.dart';
// import 'package:ticketapp/screen/homeScreen.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => TicketBloc(
//         RepositoryProvider.of<TicketRepository>(context),
//       )..add(
//           LoadTicketEvent(),
//         ),
//       // child: Scaffold(
//       //   appBar: AppBar(
//       //     title: Text("Home"),
//       //   ),
//       //   body:

//       //   BlocBuilder<TicketBloc, TicketState>(
//       //     builder: (context, state) {
//       //       if (state is TicketLoadingState) {
//       //         return Center(child: CircularProgressIndicator());
//       //       }
//       //       if (state is TicketLoadedState) {
//       //         return Container(
//       //           child: Text("Second state"),
//       //         );
//       //       }
//       //       if (state is TicketErrorState) {
//       //         return Center(
//       //           child: Text("Error"),
//       //         );
//       //       }
//       //       return Container();
//       //     },
//       //   ),
//       // ),

//       child: HomeScreen(),
//     );
//   }
// }
