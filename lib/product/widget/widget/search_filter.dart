import 'package:flutter/material.dart';
import 'package:salonmake/product/constants/icon.dart';
import 'package:salonmake/product/core/base/base_state/base_state.dart';
import 'package:salonmake/product/util/util.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    super.key,
    required this.controller,
    required this.searchText,
    required this.onChanged,
    this.isFilter,
    this.onTap,
  });

  final TextEditingController controller;
  final String searchText;
  final Function(String)? onChanged;
  final bool? isFilter;
  final Function()? onTap;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends BaseState<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: BaseUtility.horizontal(
        BaseUtility.paddingSmallValue,
      ),
      child: widget.isFilter == true
          ? Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: widget.controller,
                    onChanged: widget.onChanged,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: BaseUtility.all(
                          BaseUtility.paddingNormalValue,
                        ),
                        child: AppIcons.search.toSvgImg(
                          Theme.of(context).colorScheme.onSurface,
                          BaseUtility.iconMediumSize,
                          BaseUtility.iconMediumSize,
                        ),
                      ),
                      labelText: widget.searchText,
                      labelStyle:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: BaseUtility.paddingNormalValue,
                        vertical: BaseUtility.paddingNormalValue,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          BaseUtility.radiusCircularMediumValue,
                        ),
                        borderSide: BorderSide(
                          color: Theme.of(context)
                              .colorScheme
                              .surface
                              .withOpacity(0.8),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          BaseUtility.radiusCircularMediumValue,
                        ),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          BaseUtility.radiusCircularMediumValue,
                        ),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error,
                          width: 1,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          BaseUtility.radiusCircularMediumValue,
                        ),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Container(
                    margin: BaseUtility.left(
                      BaseUtility.marginMediumValue,
                    ),
                    padding: BaseUtility.all(
                      BaseUtility.paddingMediumValue,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .surface
                            .withOpacity(0.8),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          BaseUtility.radiusNormalValue,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: BaseUtility.all(
                        BaseUtility.paddingSmallValue,
                      ),
                      child: AppIcons.tune.toSvgImg(
                        Colors.black54,
                        BaseUtility.iconMediumSize,
                        BaseUtility.iconMediumSize,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : TextField(
              controller: widget.controller,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: BaseUtility.all(
                    BaseUtility.paddingNormalValue,
                  ),
                  child: AppIcons.search.toSvgImg(
                    Theme.of(context).colorScheme.onSurface,
                    BaseUtility.iconMediumSize,
                    BaseUtility.iconMediumSize,
                  ),
                ),
                labelText: widget.searchText,
                labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: BaseUtility.paddingNormalValue,
                  vertical: BaseUtility.paddingNormalValue,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    BaseUtility.radiusCircularMediumValue,
                  ),
                  borderSide: BorderSide(
                    color:
                        Theme.of(context).colorScheme.surface.withOpacity(0.8),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    BaseUtility.radiusCircularMediumValue,
                  ),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    BaseUtility.radiusCircularMediumValue,
                  ),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.error,
                    width: 1,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    BaseUtility.radiusCircularMediumValue,
                  ),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.error,
                    width: 1,
                  ),
                ),
              ),
            ),
    );
  }
}
