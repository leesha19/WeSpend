import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wespend/framework/utils/session.dart';
import 'package:wespend/ui/utils/theme/theme.dart';
import 'package:wespend/ui/utils/widgets/common_text.dart';

class CommonInputFormField extends ConsumerStatefulWidget {
  final TextEditingController textEditingController;
  final Function(String)? onSelected;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final String? hintText;
  final double? fieldHeight;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final bool? obscureText;
  final Function(dynamic)? onChanged;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? autoCompleteKey;

  const CommonInputFormField({
    super.key,
    required this.textEditingController,
    this.onSelected,
    this.validator,
    this.focusNode,
    this.nextFocus,
    this.hintText,
    this.fieldHeight,
    this.prefixWidget,
    this.suffixWidget,
    this.obscureText,
    this.onChanged,
    this.textInputType,
    this.textInputAction,
    this.autoCompleteKey,
  });

  @override
  ConsumerState<CommonInputFormField> createState() =>
      _CommonInputFormFieldState();
}

class _CommonInputFormFieldState
    extends ConsumerState<CommonInputFormField> {
  late FocusNode focusNode;

  String selectedItem = '';
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  List<String> items = [];
  List<String> allItems = [];

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (widget.autoCompleteKey != null) {
        allItems = Session.getCacheData(widget.autoCompleteKey!);
        items = allItems;
        selectedItem = items.isNotEmpty ? items.first : '';
        focusNode.addListener(_handleFocus);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    focusNode.removeListener(_handleFocus);
    _removeOverlay();
    super.dispose();
  }

  void _handleFocus() {
    if (focusNode.hasFocus) {
      _showOverlay();
    } else {
      addInList(widget.textEditingController.text);
      Future.delayed(const Duration(milliseconds: 200), _removeOverlay);
    }
  }

  void addInList(String input) {
    if (widget.autoCompleteKey == null) return;

    if (input.isNotEmpty && !allItems.contains(input)) {
      allItems.add(input);
      Session.setCacheData(widget.autoCompleteKey!, allItems);
      ref.read(textFieldController).notifyListeners();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: SizedBox(
        height: widget.fieldHeight ?? 52.h,
        child: TextFormField(
          focusNode: focusNode,
          controller: widget.textEditingController,
          obscureText: widget.obscureText ?? false,
          keyboardType: widget.textInputType,
          textInputAction: widget.textInputAction ?? TextInputAction.next,

          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
          ),

          cursorColor: const Color(0xFF7B5CF0),

          onChanged: (value) {
            if (widget.autoCompleteKey != null) {
              items = allItems
                  .where((e) =>
                  e.toLowerCase().contains(value.toLowerCase()))
                  .toList();
              selectedItem =
              items.isNotEmpty ? items.first : '';
              ref.read(textFieldController).notifyListeners();
            }

            widget.onChanged?.call(value);
          },

          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.4),
              fontSize: 13.sp,
            ),

            filled: true,
            fillColor: Colors.white.withOpacity(0.05),

            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 14.h,
            ),

            prefixIcon: widget.prefixWidget,
            suffixIcon: widget.suffixWidget,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(
                color: Colors.white.withOpacity(0.12),
              ),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(
                color: Colors.white.withOpacity(0.12),
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: const BorderSide(
                color: Color(0xFF9D7BF8),
                width: 1.5,
              ),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: const BorderSide(color: Colors.red),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),

          validator: widget.validator,

          onFieldSubmitted: (value) {
            widget.nextFocus?.requestFocus();
          },
        ),
      ),
    );
  }

  void _showOverlay() {
    _removeOverlay();
    if (!mounted || items.isEmpty) return;

    final overlay = Overlay.of(context);
    final box = context.findRenderObject() as RenderBox;
    final size = box.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          offset: Offset(0, size.height + 6.h),
          child: Consumer(
            builder: (_, ref, __) {
              ref.watch(textFieldController);

              return Material(
                color: Colors.transparent,
                child: Container(
                  constraints: BoxConstraints(maxHeight: 200.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1625),
                    borderRadius: BorderRadius.circular(14.r),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  child: ListView.builder(
                    controller: scrollController,
                    padding: EdgeInsets.zero,
                    itemCount: items.length,
                    itemBuilder: (_, index) {
                      final item = items[index];

                      return InkWell(
                        onTap: () {
                          widget.textEditingController.text = item;
                          widget.onSelected?.call(item);
                          _removeOverlay();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 12.h,
                          ),
                          decoration: selectedItem == item
                              ? BoxDecoration(
                            color: const Color(0xFF7B5CF0)
                                .withOpacity(0.15),
                          )
                              : null,
                          child: CommonText(
                            title: item,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

final textFieldController =
ChangeNotifierProvider((ref) => TextFieldController());

class TextFieldController extends ChangeNotifier {}