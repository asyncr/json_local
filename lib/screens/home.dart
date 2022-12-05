import 'package:flutter/material.dart';
import 'package:json_local/utils/converter_to_json.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// List _items = [];

// Future<void> loadJson() async {
//   final String data = await rootBundle.loadString('assets/json_local.json');
//   final items = await json.decode(data);
//   setState(() {
//     _items = items["items"];
//     // ignore: avoid_print
//     print("..ITEMS -> ${_items.length}");
//   });
// }

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.deepPurple.shade400,
      ),
      body: FutureBuilder(
        future: converterJson(),
        builder: (context, data) {
          if (data.hasError) {
            return const Center(
              child: Text('Ha ocurrido un error'),
            );
          }
          final items = data.data as List;
          return data.hasData
              ? ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Card(
                      key: Key(items[index].id),
                      margin: const EdgeInsets.all(10),
                      color: Colors.deepPurple.shade100,
                      child: ListTile(
                        leading: Text(items[index].id),
                        title: Text(items[index].name),
                        subtitle: Text(items[index].description),
                      ),
                    );
                  },
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

// class ColumSetState extends StatelessWidget {
//   const ColumSetState({Key? key, required List items})
//       : _items = items,
//         super(key: key);
//
//   final List _items;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         _items.isNotEmpty
//             ? Expanded(
//                 child: ListView.builder(
//                   itemCount: _items.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Card(
//                       key: Key(_items[index]['id']),
//                       margin: const EdgeInsets.all(10),
//                       color: Colors.deepPurple.shade100,
//                       child: ListTile(
//                         leading: Text(_items[index]['id']),
//                         title: Text(_items[index]['name']),
//                         subtitle: Text(_items[index]['description']),
//                       ),
//                     );
//                   },
//                 ),
//               )
//             : ElevatedButton(
//                 onPressed: () {
//                   loadJson();
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.deepPurple.shade200,
//                 ),
//                 child: const Center(child: Center(child: Text('Load JSON'))),
//               ),
//       ],
//     );
//   }
// }
