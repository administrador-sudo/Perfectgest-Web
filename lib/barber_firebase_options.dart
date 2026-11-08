/// Credenciais web do projeto Firebase `perfectgest-barber` (só REST no site).
/// Gerado a partir do FlutterFire; sem import de firebase_core.
class DefaultFirebaseOptions {
  static const web = _BarberWebOptions(
    apiKey: 'AIzaSyAJWveXJvWuOfk2Y-4AcyQ9Tb9FDql3IGA',
    appId: '1:924212815170:web:9947263524b6184d9414db',
    messagingSenderId: '924212815170',
    projectId: 'perfectgest-barber',
    authDomain: 'perfectgest-barber.firebaseapp.com',
    storageBucket: 'perfectgest-barber.firebasestorage.app',
  );
}

class _BarberWebOptions {
  const _BarberWebOptions({
    required this.apiKey,
    required this.appId,
    required this.messagingSenderId,
    required this.projectId,
    required this.authDomain,
    required this.storageBucket,
  });

  final String apiKey;
  final String appId;
  final String messagingSenderId;
  final String projectId;
  final String authDomain;
  final String storageBucket;
}
