import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/layout/news_layout/cubit/cubit.dart';
import 'package:flutter_app/layout/news_layout/cubit/states.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){

        var cubit =NewsCubit.get(context);
        var list =NewsCubit.get(context).science;

        return ConditionalBuilder(
            condition:list.length>0,
            builder: (context){
              return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context,index){
                    return buildArticleItem(list[index],context);
                  },
                  separatorBuilder: (context,index){
                    return separatedDivider();
                  },
                  itemCount: cubit.science.length
              );
            },
            fallback:(context)=> const Center(child: CircularProgressIndicator())
        );
      },
    );
  }
}
