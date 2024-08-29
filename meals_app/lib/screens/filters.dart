import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/widgets/Switch.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
        ),
        // PopScope:控制user的返回行為,並在返回時傳遞篩選器的狀態
        body: Column(
          children: [
            SwitchWidget(
              switchValue: activeFilters[Filter.glutenFree]!,
              switchTitle: 'Gluten-free',
              switchSubTitle: 'Only include gluten-free meals.',
              onChange: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.glutenFree, isChecked);
              },
            ),
            SwitchWidget(
              switchValue: activeFilters[Filter.lactoseFree]!,
              switchTitle: 'Lactose-free',
              switchSubTitle: 'Only include lactose-free meals.',
              onChange: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.lactoseFree, isChecked);
              },
            ),
            SwitchWidget(
              switchValue: activeFilters[Filter.vagetarian]!,
              switchTitle: 'Vegetarian',
              switchSubTitle: 'Only include vegetarian meals.',
              onChange: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.vagetarian, isChecked);
              },
            ),
            SwitchWidget(
              switchValue: activeFilters[Filter.vegan]!,
              switchTitle: 'Vegan',
              switchSubTitle: 'Only include vegan meals.',
              onChange: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.vegan, isChecked);
              },
            ),
          ],
        ));
  }
}
