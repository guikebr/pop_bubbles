import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'base_dialog.dart';

/// Widget that displays Giffy Dialog with image obtained from the network.
///
/// Pass the network image URL to [NetworkGiffyDialog]'s [image]
/// prop using Flutter's `Image.network(src)` widget.
/// ```
/// NetworkGiffyDialog(
///   title: Text('Example'),
///   description: Text('Dialog text'),
///   image: Image.network(
///     'https://example.com/link/to/image.gif',
///     fit: BoxFit.cover,
///   ),
///   ...,
/// );
class NetworkGiffyDialog extends StatelessWidget {
  const NetworkGiffyDialog({
    required this.image,
    required this.title,
    required this.onOkButtonPressed,
    required this.onCancelButtonPressed,
    required this.buttonOkText,
    required this.buttonCancelText,
    required this.description,
    this.buttonNeutralText = '',
    this.onNeutralButtonPressed,
    this.onlyOkButton = false,
    this.onlyCancelButton = false,
    this.buttonOkColor = Colors.green,
    this.buttonCancelColor = Colors.grey,
    this.buttonNeutralColor = Colors.yellow,
    this.cornerRadius = 8.0,
    this.buttonRadius = 8.0,
    this.entryAnimation = EntryAnimation.base,
    Key? key,
  })  : assert(image != null, 'image != null'),
        assert(title != null, 'title != null'),
        super(key: key);

  /// Image to display in dialog.
  ///
  /// Pass `Image.network(src)` widget here.
  /// Preferably with `fit: BoxFit.cover` property to cover entire top part
  /// of Giffy Dialog. All properties of Image widget are directly passed to
  /// Gif Dialog so feel free to experiment.
  final Widget image;

  /// Title text.
  final Widget title;

  /// Description text
  final Widget description;

  /// Sets dialog to have only OK button.
  ///
  /// Default is false.
  /// If set to true there is no need to set [buttonCancelText],
  /// [buttonCancelColor] and [onCancelButtonPressed]
  final bool onlyOkButton;

  /// Sets dialog to have only Cancel button.
  ///
  /// Default is false.
  /// If set to true there is no need to set [buttonOkText], [buttonOkColor]
  /// and [onOkButtonPressed]
  final bool onlyCancelButton;

  /// Text for OK button.
  ///
  /// Default is `Neutral`.
  final String buttonNeutralText;

  /// Text for OK button.
  ///
  /// Default is `OK`.
  final String buttonOkText;

  /// Text for cancel button
  ///
  /// Default is `Cancel`.
  final String buttonCancelText;

  /// Color of OK button.
  ///
  /// Default is `Colors.yellow`.
  final Color buttonNeutralColor;

  /// Color of OK button.
  ///
  /// Default is `Colors.green`.
  final Color buttonOkColor;

  /// Color of Cancel button
  ///
  /// Default is `Colors.grey`.
  final Color buttonCancelColor;

  /// Radius applied to the button corners.
  ///
  /// Default is 8.
  final double buttonRadius;

  /// Radius applied to the dialog box corners.
  ///
  /// Default is 8.
  final double cornerRadius;

  /// Callback function to be called on when Neutral button is pressed.
  ///
  /// If set to null, then the button will be disabled and by
  /// default will resemble a flat button in the Theme's `disabledColor`.
  final VoidCallback? onNeutralButtonPressed;

  /// Callback function to be called on when OK button is pressed.
  ///
  /// If set to null, then the button will be disabled and by
  /// default will resemble a flat button in the Theme's `disabledColor`.
  final VoidCallback onOkButtonPressed;

  /// Callback function to be called on when Cancel button is pressed.
  ///
  /// By default (or if set to null) closes the Giffy Dialog via
  /// `Get.back()`.
  final VoidCallback onCancelButtonPressed;

  /// Defines how Giffy Dialog will enter the screen.
  ///
  /// Default is [EntryAnimation.base] - standard Material dialog
  /// entrance animation, i.e. slow fade-in in the center of the screen.
  final EntryAnimation entryAnimation;

  @override
  Widget build(BuildContext context) {
    return BaseGifDialog(
      imageWidget: image,
      cornerRadius: cornerRadius,
      title: title,
      description: description,
      onlyOkButton: onlyOkButton,
      onlyCancelButton: onlyCancelButton,
      buttonCancelColor: buttonCancelColor,
      buttonRadius: buttonRadius,
      buttonCancelText: buttonCancelText,
      buttonOkColor: buttonOkColor,
      onOkButtonPressed: onOkButtonPressed,
      onCancelButtonPressed: onCancelButtonPressed,
      buttonOkText: buttonOkText,
      entryAnimation: entryAnimation,
      buttonNeutralColor: buttonNeutralColor,
      buttonNeutralText: buttonNeutralText,
      onNeutralButtonPressed: onNeutralButtonPressed,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DoubleProperty('cornerRadius', cornerRadius))
      ..add(DoubleProperty('buttonRadius', buttonRadius))
      ..add(StringProperty('buttonOkText', buttonOkText))
      ..add(ColorProperty('buttonOkColor', buttonOkColor))
      ..add(StringProperty('buttonCancelText', buttonCancelText))
      ..add(ColorProperty('buttonCancelColor', buttonCancelColor))
      ..add(DiagnosticsProperty<bool>('onlyOkButton', onlyOkButton))
      ..add(EnumProperty<EntryAnimation>('entryAnimation', entryAnimation))
      ..add(DiagnosticsProperty<bool>('onlyCancelButton', onlyCancelButton))
      ..add(ColorProperty('buttonNeutralColor', buttonNeutralColor))
      ..add(StringProperty('buttonNeutralText', buttonNeutralText))
      ..add(ObjectFlagProperty<VoidCallback>.has(
        'onOkButtonPressed',
        onOkButtonPressed,
      ))
      ..add(ObjectFlagProperty<VoidCallback>.has(
        'onCancelButtonPressed',
        onCancelButtonPressed,
      ))
      ..add(ObjectFlagProperty<VoidCallback>.has(
        'onNeutralButtonPressed',
        onNeutralButtonPressed,
      ));
  }
}
