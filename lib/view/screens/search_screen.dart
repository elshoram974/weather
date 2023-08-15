import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:mreweather/controller/search_cubit/search_cubit.dart';

import '../../core/constants/app_constants.dart';
import '../../generated/l10n.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(title: Text(S.of(context).search), centerTitle: true),
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
          Text(S.of(context).searchAddress),
          const SizedBox(height: AppConstants.defaultPadding),
          TypeAheadField(
            hideOnEmpty: true,
            textFieldConfiguration: TextFieldConfiguration(
              controller: searchCubit.controller,
              decoration: InputDecoration(
                labelText: S.of(context).search,
                hintText: S.of(context).searchAddress,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(AppConstants.borderRadius),
                ),
              ),
            ),
            suggestionsCallback: searchCubit.suggestionsCallback,
            itemBuilder: (context, q) => ListTile(title: Text(q)),
            onSuggestionSelected: (q) =>
                searchCubit.onSuggestionSelected(q, context),
          )
        ],
      ),
    );
  }
}
