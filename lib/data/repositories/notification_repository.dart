// ignore: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:sqflite/sqlite_api.dart';
import '../models/notification/notification_model.dart';

class NotificationsRepository{
  Database? database;
  String tableName="notifications";

  NotificationsRepository();

  Future<Database> getDb() async {
    if (database == null) {
      database = await createDatabase();
      return database!;
    }
    return database!;
  }


  createDatabase() async {

    String databasesPath = await getDatabasesPath();
    String dbPath = '${databasesPath}notifications.db';

    var database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
    return database;
  }

  void populateDb(Database database, int version) async {
    await database.execute("CREATE TABLE $tableName ("
        "id TEXT,"
        "description TEXT,"
        "courseId INTEGER,"
        "dateTime TEXT,"
        "image TEXT"
        ")");
  }

  Future addNotification(NotificationModel notificationModel) async {
    Database db = await getDb();
    var id = await db.insert(tableName, notificationModel.toJson());
    print("Notification added to Sql");

  }

  Future<List> getNotifications() async {
    Database db = await getDb();

    var result = await db.query(tableName, columns: ["id", "description", "dateTime", "image","courseId"]);

    return result.toList();
  }

  Future deleteNotifications() async{
    Database db = await getDb();
    db.delete(tableName);
  }


}