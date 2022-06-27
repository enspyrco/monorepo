# redfire

[< monorepo] [📒]

*A redux based state management & navigation solution, with prebuilt modules for Firebase features.*

<details>
<summary>One time setup for new projects</summary>
<br>

Firstly, we promise this tedious nonsense will be automated away ASAP, but for now:

- [Setup your Firebase project]
- [Configure local settings]
- [Configure platform targets]
- [Add required code]
- [Setup Auth providers]
- [Add helper methods]
- Optionally also:
  - [Setup GitHub project]
  - [Setup CI/CD with GitHub Actions]
  - [Install Redux DevTools]

</details>

## Why redfire?

By combining [Redux] and the [Pages API], redfire provides navigation via a simple action dispatch.

With our (WIP) [Redux plugin for DevTools], you can visualise the flow of data through your app.

We use snippets & code gen to take the sharp edges off using redux, and an architecture that provides a hijackable data flow for contexts where performance is more important than being able to visualise the flow of data.

Prebuilt feature modules can be dropped in and swapped out as your needs change:

| ✅ Complete | 📈 In Progress   | 🔳 Not Started |
| ------------| --------------- | -------------- |
|             | Authentication  | RTDB           |
|             | Firestore       | Messaging      |

For latest progress see [RedFire feature modules GitHub project].

## How to use redfire

- [Using built-in services & pre-made UI]
- [Creating pages & navigating]
- [Managing local, global & remote state]
- [Visualising data flow & state change in your app]
- [Writing lots of beautiful tests with redfire_test]

<details>
<summary>Optional extras</summary>
<br>

- [Manually deploying to firebase hosting]
- [Optional Style Guide]

</details>

## Need more info?

Here are some of the [gory details] if that's your thing.

## Having problems?

Have a look in [troubleshooting] - if that doesn't help, you could [file an issue] (if the problem is reproducible without too much effort) or discuss on the Discord.

## Want to contribute?

**Awesome!**

See if anything inspires you in:

- Current [GitHub issues]
- Planned [future work]

Or if you have an improvement in mind, open an issue to discuss a feature request.

[< monorepo]: ../../../../README.md
[📒]: https://enspyrco.notion.site/RedFire-406c10fbadfb44e3a6f2806a1b6023bf
[Redux]: https://github.com/fluttercommunity/redux.dart
[Redux plugin for DevTools]: https://github.com/nickmeinhold/devtools
[RedFire feature modules GitHub project]: https://github.com/enspyrco/monorepo/projects/1
[Pages API]: https://api.flutter.dev/flutter/widgets/Navigator-class.html
[Setup your Firebase project]: docs/setup/setup-firebase-project/setup-firebase-project.md
[Configure local settings]: docs/setup/configure/configure-local-settings.md
[Configure platform targets]: docs/setup/configure/configure-platform-targets.md
[Add required code]: docs/setup/add-required-code.md
[Setup Auth providers]: docs/setup/setup-auth.md
[Add helper methods]: docs/setup/add_helper_methods.md
[Setup Firebase Databases]: docs/setup/setup-databases.md
[Setup GitHub project]: docs/setup/setup-github.md
[Setup CI/CD with GitHub Actions]: docs/setup/setup-cicd.md
[Using built-in services & pre-made UI]: docs/use/built-in-and-pre-made.md
[Creating pages & navigating]: docs/use/create_pages_navigate.md
[Managing local, global & remote state]: docs/use/manage-local-global-remote-state.md
[Manually deploying to firebase hosting]: docs/use/manually-deploy.md
[Optional Style Guide]: docs/use/optional-style-guide.md
[gory details]: docs/gory-details.md
[Install Redux DevTools]: docs/setup/setup-redux-devtools.md
[Visualising data flow & state change in your app]: docs/use/visualise-data-flow.md
[Writing lots of beautiful tests with redfire_test]: ../redfire_test/README.md
[troubleshooting]: docs/trouble-shooting.md
[file an issue]: https://github.com/enspyrco/monorepo/issues
[GitHub issues]: https://github.com/enspyrco/monorepo/issues
[Future work]: docs/future-work.md
