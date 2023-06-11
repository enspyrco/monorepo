# enspyrco monorepo

*A [monorepo](https://en.wikipedia.org/wiki/Monorepo) of [Dart](https://dart.dev/) &amp; [Flutter](https://flutter.dev/) projects from [Enspyr](https://github.com/enspyrco), constituting a set of tools to facilitate & improve [adventuring](https://github.com/adventures-in/projects_summary).*

## Contributing

If you are working on a particular package you can open the relevant sub-folder and work like you would outside of a monorepo context.

If you plan to work on several packages at once you will need to open the `monorepo` folder and (for VS Code) add the `"dart.projectSearchDepth": 5` setting, so that VS Code knows to treat the monorepo like a Flutter project.

## Packages

### [adventure_maker](packages/adventures/README.md) [![badge](https://enspyrco-monorepo.web.app/coverage/adventure_maker/badge.png)](https://enspyrco-monorepo.web.app/coverage/adventure_maker/)

*Create, organise & discover adventures taking place in tech-world.*

### [flireator](packages/flireator/README.md) [![badge](https://enspyrco-monorepo.web.app/coverage/flireator/badge.png)](https://enspyrco-monorepo.web.app/coverage/flireator/)

*A project creation tool for Flutter projects with a Firebase backend, stored on GitHub.*

### [redfire](packages/redfire/README.md) [![badge](https://enspyrco-monorepo.web.app/coverage/redfire/badge.png)](https://enspyrco-monorepo.web.app/coverage/redfire/)

*A redux based state management & navigation solution, with prebuilt modules for Firebase features.*

### [redfire_test](packages/redfire_test/README.md) [![badge](https://enspyrco-monorepo.web.app/coverage/redfire_test/badge.png)](https://enspyrco-monorepo.web.app/coverage/redfire_test/)

*Utilities to simplify testing in apps that use redfire.*

### [tech_world](packages/tech_world/README.md) [![badge](https://enspyrco-monorepo.web.app/coverage/tech_world/badge.png)](https://enspyrco-monorepo.web.app/coverage/tech_world/)

*Adventures In Tech World, for fun and profit.*

### [the_process](packages/the_process/README.md) [![badge](https://enspyrco-monorepo.web.app/coverage/the_process/badge.png)](https://enspyrco-monorepo.web.app/coverage/the_process/)

*A tool to automate "the process", a system for organising collaboration.*

### [ws_game_server](packages/ws_game_server/README.md) [![badge](https://enspyrco-monorepo.web.app/coverage/ws_game_server/badge.png)](https://enspyrco-monorepo.web.app/coverage/ws_game_server/)

*Using shelf and shelf_web_socket for a serverless websocket server.*

### [ws_game_server_types](packages/ws_game_server_types/README.md) [![badge](https://enspyrco-monorepo.web.app/coverage/ws_game_server_types/badge.png)](https://enspyrco-monorepo.web.app/coverage/ws_game_server_types/)

*Types for game objects sent via a ws_game_server.*

## TLAs

Three letter acronyms used in commit messages:

- aau = astro_auth
- acf = authorization code flow
- acu = api_client_utils
- aeh = astro_error_handling
- aei = astro_error_handling_interface
- agn = astro_generators
- ais = astro_inspector_screen
- alr = astro_locator
- anv = astro_navigation
- ast = astro
- asi = astro_state_interface
- asn = astro_snippets
- atu = astro_test_utils
- aty = astro_types
- avm = adventure_maker
- avs = Adventuverse (project)
- b2c = flutter_box2c
- ccv = coding-challenge-verifier
- ddi = dragndrop_image_effects
- dic = discord_api_client
- dvr = domain_visualiser
- enl = enspyr_lints
- fai = firebase_auth_service_interface
- faf = firebase_auth_service_flutterfire
- ffu = ffi_utils
- flr = flireator
- fof = flutter_opencv_ffi
- fot = flutter_opengl_texture
- fsf = firestore_service_flutterfire
- fsg = firestore_service_googleapis
- fsi = firestore_service_interface
- fsr = firestore_service_grpc
- ftl = flutter_tflite_ffi
- gac = get_google_api_credentials
- gae = github_api_envoy
- gau = googleapis_utils
- gmg = gamegin
- iap = identify_affected_packages
- ips = identity_platform_service
- jst = json_types
- lcr = locator
- mgc = magicians
- noc = notion_api_client
- oap = openapi_parser
- oml = our_meals
- pae = process_articles_in_emails
- pdg = package_dependency_graph
- pdu = pdf_utils
- prs = presinter
- pxe = pixel_editor
- rdd = redux_devtools_desktop
- rdp = run_dart_code_in_pubsub_message
- rsd = resourganizer_desktop
- tpr = the_process
- twr = tech_world
- wgs = ws_game_server
- wgt = ws_game_server_types
- whs = whos_shout
- &plus; = multiple repos
- &ast; = monorepo, CI/CD, etc.
