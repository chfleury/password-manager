import '../models/pass.dart';
import '../repository/database_creator.dart';

class RepositoryService {
  static Future<List<Pass>> getAllPasses() async {
    final sql = '''SELECT * FROM ${DatabaseCreator.passTable}''';
    final data = await db.rawQuery(sql);

    List<Pass> passes = [];
    for (final node in data) {
      final pass = Pass.fromJson(node);
      passes.add(pass);
    }
    return passes;
  }

  // static Future<Pass> getPass(int id) async {
  //   //final sql = '''SELECT * FROM ${DatabaseCreator.todoTable}
  //   //WHERE ${DatabaseCreator.id} = $id''';
  //   //final data = await db.rawQuery(sql);

  //   final sql = '''SELECT * FROM ${DatabaseCreator.passTable}
  //   WHERE ${DatabaseCreator.id} = ?''';

  //   List<dynamic> params = [id];
  //   final data = await db.rawQuery(sql, params);

  //   final todo = Pass.fromJson(data.first);
  //   return todo;
  // }

  static Future<void> addPass(Pass todo) async {
    /*final sql = '''INSERT INTO ${DatabaseCreator.todoTable}
    (
      ${DatabaseCreator.id},
      ${DatabaseCreator.name},
      ${DatabaseCreator.info},
      ${DatabaseCreator.isDeleted}
    )
    VALUES 
    (
      ${todo.id},
      "${todo.name}",
      "${todo.info}",
      ${todo.isDeleted ? 1 : 0}
    )''';*/
//  var value = {
//   ///      'age': 18,
//   ///      'name': 'value'
//   ///    };
//   ///    int id = await db.insert(
//   ///      'table',
//   ///      value,
//   ///      conflictAlgorithm: ConflictAlgorithm.replace,
//   ///    );
    var values = {
      DatabaseCreator.icon: 1,
      DatabaseCreator.hasLogin: false,
      DatabaseCreator.isProtected: false,
      DatabaseCreator.label: 'test',
      DatabaseCreator.password: ' test',
      DatabaseCreator.login: 'res'
    };

    int id = await db.insert(DatabaseCreator.passTable, values);

    // final sql = '''INSERT INTO ${DatabaseCreator.passTable}
    // (
    //   ${DatabaseCreator.id},
    //   ${DatabaseCreator.icon},
    //   ${DatabaseCreator.label},
    //   ${DatabaseCreator.login},
    //   ${DatabaseCreator.password},
    //   ${DatabaseCreator.hasLogin},
    //   ${DatabaseCreator.isProtected}

    // )
    // VALUES (?,?,?,?)''';
    // List<dynamic> params = [
    //   todo.id,
    //   todo.name,
    //   todo.info,
    //   todo.isDeleted ? 1 : 0
    // ];
    // final result = await db.rawInsert(sql, params);
    DatabaseCreator.databaseLog('Add pass', '', null, id, []);
  }

  static Future<void> deletePass(Pass pass) async {
    int count = await db.delete(DatabaseCreator.passTable,
        where: 'id = ?', whereArgs: [pass.id]);

    return count;
  }
  // static Future<void> updatePass(Pass todo) async {
  //   /*final sql = '''UPDATE ${DatabaseCreator.todoTable}
  //   SET ${DatabaseCreator.name} = "${todo.name}"
  //   WHERE ${DatabaseCreator.id} = ${todo.id}
  //   ''';*/

  //   final sql = '''UPDATE ${DatabaseCreator.todoTable}
  //   SET ${DatabaseCreator.name} = ?
  //   WHERE ${DatabaseCreator.id} = ?
  //   ''';

  //   List<dynamic> params = [todo.name, todo.id];
  //   final result = await db.rawUpdate(sql, params);

  //   DatabaseCreator.databaseLog('Update todo', sql, null, result, params);
  // }

  // static Future<int> todosCount() async {
  //   final data = await db
  //       .rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.todoTable}''');

  //   int count = data[0].values.elementAt(0);
  //   int idForNewItem = count++;
  //   return idForNewItem;
  // }
}
