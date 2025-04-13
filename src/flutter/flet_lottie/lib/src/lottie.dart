import 'dart:convert';

import 'package:flet/flet.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class LottieControl extends StatefulWidget {
  final Control control;

  const LottieControl({super.key, required this.control});

  @override
  State<LottieControl> createState() => _LottieControlState();
}

class _LottieControlState extends State<LottieControl> with FletStoreMixin {
  @override
  Widget build(BuildContext context) {
    debugPrint(
        "Lottie build: ${widget.control.id} (${widget.control.hashCode})");

    var src = widget.control.getString("src", "")!;
    var srcBase64 = widget.control.getString("srcBase64", "")!;

    if (src == "" && srcBase64 == "") {
      return const ErrorControl(
          "Lottie must have either \"src\" or \"src_base64\" specified.");
    }

    var repeat = widget.control.getBool("repeat", true)!;
    var backgroundLoading = widget.control.getBool("background_loading");
    var reverse = widget.control.getBool("reverse", false)!;
    var animate = widget.control.getBool("animate", true)!;
    var fit = widget.control.getBoxFit("fit");
    var alignment = widget.control.getAlignment("alignment");
    var filterQuality =
        widget.control.getFilterQuality("filter_quality", FilterQuality.low)!;
    void onWarning(String value) {
      if (widget.control.getBool("on_error", false)!) {
        widget.control.triggerEvent("error", value);
      }
    }

    void onLoaded(LottieComposition composition) {
      if (widget.control.getBool("on_load", false)!) {
        widget.control.triggerEvent("load");
      }
    }

    return withPageArgs((context, pageArgs) {
      Widget? lottie;

      if (srcBase64 != "") {
        try {
          Uint8List bytes = base64Decode(srcBase64);
          lottie = Lottie.memory(
            bytes,
            repeat: repeat,
            reverse: reverse,
            animate: animate,
            alignment: alignment,
            fit: fit,
            filterQuality: filterQuality,
            backgroundLoading: backgroundLoading,
            onLoaded: onLoaded,
            onWarning: onWarning,
          );
        } catch (ex) {
          return ErrorControl("Error decoding base64: ${ex.toString()}");
        }
      } else {
        var assetSrc = getAssetSrc(src, pageArgs.pageUri!, pageArgs.assetsDir);
        if (assetSrc.isFile) {
          // Local File
          lottie = Lottie.asset(assetSrc.path,
              repeat: repeat,
              reverse: reverse,
              animate: animate,
              alignment: alignment,
              fit: fit,
              filterQuality: filterQuality,
              backgroundLoading: backgroundLoading,
              onLoaded: onLoaded,
              onWarning: onWarning);
        } else {
          // URL
          lottie = Lottie.network(assetSrc.path,
              repeat: repeat,
              reverse: reverse,
              animate: animate,
              alignment: alignment,
              fit: fit,
              filterQuality: filterQuality,
              backgroundLoading: backgroundLoading,
              onLoaded: onLoaded,
              onWarning: onWarning);
        }
      }

      return ConstrainedControl(control: widget.control, child: lottie);
    });
  }
}
