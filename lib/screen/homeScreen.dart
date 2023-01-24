import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:ticketapp/model/allTicketModel.dart';

import '../provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<TicketProvider>().fetchhTicket();

    super.initState();
  }

  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),

    HomeScreen(),
    HomeScreen(),

    // HomeScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _ticketViewModel = context.watch<TicketProvider>();

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.airplane_ticket),
              label: 'Ticket',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
                backgroundColor: Colors.white),
          ],
          // type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          showUnselectedLabels: true,
          selectedLabelStyle:
              TextStyle(color: Colors.white54, fontWeight: FontWeight.w700),
          unselectedLabelStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
          unselectedItemColor: Colors.white,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        actions: [Icon(Icons.notifications)],
        title: Text("Home"),
      ),
      body: Builder(
        builder: (context) {
          if (_ticketViewModel.isFetchData) {
            return CircularProgressIndicator();
          }
          if (_ticketViewModel.hasError) {
            return Center(
              child: Text(_ticketViewModel.errorMessage.toString()),
            );
          } else
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Ticket Details",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Icon(
                                        Icons.menu,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(5),
                                            bottomRight: Radius.circular(5)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Icon(
                                          Icons.line_axis,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  DefaultTabController(
                    length: 4,
                    child: Column(
                      children: [
                        Container(
                          child: TabBar(
                              indicator: OutlineIndicator(
                                color: Colors.black,
                                radius: Radius.circular(5),
                              ),
                              labelColor: Colors.black,
                              indicatorColor: Colors.black,
                              tabs: [
                                Tab(
                                  text: "Day",
                                ),
                                Tab(
                                  text: "Week",
                                ),
                                Tab(
                                  text: "Month",
                                ),
                                Tab(
                                  text: "Year",
                                ),
                              ]),
                        ),
                        Container(
                          height: 400,
                          child: TabBarView(children: [
                            GridView.builder(
                                itemCount: _ticketViewModel
                                    .ticketModelData.data.dist.day.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 1.30,
                                        crossAxisCount: 2),
                                itemBuilder: (context, int index) {
                                  var item = _ticketViewModel
                                      .ticketModelData.data.dist.day;
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey)),
                                      height: 20,
                                      width: 50,
                                      child: Column(
                                        children: [
                                          Text(item[index].label),
                                          Text(item[index].value),
                                          Icon(Icons.airplane_ticket),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                            GridView.builder(
                                itemCount: _ticketViewModel
                                    .ticketModelData.data.dist.week.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 1.30,
                                        crossAxisCount: 2),
                                itemBuilder: (context, int index) {
                                  var item = _ticketViewModel
                                      .ticketModelData.data.dist.week;
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey)),
                                      height: 20,
                                      width: 50,
                                      child: Column(
                                        children: [
                                          Text(item[index].label),
                                          Text(item[index].value),
                                          Icon(Icons.airplane_ticket),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                            GridView.builder(
                                itemCount: _ticketViewModel
                                    .ticketModelData.data.dist.month.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 1.30,
                                        crossAxisCount: 2),
                                itemBuilder: (context, int index) {
                                  var item = _ticketViewModel
                                      .ticketModelData.data.dist.month;
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey)),
                                      height: 20,
                                      width: 50,
                                      child: Column(
                                        children: [
                                          Text(item[index].label),
                                          Text(item[index].value),
                                          Icon(Icons.airplane_ticket),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                            GridView.builder(
                                itemCount: _ticketViewModel
                                    .ticketModelData.data.dist.year.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 1.30,
                                        crossAxisCount: 2),
                                itemBuilder: (context, int index) {
                                  var item = _ticketViewModel
                                      .ticketModelData.data.dist.year;
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey)),
                                      height: 20,
                                      width: 50,
                                      child: Column(
                                        children: [
                                          Text(item[index].label),
                                          Text(item[index].value),
                                          Icon(Icons.airplane_ticket),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My Ticket Details",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Icon(
                                      Icons.menu,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(5),
                                          bottomRight: Radius.circular(5)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Icon(
                                        Icons.line_axis,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  DefaultTabController(
                    length: 4,
                    child: Column(
                      children: [
                        Container(
                          child: TabBar(
                              indicator: OutlineIndicator(
                                color: Colors.black,
                                radius: Radius.circular(5),
                              ),
                              labelColor: Colors.black,
                              indicatorColor: Colors.black,
                              tabs: [
                                Tab(
                                  text: "Day",
                                ),
                                Tab(
                                  text: "Week",
                                ),
                                Tab(
                                  text: "Month",
                                ),
                                Tab(
                                  text: "Year",
                                ),
                              ]),
                        ),
                        Container(
                          height: 400,
                          child: TabBarView(children: [
                            GridView.builder(
                                itemCount: _ticketViewModel
                                    .ticketModelData.data.dist.day.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 1.30,
                                        crossAxisCount: 2),
                                itemBuilder: (context, int index) {
                                  var item = _ticketViewModel
                                      .ticketModelData.data.dist.day;
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey)),
                                      height: 20,
                                      width: 50,
                                      child: Column(
                                        children: [
                                          Text(item[index].label),
                                          Text(item[index].value),
                                          Icon(Icons.airplane_ticket),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                            GridView.builder(
                                itemCount: _ticketViewModel
                                    .ticketModelData.data.dist.week.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 1.30,
                                        crossAxisCount: 2),
                                itemBuilder: (context, int index) {
                                  var item = _ticketViewModel
                                      .ticketModelData.data.dist.week;
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey)),
                                      height: 20,
                                      width: 50,
                                      child: Column(
                                        children: [
                                          Text(item[index].label),
                                          Text(item[index].value),
                                          Icon(Icons.airplane_ticket),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                            GridView.builder(
                                itemCount: _ticketViewModel
                                    .ticketModelData.data.dist.month.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 1.30,
                                        crossAxisCount: 2),
                                itemBuilder: (context, int index) {
                                  var item = _ticketViewModel
                                      .ticketModelData.data.dist.month;
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey)),
                                      height: 20,
                                      width: 50,
                                      child: Column(
                                        children: [
                                          Text(item[index].label),
                                          Text(item[index].value),
                                          Icon(Icons.airplane_ticket),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                            GridView.builder(
                                itemCount: _ticketViewModel
                                    .ticketModelData.data.dist.year.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 1.30,
                                        crossAxisCount: 2),
                                itemBuilder: (context, int index) {
                                  var item = _ticketViewModel
                                      .ticketModelData.data.dist.year;
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey)),
                                      height: 20,
                                      width: 50,
                                      child: Column(
                                        children: [
                                          Text(item[index].label),
                                          Text(item[index].value),
                                          Icon(Icons.airplane_ticket),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ]),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
        },
      ),
      // Column(
      //   children: [
      //     Container(
      //       color: Colors.blue,
      //       child: Padding(
      //         padding: const EdgeInsets.all(16.0),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Text(
      //               "Ticket Details",
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 14,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //             Row(
      //               children: [
      //                 Container(
      //                   decoration: BoxDecoration(
      //                     color: Colors.grey,
      //                     borderRadius: BorderRadius.circular(5),
      //                   ),
      //                   child: Row(
      //                     children: [
      //                       Padding(
      //                         padding: const EdgeInsets.all(6.0),
      //                         child: Icon(
      //                           Icons.menu,
      //                           color: Colors.white,
      //                         ),
      //                       ),
      //                       Container(
      //                         decoration: BoxDecoration(
      //                           color: Colors.white,
      //                           borderRadius: BorderRadius.only(
      //                               topRight: Radius.circular(5),
      //                               bottomRight: Radius.circular(5)),
      //                         ),
      //                         child: Padding(
      //                           padding: const EdgeInsets.all(6.0),
      //                           child: Icon(
      //                             Icons.line_axis,
      //                             color: Colors.black,
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ],
      //             )
      //           ],
      //         ),
      //       ),
      //     ),
      //     DefaultTabController(
      //       length: 4,
      //       child: Column(
      //         children: [
      //           Container(
      //             child: TabBar(
      //                 indicator: OutlineIndicator(
      //                   color: Colors.black,
      //                   radius: Radius.circular(5),
      //                 ),
      //                 labelColor: Colors.black,
      //                 indicatorColor: Colors.black,
      //                 tabs: [
      //                   Tab(
      //                     text: "Day",
      //                   ),
      //                   Tab(
      //                     text: "Week",
      //                   ),
      //                   Tab(
      //                     text: "Month",
      //                   ),
      //                   Tab(
      //                     text: "Year",
      //                   ),
      //                 ]),
      //           ),
      //           Container(
      //             height: 400,
      //             child: TabBarView(children: [
      //               GridView.builder(
      //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                       crossAxisCount: 2),
      //                   itemBuilder: (context, int index) {
      //                     return Padding(
      //                       padding: const EdgeInsets.all(8.0),
      //                       child: Container(
      //                         decoration: BoxDecoration(
      //                             border: Border.all(color: Colors.grey)),
      //                         height: 20,
      //                         width: 50,
      //                         child: Column(
      //                           children: [
      //                             Icon(Icons.airplane_ticket),
      //                           ],
      //                         ),
      //                       ),
      //                     );
      //                   }),
      //               Container(
      //                 color: Colors.black,
      //                 height: 10,
      //                 width: double.infinity,
      //               ),
      //               Container(
      //                 color: Colors.red,
      //                 height: 10,
      //                 width: double.infinity,
      //               ),
      //               Container(
      //                 color: Colors.red,
      //                 height: 10,
      //                 width: double.infinity,
      //               ),
      //             ]),
      //           ),
      //         ],
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}

class OutlineIndicator extends Decoration {
  const OutlineIndicator({
    this.color = Colors.white,
    this.strokeWidth = 2,
    this.radius = const Radius.circular(24),
  });
  final Color color;
  final double strokeWidth;
  final Radius radius;
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _OutlinePainter(
      color: color,
      strokeWidth: strokeWidth,
      radius: radius,
      onChange: onChanged,
    );
  }
}

class _OutlinePainter extends BoxPainter {
  _OutlinePainter({
    required this.color,
    required this.strokeWidth,
    required this.radius,
    VoidCallback? onChange,
  })  : _paint = Paint()
          ..style = PaintingStyle.stroke
          ..color = color
          ..strokeWidth = strokeWidth,
        super(onChange);
  final Color color;
  final double strokeWidth;
  final Radius radius;
  final Paint _paint;
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    var rect = offset & configuration.size!;
    var rrect = RRect.fromRectAndRadius(rect, radius);
    canvas.drawRRect(rrect, _paint);
  }
}
