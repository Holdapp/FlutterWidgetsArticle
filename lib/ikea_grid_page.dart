import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class IkeaGridPage extends StatelessWidget {
  const IkeaGridPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(title: const Text('Ikea')),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ..._informationSection(),
                    _gridView(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  List<Widget> _informationSection() => [
        const Text(
          'Title of section',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.0,
          ),
        ),
        SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => _filterChip(index.toString()),
            ),
          ),
        )
      ];

  Widget _filterChip(String label) => Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Chip(
          label: Text('Category: $label'),
        ),
      );

  Widget _gridView() => MasonryGridView.builder(
        shrinkWrap: true,
        itemCount: 100,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(2),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: [
                Colors.blueGrey,
                Colors.greenAccent,
                Colors.redAccent,
                Colors.white54,
                Colors.lightBlueAccent,
              ][index % 5],
            ),
            height: [
              100.0,
              150.0,
              50.0,
              200.0,
              300.0,
            ][index % 5],
          ),
        ),
      );
}
