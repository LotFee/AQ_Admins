import 'package:easy_logger/easy_logger.dart';

final EasyLogger logger = EasyLogger(
  name: 'remote',
  enableBuildModes: [
    BuildMode.debug,
    BuildMode.profile,
  ],
  enableLevels: [
    LevelMessages.debug,
    LevelMessages.info,
    LevelMessages.error,
    LevelMessages.warning
  ],
);
