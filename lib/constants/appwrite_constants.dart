class AppwriteConstants {
  static const String databaseId = '64c666c13beab57cc99b';
  static const String projectId = '64c50c24f2bd33c51dd9';
  static const String endPoint = 'http://172.20.10.3/v1';

  static const String userCollection = '64ecc14ed29b390c0c42';
  static const String tweetsCollection = '64f2fea6daf1df8b9642';

  static const String imagesBucket = '64f9ca5daaeece2d7204';

  static String imageUrl(String imageId) => '$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectId&mode=admin';
}