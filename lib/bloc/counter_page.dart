import 'package:bloc_demo/bloc/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter'),),
      body: BlocBuilder<CounterCubit,int>(
        buildWhen: (previousState, currentState){
          return true;
        },
        builder: ((context, state) => Center(child:Text('$state'),)),
      ),

      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(onPressed: ()=>context.read<CounterCubit>().increment(),
          child:const Icon(Icons.add)),
          const SizedBox(height:4),
          FloatingActionButton(onPressed: ()=>context.read<CounterCubit>().decrement(),
          child: const Icon(Icons.remove)),
        
        ],
      ),
    );
  }
}