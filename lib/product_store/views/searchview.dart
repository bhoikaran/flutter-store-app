import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/product_store/model/app_state_model.dart';
import 'package:store_app/product_store/widgets/customsearchbar.dart';
import 'package:store_app/product_store/widgets/product_item.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  String _query = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _query)
      ..addListener(_onQueryChange);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onQueryChange() {
    setState(() {
      _query = _controller.text;
    });
  }

  Widget _buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: CustomSearchBar(
        controller: _controller,
        focusNode: _focusNode,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppStateModel>(context);
    final filteredProducts = model.search(_query);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          _buildSearchBox(),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ProductItem(iceCream: filteredProducts[index]);
              },
              itemCount: filteredProducts.length,
            ),
          ),
        ],
      )),
    );
  }
}
