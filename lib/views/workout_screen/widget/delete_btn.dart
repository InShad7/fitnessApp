import 'package:fit/controller/provider/provider.dart';
import 'package:fit/views/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeleteBtn extends StatelessWidget {
  const DeleteBtn({super.key, this.delFun});
  final delFun;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        delFun();
        Provider.of<FitnessProvier>(context, listen: false).updateFitness();
      },
      icon: const Icon(
        Icons.delete_outline_rounded,
        size: 30,
      ),
      color: red,
    );
  }
}