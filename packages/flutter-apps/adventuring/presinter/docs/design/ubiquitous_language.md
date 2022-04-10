# The Ubiquitous Language

## App

The app consists of several parts:

- Auth Screen
- Home Screen
  - Participant View
  - Presenter View
  - Builder View
- Profile Screen

## Session

Information grouped into slides, potentially with interactive elements.

### Sessions List

A list view of Session Summaries, which can be filtered using the Session List Filters.

### Session Summary

### Session List Filters

Filters are available above the Sessions List that will allow the user to see:

- your own sessions
- recent sessions

## Role

There are 3 Roles: Participant, Presenter & Builder.

A person can have all three Roles but only interacts with the system in one role at any given. Everyone starts off with the Participant Role and can give themselves the other roles as they choose.

### Presenter

A Presenter uses the app to control a Presentation while they present.

### Participant

A Participant views a Presentations being presented to them.  They may also interact via interactive compoents, posting in chat or by requesting to speak.

### Builder

A Builder builds a Presentation by adding text, images, ... to Slides.

## Slides

A slide is a group of information that is viewed together on screen at once. A Presenter moves between Slides and each consecutive Slide pair can have a Transition.

## Transitions

Transitions are animations that move from one slide to the next.

## Notion

A notes app with database superpowers <https://www.notion.so/>

### Notion Integration

A session can be linked with a Notion page and synced (one way for now) with a Sync Notion Page Button on the Session Details page.

### Sync Notion Page Button

This button has three states:

- Unlinked
- Linked
- Syncing
