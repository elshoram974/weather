import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:mreweather/controller/search_cubit/search_cubit.dart';

import '../../core/constants/app_constants.dart';
import '../../core/services/localize.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(context),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(title: Text(MyLocale.s.search), centerTitle: true),
        body: const SearchBody(),
      ),
    );
  }
}

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    SearchCubit searchCubit = BlocProvider.of<SearchCubit>(context);

    return Center(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.defaultPadding,
          vertical: AppConstants.defaultPadding / 2,
        ),
        children: [
          TypeAheadField(
            hideOnEmpty: true,
            textFieldConfiguration: TextFieldConfiguration(
              controller: searchCubit.controller,
              decoration: InputDecoration(
                labelText: MyLocale.s.search,
                hintText: MyLocale.s.searchAddress,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(AppConstants.borderRadius),
                ),
              ),
            ),
            suggestionsCallback: searchCubit.suggestionsCallback,
            itemBuilder: (context, q) => ListTile(title: Text(q)),
            onSuggestionSelected:searchCubit.onSuggestionSelected,
          )
        ],
      ),
    );
  }
}
