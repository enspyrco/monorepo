# During development, while using the example project to test changes, it
# can be useful to clean and delete all the potentially cached pods stuff
# so any changes to the build or the C/C++ code isn't cached away and we
# get a shiny clean build that includes our most recent changes.
# For info on the deintegrate command see https://guides.cocoapods.org/terminal/commands.html#pod_deintegrate
cd ../flutter_box2d/example/$1
flutter clean
pod deintegrate
flutter pub get