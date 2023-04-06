// This was pulled out of the logs after I used the Dart Runner Application Command
// on a random message in the Adventures In Discord server.
const invalidMessageWithJustText = r'''
{
  "insertId": "642d9d940000e2760c3d4cd5",
  "jsonPayload": {
    "guild_locale": "en-US",
    "token": "fakeToken0",
    "channel": {
      "permissions": "70368744177663",
      "nsfw": false,
      "name": "adventure-ideas",
      "guild_id": "614736108042846218",
      "position": 5,
      "last_message_id": "951110653014323250",
      "rate_limit_per_user": 0,
      "topic": "If you have an idea for a project that you think would be fun to work on with others, you can describe it here and potentially co-ordinate getting started, or you can suggest topics you would like to discuss at the Meetup events.",
      "type": 0,
      "parent_id": "864830215217086465",
      "id": "862900841438511114",
      "flags": 0
    },
    "application_id": "938746298146885634",
    "channel_id": "862900841438511114",
    "member": {
      "user": {
        "public_flags": 0,
        "username": "nick (meinhold)",
        "avatar_decoration": null,
        "global_name": null,
        "avatar": "0723275997c1f1fa9a679de056a3eaeb",
        "id": "852151927852892170",
        "discriminator": "7938",
        "display_name": null
      },
      "roles": [],
      "is_pending": false,
      "nick": "nick (meinhold)",
      "communication_disabled_until": null,
      "premium_since": null,
      "deaf": false,
      "mute": false,
      "permissions": "70368744177663",
      "avatar": null,
      "flags": 0,
      "joined_at": "2021-06-28T12:17:10.494000+00:00",
      "pending": false
    },
    "version": 1,
    "id": "1093206156010340394",
    "type": 2,
    "guild_id": "614736108042846218",
    "locale": "en-GB",
    "app_permissions": "70368744177663",
    "data": {
      "target_id": "951110653014323250",
      "type": 3,
      "guild_id": "614736108042846218",
      "id": "1092463262290944060",
      "name": "Run Dart code",
      "resolved": {
        "messages": {
          "951110653014323250": {
            "channel_id": "862900841438511114",
            "mention_roles": [],
            "embeds": [],
            "author": {
              "username": "nick (meinhold)",
              "avatar": "0723275997c1f1fa9a679de056a3eaeb",
              "public_flags": 0,
              "display_name": null,
              "id": "852151927852892170",
              "global_name": null,
              "discriminator": "7938",
              "avatar_decoration": null
            },
            "flags": 0,
            "timestamp": "2022-03-09T13:34:10.460000+00:00",
            "content": "A Flutter app for presentations (something like Google Slides/Powerpoint/Keynote) with:\n- a web app that everyone 'warches'\n-  the presenter moves through the slides\n- there is also mobile apps for voting / answering questions \n- slides with a question shows stats for answers as they come in\n- stretch goal: extend the question/answers feature to include solving coding challenges",
            "edited_timestamp": null,
            "components": [],
            "mention_everyone": false,
            "mentions": [],
            "pinned": false,
            "attachments": [],
            "id": "951110653014323250",
            "tts": false,
            "type": 0
          }
        }
      }
    },
    "entitlement_sku_ids": [],
    "entitlements": []
  },
  "resource": {
    "type": "cloud_run_revision",
    "labels": {
      "project_id": "run-dart-code-on-discord",
      "service_name": "discord-interaction-to-pubsub-message",
      "revision_name": "discord-interaction-to-pubsub-message-00003-lip",
      "location": "us-central1",
      "configuration_name": "discord-interaction-to-pubsub-message"
    }
  },
  "timestamp": "2023-04-05T16:11:00.057974Z",
  "labels": {
    "instanceId": "00121789b31e8fe6ce596b4da600c91fb5970ce59c639f27da22bbe65cef6e1abec120d162df54d5727356068b796acec6a349d906ae52b4602c3ea44fe5165ed34146"
  },
  "logName": "projects/run-dart-code-on-discord/logs/run.googleapis.com%2Fstdout",
  "receiveTimestamp": "2023-04-05T16:11:00.303190174Z"
}
''';

const validMessageWithValidDart = r'''
{
  "insertId": "642e5a48000c0ebb90f6130d",
  "jsonPayload": {
    "channel_id": "1093408221470928966",
    "data": {
      "id": "1092463262290944060",
      "type": 3,
      "resolved": {
        "messages": {
          "1093408495207993375": {
            "tts": false,
            "mentions": [],
            "content": "```Dart\nint i = 10;\nint j = 20;\nreturn i*j;\n```",
            "components": [],
            "author": {
              "global_name": null,
              "username": "nick (meinhold)",
              "display_name": null,
              "avatar": "0723275997c1f1fa9a679de056a3eaeb",
              "id": "852151927852892170",
              "public_flags": 0,
              "avatar_decoration": null,
              "discriminator": "7938"
            },
            "pinned": false,
            "attachments": [],
            "type": 0,
            "edited_timestamp": null,
            "mention_everyone": false,
            "flags": 0,
            "timestamp": "2023-04-06T05:34:59.805000+00:00",
            "mention_roles": [],
            "id": "1093408495207993375",
            "embeds": [],
            "channel_id": "1093408221470928966"
          }
        }
      },
      "target_id": "1093408495207993375",
      "guild_id": "614736108042846218",
      "name": "Run Dart code"
    },
    "guild_id": "614736108042846218",
    "entitlements": [],
    "app_permissions": "70368744177663",
    "locale": "en-GB",
    "entitlement_sku_ids": [],
    "guild_locale": "en-US",
    "token": "fakeToken1",
    "version": 1,
    "type": 2,
    "id": "1093408783637684334",
    "application_id": "938746298146885634",
    "member": {
      "roles": [],
      "avatar": null,
      "user": {
        "display_name": null,
        "avatar_decoration": null,
        "public_flags": 0,
        "discriminator": "7938",
        "global_name": null,
        "id": "852151927852892170",
        "username": "nick (meinhold)",
        "avatar": "0723275997c1f1fa9a679de056a3eaeb"
      },
      "communication_disabled_until": null,
      "permissions": "70368744177663",
      "premium_since": null,
      "nick": "nick (meinhold)",
      "mute": false,
      "is_pending": false,
      "flags": 0,
      "joined_at": "2021-06-28T12:17:10.494000+00:00",
      "deaf": false,
      "pending": false
    },
    "channel": {
      "position": 14,
      "topic": null,
      "parent_id": "860487239807795250",
      "nsfw": false,
      "id": "1093408221470928966",
      "guild_id": "614736108042846218",
      "name": "🔱-👻-🎯-run-dart-code-on-discord",
      "permissions": "70368744177663",
      "last_message_id": "1093408758148911165",
      "rate_limit_per_user": 0,
      "flags": 0,
      "type": 0
    }
  },
  "resource": {
    "type": "cloud_run_revision",
    "labels": {
      "project_id": "run-dart-code-on-discord",
      "service_name": "discord-interaction-to-pubsub-message",
      "revision_name": "discord-interaction-to-pubsub-message-00004-ged",
      "location": "us-central1",
      "configuration_name": "discord-interaction-to-pubsub-message"
    }
  },
  "timestamp": "2023-04-06T05:36:08.790203Z",
  "labels": {
    "instanceId": "00121789b3c11ea5ceb3916d3b0bd187981ed851abf08091f8c57bebd96f76e7468386f013dcbe288c53b1f700cff37655680536eb2916f0e74e466c9ef7057fd8da"
  },
  "logName": "projects/run-dart-code-on-discord/logs/run.googleapis.com%2Fstdout",
  "receiveTimestamp": "2023-04-06T05:36:08.797373708Z"
}
''';
