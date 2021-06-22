import 'package:app_interview/features_bank/bank_list/api/result_search_model.dart';
import 'package:app_interview/features_bank/bank_list/bloc/search_bloc.dart';
import 'package:app_interview/features_bank/bank_list/model/result_search.dart';
import 'package:app_interview/features_bank/bank_list/bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final bloc = Modular.get<SearchBloc>();

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    bloc.add('');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        title: Text('Bank Search'),
      ),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(right: 8, left: 8, top: 8),
              child: TextField(
                onChanged: bloc.add,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Search...'),
              )),
          Expanded(
              child: StreamBuilder(
            stream: bloc,
            builder: (_, snapshot) {
              final state = bloc.state;
              if (state is SearchStart) {
                return Center(
                  child: Text('Write some text'),
                );
              }
              if (state is SearchLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is SearchError) {
                return Center(
                  child: Text('Error'),
                );
              }

              final list = (state as SearchSuccess).list;

              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (_, id) {
                  final item = list[id];
                  return Card(
                      child: ListTile(
                    onTap: () {
                      Modular.to.pushNamed('/detail', arguments: list[id]);
                    },
                    title: Text('Bank: ${item.name ?? ""}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('E-mail: ${item.email}'),
                        Text('Phone: ${item.phone}'),
                      ],
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ));
                },
              );
            },
          ))
        ],
      ),
    );
  }
}
