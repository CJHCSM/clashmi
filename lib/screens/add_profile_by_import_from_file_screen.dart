// ignore_for_file: use_build_context_synchronously, unused_catch_stack

import 'dart:io';

import 'package:clashmi/app/modules/profile_manager.dart';
import 'package:clashmi/i18n/strings.g.dart';
import 'package:clashmi/screens/dialog_utils.dart';
import 'package:clashmi/screens/theme_config.dart';
import 'package:clashmi/screens/widgets/framework.dart';
import 'package:clashmi/screens/widgets/text_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

class AddProfileByImportFromFileScreen extends LasyRenderingStatefulWidget {
  static RouteSettings routSettings() {
    return const RouteSettings(name: "AddProfileByImportFromFileScreen");
  }

  const AddProfileByImportFromFileScreen({super.key});

  @override
  State<AddProfileByImportFromFileScreen> createState() =>
      _AddProfileByImportFromFileScreenState();
}

class _AddProfileByImportFromFileScreenState
    extends LasyRenderingState<AddProfileByImportFromFileScreen> {
  String _filePath = "";

  final _textControllerRemark = TextEditingController();
  bool _loading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textControllerRemark.dispose();
    super.dispose();
  }

  Future<void> onAdd(BuildContext context) async {
    final tcontext = Translations.of(context);

    String text = _textControllerRemark.text.trim();

    final error = await ProfileManager.addLocal(_filePath, remark: text);

    if (!mounted) {
      return;
    }
    _loading = false;
    setState(() {});

    if (error == null) {
      await DialogUtils.showAlertDialog(context, tcontext.meta.addSuccess);
      if (!mounted) {
        return;
      }
      Navigator.pop(context, true);
      return;
    }
    if (!mounted) {
      return;
    }

    DialogUtils.showAlertDialog(context, error.message,
        showCopy: true, showFAQ: true, withVersion: true);
  }

  @override
  Widget build(BuildContext context) {
    final tcontext = Translations.of(context);
    Size windowSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const SizedBox(
                      width: 50,
                      height: 30,
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        size: 26,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: windowSize.width - 50 * 2,
                    child: Text(
                      tcontext.meta.import,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: ThemeConfig.kFontWeightTitle,
                          fontSize: ThemeConfig.kFontSizeTitle),
                    ),
                  ),
                  _loading
                      ? const Row(
                          children: [
                            SizedBox(
                              width: 12,
                            ),
                            SizedBox(
                              width: 26,
                              height: 26,
                              child: RepaintBoundary(
                                child:
                                    CircularProgressIndicator(strokeWidth: 2),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            )
                          ],
                        )
                      : InkWell(
                          onTap: () async {
                            await onAdd(context);
                          },
                          child: Tooltip(
                            message: tcontext.meta.save,
                            child: const SizedBox(
                              width: 50,
                              height: 30,
                              child: Icon(
                                Icons.done,
                                size: 26,
                              ),
                            ),
                          )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                      child: Card(
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(18, 20, 18, 20),
                            child: SizedBox(
                              height: 45.0,
                              child: ElevatedButton(
                                  child: Text(tcontext.meta.fileChoose),
                                  onPressed: () async {
                                    await onPressChooseFile();
                                  }),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(18, 20, 18, 20),
                            child: TextFieldEx(
                              controller: _textControllerRemark,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                labelText: tcontext.meta.remark,
                                hintText: tcontext.meta.required,
                                prefixIcon:
                                    const Icon(Icons.edit_note_outlined),
                              ),
                            ),
                          ),
                        ]),
                      )))),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onPressChooseFile() async {
    final tcontext = Translations.of(context);
    List<String> extensions = [];
    List<String> extensionsAll = ['yaml', 'yml', 'txt', 'json', 'conf'];

    extensions = [
      'yaml',
      'yml',
    ];

    try {
      FilePickerResult? fresult = await FilePicker.platform.pickFiles(
        type: Platform.isAndroid ? FileType.any : FileType.custom,
        allowedExtensions: Platform.isAndroid ? null : extensions,
      );
      if (fresult != null) {
        String ext = path
            .extension(fresult.files.first.name)
            .replaceAll('.', '')
            .toLowerCase();
        if (!extensionsAll.contains(ext)) {
          DialogUtils.showAlertDialog(
              context, tcontext.meta.fileTypeInvalid(p: ext));
          return;
        }
        _filePath = fresult.files.first.path!;

        if (_textControllerRemark.text.isEmpty) {
          _textControllerRemark.value = _textControllerRemark.value.copyWith(
            text: fresult.files.first.name,
          );
          setState(() {});
        }
      }
    } catch (err, stacktrace) {
      if (!mounted) {
        return;
      }
      DialogUtils.showAlertDialog(context, err.toString(),
          showCopy: true, showFAQ: true, withVersion: true);
    }
  }
}
