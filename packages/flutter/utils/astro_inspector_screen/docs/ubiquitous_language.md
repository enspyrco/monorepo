# Ubiquitous Language

## Action

### Action Name

### Action Type

### Action State

## Actions History List

The Astro Inspector Screeen has two main areas: the Actions History List and the State Change View.
As each Action is emitted by the Store and received by the Astro Inspector Screeen, it is added to a
the collection of Actions that backs the Actions History List. Each Action is displayed in the list as
an [Actions History Item].

### Actions History Item

Each item in the [Actions History List] displays the [Action Name] and [Action State], and visually indicates the [Action Type].

#### Indicating Action Type

There are two types of action: sync & async. Sync actions have an associated state change while Async
actions have no state change. The two types are displayed with visually distinct UI to clearly indicate
the makeup of the [Actions History List].

#### Displaying Action State

The [Action State] can take up a lot of screen realestate so should be hidden when the Item is not
selected and on selection, only show some of the state, allowing the rest to be shown if desired
(scrolling or dropdown).

The parent action, if any, is shown by the [Action Lineage Chart].

### Action Lineage Chart

## State Change View
