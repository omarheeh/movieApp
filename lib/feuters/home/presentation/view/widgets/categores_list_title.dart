import 'dart:developer';

import 'package:flutter/material.dart';

class CategoresListTitle extends StatefulWidget {
  const CategoresListTitle({
    super.key,
  });

  @override
  State<CategoresListTitle> createState() => _CategoresListTitleState();
}

class _CategoresListTitleState extends State<CategoresListTitle> {
  List<Map<String, dynamic>> categores = [
    {'name': 'Movie'},
    {'name': 'Adventure'},
    {'name': 'Comedy'},
    {'name': 'Family'},
  ];
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 30,
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  log(categores[index]['name']);
                },
                child: Text(
                  '${categores[index]['name']}',
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Text(
                "   |   ",
                style: TextStyle(
                  fontSize: 13,
                ),
              );
            },
            itemCount: 4),
      ),
    );
  }
}
