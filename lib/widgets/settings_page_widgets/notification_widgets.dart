import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/audio_provider.dart';

class NotificationSoundWidget extends StatelessWidget {
  const NotificationSoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SoundSelectionProvider>(
        builder: (context, provider, child) {
      return DropdownButtonFormField<String>(
        value: provider.selectedAudioFile,
        decoration: const InputDecoration(
          labelText: 'Notification sound',
        ),
        items: provider.audioFiles.map((audioFile) {
          return DropdownMenuItem<String>(
            value: audioFile,
            child: Text(
              audioFile,
            ),
          );
        }).toList(),
        onChanged: (value) {
          provider.setSelectedAudioFile(value!);
        },
      );
    });
  }
}
