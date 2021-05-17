import 'package:get_server/get_server.dart';

void main() => runApp(
      GetServer(
        home: FolderWidget('app/web'),
        getPages: [
          GetPage(
            name: '/',
            page: () => Html(path: 'app/web/index.html'),
          ),
          GetPage(
            name: '/redirect',
            page: () => Html(path: 'app/web/index.html'),
          ),
        ],
        onNotFound: Html(path: 'app/web/index.html'),
      ),
    );
