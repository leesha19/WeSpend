import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:wespend/framework/utils/extension/extension.dart';
import 'package:wespend/framework/utils/extension/string_extension.dart';
import 'package:wespend/ui/utils/theme/theme.dart';
import 'package:wespend/ui/utils/widgets/common_button.dart';
import 'package:wespend/ui/utils/widgets/common_svg.dart';
import 'package:wespend/ui/utils/widgets/common_text.dart';
import 'package:wespend/ui/utils/theme/assets.gen.dart';

void showSuccessDialogue({
  required BuildContext context,
  required String animation,
  required String successMessage,
  String? successDescription,
  String? buttonText,
  bool? dismissble,
  bool? showButton,
  void Function()? onTap,
  double? height,
  double? width,
}) {
  showDialog(
    context: context,
    barrierDismissible: dismissble ?? false,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        backgroundColor: AppColors.white,
        child: SizedBox(
          height: height ?? MediaQuery.sizeOf(context).height * 0.6,
          width: width ?? MediaQuery.sizeOf(context).width * 0.3,
          child: Consumer(
            builder: (context, ref, child) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Lottie.asset(
                        animation,
                        height: MediaQuery.sizeOf(context).height * 0.25,
                        width: MediaQuery.sizeOf(context).width * 0.25,
                        fit: BoxFit.contain,
                        repeat: true,
                      ),
                      CommonText(
                        title: successMessage,
                        textAlign: TextAlign.center,
                        style: TextStyles.bold.copyWith(
                          fontSize: 24,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (successDescription?.isNotEmpty ?? false)
                        CommonText(
                          title: successDescription!,
                          textAlign: TextAlign.center,
                          style: TextStyles.regular.copyWith(
                            fontSize: 16,
                            color: AppColors.black,
                          ),
                        ),
                      //const Spacer(),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.024,
                      ),
                      if (showButton ?? true)
                        CommonButton(
                          buttonText: buttonText,
                          borderRadius: BorderRadius.circular(12),
                          buttonTextStyle: TextStyles.regular.copyWith(
                            color: AppColors.white,
                          ),
                          onTap: onTap,
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    },
  );
}

void commonImportDialog({
  required BuildContext context,
  required String title,
  String? description,
  String? fileName,
  bool? isSampleLoading,
  bool? isSaveLoading,
  bool? dismissble,
  void Function()? onTap,
  Future<bool?> Function()? onSaveTap,
  Future<bool?> Function()? onSampleTap,
  Future<String?> Function()? onBrowseTap,
  double? height,
  double? width,
}) {
  // Create ValueNotifiers for all mutable states
  final fileNameNotifier = ValueNotifier<String?>(fileName);
  final sampleLoadingNotifier = ValueNotifier<bool>(isSampleLoading ?? false);
  final saveLoadingNotifier = ValueNotifier<bool>(isSaveLoading ?? false);
  final errorNotifier = ValueNotifier<bool>(false);

  showDialog(
    context: context,
    barrierDismissible: dismissble ?? false,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        backgroundColor: AppColors.white,
        child: SizedBox(
          height: height ?? MediaQuery.sizeOf(context).height * 0.6,
          width: width ?? MediaQuery.sizeOf(context).width * 0.3,
          child: ValueListenableBuilder4<String?, bool, bool, bool>(
            valueListenable1: fileNameNotifier,
            valueListenable2: sampleLoadingNotifier,
            valueListenable3: saveLoadingNotifier,
            valueListenable4: errorNotifier,
            builder:
                (
                  context,
                  currentFileName,
                  currentSampleLoading,
                  currentSaveLoading,
                  currentErrorShowing,
                  _,
                ) {
                  return Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CommonText(
                            title: title,
                            style: TextStyles.bold.copyWith(
                              fontSize: 24,
                              color: AppColors.black,
                            ),
                          ),
                          const SizedBox(height: 16),
                          CommonText(
                            title: description ?? '',
                            style: TextStyles.regular.copyWith(
                              fontSize: 16,
                              color: AppColors.black,
                            ),
                            maxLines: 5,
                          ),
                          const SizedBox(height: 24),
                          DottedBorder(
                            options: RectDottedBorderOptions(
                              color: AppColors.clr2997FC,
                              dashPattern: [5, 3],
                              strokeWidth: 1,
                            ),
                            child: InkWell(
                              onTap: () async {
                                final selectedFile = await onBrowseTap?.call();
                                if (selectedFile != null) {
                                  fileNameNotifier.value = selectedFile;
                                  errorNotifier.value = false;
                                }
                              },
                              child: Container(
                                height: 164,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Visibility(
                                        visible:
                                            (currentFileName ?? '').isEmpty,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CommonSVG(
                                              strIcon: Assets
                                                  .svgs
                                                  .svgImportFile
                                                  .path,
                                            ),
                                            SizedBox(height: 6),
                                            CommonText(
                                              title: LocaleKeys
                                                  .keyBrowseFileMsg
                                                  .localized,
                                              maxLines: 2,
                                              style: TextStyles.regular
                                                  .copyWith(
                                                    fontSize: 11,
                                                    color: AppColors.black,
                                                  ),
                                            ),
                                            CommonText(
                                              title: LocaleKeys
                                                  .keyOnlyXlsxSupported
                                                  .localized,
                                              style: TextStyles.regular
                                                  .copyWith(
                                                    fontSize: 11,
                                                    color:
                                                        AppColors.black9F9F9F,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Visibility(
                                        visible:
                                            (currentFileName ?? '').isNotEmpty,
                                        child: Column(
                                          children: [
                                            CommonSVG(
                                              strIcon: Assets
                                                  .svgs
                                                  .svgSelectedFile
                                                  .path,
                                            ),
                                            SizedBox(height: 6),
                                            CommonText(
                                              title: currentFileName ?? '',
                                              maxLines: 2,
                                              style: TextStyles.regular
                                                  .copyWith(
                                                    fontSize: 11,
                                                    color: AppColors.black,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: errorNotifier.value,
                            child: CommonText(
                              title: LocaleKeys.keyFileRequired.localized,
                              style: TextStyles.regular.copyWith(
                                fontSize: 13,
                                color: AppColors.clrEA0604,
                              ),
                              maxLines: 5,
                            ).paddingOnly(top: 10).alignAtCenterLeft(),
                          ),
                          const SizedBox(height: 24),
                          // Buttons row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CommonButton(
                                  buttonText: LocaleKeys.keyCancel.localized,
                                  borderRadius: BorderRadius.circular(8),
                                  borderColor: AppColors.clr9E9E9E,
                                  backgroundColor: AppColors.transparent,
                                  buttonTextStyle: TextStyles.regular.copyWith(
                                    color: AppColors.black,
                                  ),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                              const SizedBox(width: 24),
                              Expanded(
                                child: CommonButton(
                                  buttonText: LocaleKeys.keySave.localized,
                                  borderRadius: BorderRadius.circular(8),
                                  backgroundColor: AppColors.black,
                                  isLoading: currentSaveLoading,
                                  buttonTextStyle: TextStyles.regular.copyWith(
                                    color: AppColors.white,
                                  ),
                                  onTap: () async {
                                    if (currentFileName?.isNotEmpty ?? false) {
                                      errorNotifier.value = false;
                                    } else {
                                      errorNotifier.value = true;
                                    }
                                    saveLoadingNotifier.value = true;
                                    try {
                                      final shouldContinue = await onSaveTap
                                          ?.call();
                                      if (shouldContinue == false) {
                                        saveLoadingNotifier.value = false;
                                      }
                                    } catch (e) {
                                      saveLoadingNotifier.value = false;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          // Download sample
                          CommonButton(
                            buttonText: LocaleKeys.keyDownloadSample.localized,
                            borderRadius: BorderRadius.circular(8),
                            borderColor: AppColors.clr9E9E9E,
                            isLoading: currentSampleLoading,
                            loadingAnimationColor: AppColors.black,
                            backgroundColor: AppColors.clrD9D9D9,
                            buttonTextStyle: TextStyles.regular.copyWith(
                              color: AppColors.black,
                            ),
                            onTap: () async {
                              sampleLoadingNotifier.value = true;
                              try {
                                final shouldContinue = await onSampleTap
                                    ?.call();
                                if (shouldContinue == false) {
                                  sampleLoadingNotifier.value = false;
                                }
                              } catch (e) {
                                sampleLoadingNotifier.value = false;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
          ),
        ),
      );
    },
  );
}

// Helper class for listening to three ValueNotifiers
class ValueListenableBuilder4<T1, T2, T3, T4> extends StatelessWidget {
  final ValueListenable<T1> valueListenable1;
  final ValueListenable<T2> valueListenable2;
  final ValueListenable<T3> valueListenable3;
  final ValueListenable<T4> valueListenable4;
  final Widget Function(BuildContext, T1, T2, T3, T4, Widget?) builder;

  const ValueListenableBuilder4({
    Key? key,
    required this.valueListenable1,
    required this.valueListenable2,
    required this.valueListenable3,
    required this.valueListenable4,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<T1>(
      valueListenable: valueListenable1,
      builder: (context, value1, child) {
        return ValueListenableBuilder<T2>(
          valueListenable: valueListenable2,
          builder: (context, value2, child) {
            return ValueListenableBuilder<T3>(
              valueListenable: valueListenable3,
              builder: (context, value3, child) {
                return ValueListenableBuilder<T4>(
                  valueListenable: valueListenable4,
                  builder: (context, value4, child) {
                    return builder(
                      context,
                      value1,
                      value2,
                      value3,
                      value4,
                      child,
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}

void showErrorDialogue({
  required BuildContext context,
  required String animation,
  required String successMessage,
  String? successDescription,
  String? buttonText,
  bool? dismissble,
  bool? showButton,
  void Function()? onTap,
  double? height,
  double? width,
}) {
  showDialog(
    context: context,
    barrierDismissible: dismissble ?? false,
    builder: (context) {
      final media = MediaQuery.of(context).size;

      return Dialog(
        elevation: 0.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        backgroundColor: AppColors.white,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: height ?? media.height * 0.6,
            maxWidth: width ?? media.width * 0.4,
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Consumer(
              builder: (context, ref, child) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Lottie.asset(
                      animation,
                      height: media.height * 0.2,
                      width: media.width * 0.2,
                      fit: BoxFit.contain,
                      repeat: true,
                    ),
                    //  const SizedBox(height: 20),
                    CommonText(
                      title: successMessage,
                      textAlign: TextAlign.center,
                      maxLines: 4,
                      style: TextStyles.bold.copyWith(
                        fontSize: 24,
                        color: AppColors.black,
                      ),
                    ).paddingSymmetric(horizontal: 15),
                    //   const SizedBox(height: 0),
                    if (showButton ?? true)
                      CommonButton(
                        buttonText: buttonText,
                        width: media.height * 0.25,
                        borderRadius: BorderRadius.circular(12),
                        buttonTextStyle: TextStyles.regular.copyWith(
                          color: AppColors.white,
                        ),
                        onTap: onTap,
                      ).paddingSymmetric(horizontal: 36, vertical: 15),
                  ],
                );
              },
            ),
          ),
        ),
      );
    },
  );
}

//
//  showErrorDialogue({
//   required BuildContext context,
//   required String animation,
//   required String successMessage,
//   String? successDescription,
//   String? buttonText,
//   bool? dismissble,
//   bool? showButton,
//   void Function()? onTap,
//   double? height,
//   double? width,
// }) {
//   showDialog(
//     context: context,
//     barrierDismissible: dismissble??false,
//     builder: (context) {
//       return Dialog(
//         elevation: 0.0,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//         backgroundColor: AppColors.white,
//         child: SizedBox(
//           height: height ?? MediaQuery.sizeOf(context).height * 0.45,
//           width: width ?? MediaQuery.sizeOf(context).width * 0.3,
//           child: Consumer(
//               builder: (context, ref, child) {
//             return Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                // const Spacer(),
//                 Lottie.asset(
//                   animation,
//                   height: MediaQuery.sizeOf(context).height * 0.2,
//                   width: MediaQuery.sizeOf(context).width * 0.2,
//                   fit: BoxFit.contain,
//                   repeat: true,
//                 ),
//                 CommonText(
//                   title:successMessage,
//                   textAlign: TextAlign.center,
//                   maxLines: 2,
//                   style: TextStyles.bold.copyWith(
//                     fontSize: 24,
//                     color: AppColors.black,
//                   ),
//                 ).paddingSymmetric(horizontal: 15),
//                const Spacer(),
//                 Visibility(
//                   visible: showButton ?? true,
//                   child: CommonButton(
//                     buttonText: buttonText,
//                     width: MediaQuery.sizeOf(context).height * 0.25,
//                     borderRadius: BorderRadius.circular(12),
//                     buttonTextStyle: TextStyles.regular.copyWith(
//                       color: AppColors.white,
//                     ),
//                     // height: 50,
//                     // width: 200,
//                     onTap: onTap,
//                   ).paddingSymmetric(horizontal: 36,vertical: 25),
//                 ),
//                 // const Spacer(),
//               ],
//             );
//           }),
//         ),
//       );
//     },
//   );
// }

class ValueListenableBuilder3<T1,T2,T3> extends StatelessWidget {

  final ValueListenable<T1> valueListenable1;
  final ValueListenable<T2> valueListenable2;
  final ValueListenable<T3> valueListenable3;

  final Widget Function(BuildContext,T1,T2,T3,Widget?) builder;

  const ValueListenableBuilder3({
    super.key,
    required this.valueListenable1,
    required this.valueListenable2,
    required this.valueListenable3,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<T1>(
        valueListenable: valueListenable1,
        builder: (context,v1,_) {
      return ValueListenableBuilder<T2>(
          valueListenable: valueListenable2,
          builder: (context,v2,_) {
        return ValueListenableBuilder<T3>(
          valueListenable: valueListenable3,
          builder: (context,v3,_) {
            return builder(context,v1,v2,v3,null);
          },
        );
      },
    );
  },
    );
  }
}


void addEditClientDocumentDialog({
  required BuildContext context,
  String? documentId,
  String? fileName,
  Future<String?> Function()? onBrowseTap,
  Future<bool?> Function(String file)? onSubmitTap,
  bool? dismissible,
  double? height,
  double? width,
}) {
  final fileNotifier = ValueNotifier<String?>(fileName);
  final loadingNotifier = ValueNotifier<bool>(false);
  final errorNotifier = ValueNotifier<bool>(false);

  final bool isEdit = documentId != null;

  showDialog(
    context: context,
    barrierDismissible: dismissible ?? false,
    builder: (context) {
      final media = MediaQuery.of(context).size;

      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        backgroundColor: AppColors.white,
        child: SizedBox(
          height: height ?? media.height * 0.45,
          width: width ?? media.width * 0.35,
          child: ValueListenableBuilder3<String?, bool, bool>(
            valueListenable1: fileNotifier,
            valueListenable2: loadingNotifier,
            valueListenable3: errorNotifier,
            builder: (context, currentFile, loading, showError, _) {
              return Padding(
                padding: const EdgeInsets.all(32),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommonText(
                        title: isEdit
                            ? "Edit Client Document"
                            : "Upload Client Document",
                        style: TextStyles.bold.copyWith(
                          fontSize: 24,
                          color: AppColors.black,
                        ),
                      ),
                  
                      const SizedBox(height: 24),
                  
                      /// UPLOAD AREA
                      DottedBorder(
                        options: RectDottedBorderOptions(
                          color: AppColors.clr2997FC,
                          dashPattern: [5, 3],
                          strokeWidth: 1,
                        ),
                        child: InkWell(
                          onTap: () async {
                            final file = await onBrowseTap?.call();
                  
                            if (file != null) {
                              fileNotifier.value = file;
                              errorNotifier.value = false;
                            }
                          },
                          child: Container(
                            height: 160,
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonSVG(
                                  strIcon: currentFile == null
                                      ? Assets.svgs.svgImportFile.path
                                      : Assets.svgs.svgFileUpload.keyName,
                                ),
                  
                                SizedBox(height: 8),
                  
                                CommonText(
                                  title: currentFile ?? "Browse File",
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyles.regular.copyWith(
                                    fontSize: 12,
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  
                      if (showError)
                        CommonText(
                          title: "Document is required",
                          style: TextStyles.regular.copyWith(
                            fontSize: 13,
                            color: AppColors.clrEA0604,
                          ),
                        ).paddingOnly(top: 10).alignAtCenterLeft(),
                  
                      const SizedBox(height: 30),
                  
                      /// ACTION BUTTON
                      CommonButton(
                        buttonText: isEdit ? "Edit Document" : "Upload Document",
                        isLoading: loading,
                        borderRadius: BorderRadius.circular(10),
                        backgroundColor: AppColors.black,
                        buttonTextStyle: TextStyles.regular.copyWith(
                          color: AppColors.white,
                        ),
                        onTap: () async {
                          if (currentFile == null) {
                            errorNotifier.value = true;
                            return;
                          }
                  
                          loadingNotifier.value = true;
                  
                          try {
                            final shouldClose = await onSubmitTap?.call(
                              currentFile,
                            );
                  
                            if (shouldClose != false) {
                              Navigator.pop(context);
                            } else {
                              loadingNotifier.value = false;
                            }
                          } catch (_) {
                            loadingNotifier.value = false;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    },
  );
}


