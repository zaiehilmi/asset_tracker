import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:june/state_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ui/config.dart';
import 'package:ui/localization/localization.dart';
import 'package:ui/navigation/application.dart';
import 'package:ui/navigation/application_viewmodel.dart' show ApplicationVM;
import 'package:ui/theme/theme_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );

  await Supabase.initialize(
    url: Config.supabaseUrl,
    anonKey: Config.supabaseKey,
  );

  timeago.setLocaleMessages('ms', TimeagoLocalizationMs());
  timeago.setLocaleMessages('ms_short', TimeagoShortLocalizationMs());
  timeago.setDefaultLocale('ms');

  runApp(const MainApp());
}

class MainApp extends HookWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return JuneBuilder(
      ApplicationVM.new,
      builder:
          (vm) => CupertinoApp(
            theme: temaAplikasi.copyWith(brightness: vm.brightness),
            localizationsDelegates: const [
              DefaultWidgetsLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
              CupertinoLocalizationsMsDelegate(),
            ],
            supportedLocales: const [Locale('ms')],
            locale: const Locale('ms'),
            home: const Application(),
          ),
    );
  }
}
