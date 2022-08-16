class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 1;

  List<String> titles = [
    'كل المنتجات',
    'التصنيفات',
    'الاحصائيات',
  ];
  List<Widget> screens = [
    pruducts(),
    category(),
    statistics(),
  ];
  void changeBottomNAv(int index) {
    currentIndex = index;
    emit(changeBottomNAvState());
  }

  Database? database;

  void CreatDataBase() {
    openDatabase('todo.db', version: 1, onCreate: (database, version) {
      database.execute(
          // productsName TEXT,quantum INTEGER,price1 REAL,date TEXT,
          'CREATE TABLE productsTable(id INTEGER PRIMARY KEY ,'
          'productsName TEXT NOT NULL,quantum INTEGER NOT NULL,price1 REAL NOT NULL,'
          'date TEXT NOT NULL,status TEXT NOT NULL)');
      database
          .execute(
              // productsName TEXT,quantum INTEGER,price1 REAL,date TEXT,
              'CREATE TABLE categoryTable(id INTEGER PRIMARY KEY ,categoryName TEXT NOT NULL,status TEXT NOT NULL)')
          .then((value) {
        print('table created');
      }).catchError((error) {
        print('error when creating table ${error.toString()}');
      });
    }, onOpen: (database) {
      GetDataFromDataBase(database);
      print('database opened');
    }).then((value) {
      database = value;
      emit(CreateDataBaseState());
    });
  }

  insertIntoDatabase({
    String? productsName,
    dynamic quantum,
    dynamic price1,
    String? date,
  }) async {
    await database!.transaction((txn) async {
      await txn
          .rawInsert(
              // productsName,quantum,price1,date,
              // "$productsName","$quantum","$price1","$date",
              'INSERT INTO productsTable(productsName,quantum,price1,date,status)'
              'VALUES("$productsName","$quantum","$price1","$date","NEW")')
          .then((value) {
        print('$value insert successfullllllllllllllllly');

        emit(insertDataBaseState());
        GetDataFromDataBase(database);
      }).catchError((error) {
        print('error when inserting ${error.toString()}');
      });
      return null;
    });
  }

  insertIntoCategoryDatabase({
    String? categoryName,
  }) async {
    await database!.transaction((txn) async {
      await txn
          .rawInsert('INSERT INTO categoryTable(categoryName,status)'
              'VALUES("$categoryName","NEW")')
          .then((value) {
        print('$value insert successfullllllllllllllllly');

        emit(insertCategoryDataBaseState());
        GetCategoryDataFromDataBase(database);
      }).catchError((error) {
        print('error when inserting ${error.toString()}');
      });
      return null;
    });
  }

  List<Map> list = [];

  void GetDataFromDataBase(database) {
    database.rawQuery('SELECT * FROM productsTable').then((value) {
      // value.forEach((element) {
      //   if(element['status']=='NEW')
      //     newtasks.add(element);
      //   else if(element['status']=='done')
      //     donetasks.add(element);
      //   else archivedtasks.add(element);
      // });
      list = value;
      print(list);

      emit(GetDataBaseState());
    });
  }

  List<Map> Categorylist = [];
  void GetCategoryDataFromDataBase(database) {
    // newtasks=[];
    // donetasks=[];
    // archivedtasks=[];
    database.rawQuery('SELECT * FROM categoryTable').then((value) {
      // value.forEach((element) {
      //   if(element['status']=='NEW')
      //     newtasks.add(element);
      //   else if(element['status']=='done')
      //     donetasks.add(element);
      //   else archivedtasks.add(element);
      // });
      Categorylist = value;
      print(Categorylist);

      emit(GetCategoryDataBaseState());
    });
  }
}
// void onUpgrade(Database db, int newVersion) async {
// // If you need to add new column in table or edit column datatype use it
//   db.execute("ALTER TABLE tabEmployee ADD COLUMN newCol TEXT;");
//
// // If you need to create new tables
//
//   await db.execute('''
//    create table $carTable (
//     $columnCarId integer primary key autoincrement,
//     $columnCarTitle text not null
//    )''');
//   await db.execute('''
//    create table $userTable(
//     $userId integer primary key autoincrement,
//     $name text not null
//    )''');
// }
