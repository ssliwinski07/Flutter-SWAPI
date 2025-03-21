import 'package:flutter/material.dart';
import 'package:connector_module/exports/base_models.dart';
import 'package:go_router/go_router.dart';
import '/widgets/cards/card_details.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.items});

  final List<PeopleModel?> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
        ),
        style: const ButtonStyle(
          overlayColor: WidgetStatePropertyAll(Colors.transparent),
        ),
        onPressed: () {
          context.pop();
        },
      )),
      body: Center(
        child: items.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(15.0),
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return CardDetails(
                      child: _Details(item: item),
                    );
                  },
                ),
              )
            : const Text('Empty list'),
      ),
    );
  }
}

class _Details extends StatelessWidget {
  const _Details({
    required this.item,
  });

  final PeopleModel? item;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: [
              Text(
                item?.name ?? '-',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Birth year: ${item?.birthYear ?? '-'}',
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Eye color: ${item?.eyeColor ?? '-'}',
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Height: ${item?.height ?? '-'} cm',
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Mass: ${item?.mass ?? '-'} kg',
                ),
              ),
            ],
          ),
        ));
  }
}
