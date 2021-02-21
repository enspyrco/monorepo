import 'package:googleapis/drive/v3.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'drive_api_test_doubles.mocks.dart';

@GenerateMocks([DriveApi, FilesResourceApi])
class DriveApiTestDoubles {
  DriveApiTestDoubles();
}

enum DriveFunctionNamed { update, create }

MockDriveApi createDriveApiMockThatReturns(
    {required File file, required DriveFunctionNamed onCalling}) {
  final mockDriveApi = MockDriveApi();
  final mockFilesResourceApi = MockFilesResourceApi();

  // Stub the DriveApi mock to return a FilesResourceApi mock that in turn
  // retruns a File, with the given id and parents when 'update' is called.
  when(mockDriveApi.files).thenReturn(mockFilesResourceApi);
  if (onCalling == DriveFunctionNamed.update) {
    when(mockFilesResourceApi.update(any, any,
            addParents: anyNamed('addParents'),
            enforceSingleParent: anyNamed('enforceSingleParent'),
            includePermissionsForView: anyNamed('includePermissionsForView'),
            keepRevisionForever: anyNamed('keepRevisionForever'),
            ocrLanguage: anyNamed('ocrLanguage'),
            removeParents: anyNamed('removeParents'),
            supportsAllDrives: anyNamed('supportsAllDrives'),
            supportsTeamDrives: anyNamed('supportsTeamDrives'),
            useContentAsIndexableText: anyNamed('useContentAsIndexableText'),
            $fields: anyNamed('\$fields'),
            uploadOptions: anyNamed('uploadOptions'),
            uploadMedia: anyNamed('uploadMedia')))
        .thenAnswer((_) => Future.value(file));
  }
  if (onCalling == DriveFunctionNamed.create) {
    when(mockFilesResourceApi.create(any,
            enforceSingleParent: anyNamed('enforceSingleParent'),
            ignoreDefaultVisibility: anyNamed('ignoreDefaultVisibility'),
            includePermissionsForView: anyNamed('includePermissionsForView'),
            keepRevisionForever: anyNamed('keepRevisionForever'),
            ocrLanguage: anyNamed('ocrLanguage'),
            supportsAllDrives: anyNamed('supportsAllDrives'),
            supportsTeamDrives: anyNamed('supportsTeamDrives'),
            useContentAsIndexableText: anyNamed('useContentAsIndexableText'),
            $fields: anyNamed('\$fields'),
            uploadOptions: anyNamed('uploadOptions'),
            uploadMedia: anyNamed('uploadMedia')))
        .thenAnswer((_) => Future.value(file));
  }

  return mockDriveApi;
}
