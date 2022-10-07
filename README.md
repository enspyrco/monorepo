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

- acf - authorization code flow
- aau = astro_auth
- aci = astro_core_interface
- aeh = astro_error_handling
- aei = astro_error_handling_interface
- anv = astro_navigation
- ast = astro
- asi = astro_state_interface
- ais = astro_inspector_screen
- atu = astro_test_utils
- avs = Adventuverse (project)
- avm = adventure_maker
- ccv = coding-challenge-verifier
- dvr = domain_visualiser
- dip = discord_interaction_to_pubsub_message
- flr = flireator
- fai = firebase_auth_service_interface
- fsg = firestore_service_googleapis
- fsi = firestore_service_interface
- fsf = firestore_service_flutterfire
- gae = github_api_envoy
- gau = googleapis_utils
- gla = gather_link_account
- gls = gather_link_account_shelf
- jst = json_types
- lcr = locator
- oml = our_meals
- pae = process_articles_in_emails
- rdd = redux_devtools_desktop
- rdp = run_dart_code_in_pubsub_message
- rfr = redfire
- rft = redfire_test
- rfl = redfire_lints
- rsd = resourganizer_desktop
- twr = tech_world
- tpr = the_process
- wgs = ws_game_server
- wgt = ws_game_server_types
- &plus; = multiple repos
- &ast; = monorepo, CI/CD, etc.
