# The Ubiquitous Language

## Models

- classes are named ...State
- used by the redux "app state"
- sent to and from the Database.

## Actions

### AppState interaction

An AppState interaction sets the relevant part of the app state to the supplied value.

- has the form: Set<SomeState>Action

### Database Interaction

#### CRUD+T

- Create
- Read
- Update
- Delete
- Tap → returns a stream of changes at the given location
