## [3.2.0] - 06/11/2022
* Dart 3 support

## [3.1.0] - 06/11/2022
* Flutter 3 upgrade
* Use `flutter_lints` & required fixes
* Update `GroovinListTile` and `GroovinExpansionTile` to match their latest `material` versions

## [3.0.2] - 07/01/2021
* Bug fix: Add `initialValue` to `FormField` created by `OutlineDropdownButtonFormField`

## [3.0.1] - 06/25/2021
* Add keys to widgets that were missing them and allow `OutlineDropdownButton` and its items to be typed.

## [3.0.0] - 05/30/2021
* BREAKING CHANGE - `AvatarBackButton` now requires a `Widget backButton` to allow for platform-adaptive functionality.

## [2.1.0] - 05/30/2021
* Introduces the `ScrollControllerBuilder` widget
* Bump min Dart SDK version to 2.13

## [2.0.0] - 03/15/2021
* 🎉 Migrated to null safety 🎉

## [2.0.0-nullsafety.1]
* Update example to Android Embedding API v2, AndroidX
* Update example to support macOS and web

## [2.0.0-nullsafety.0]
* Null safety pre-release
* Update readme

## [1.6.1] - 02/7/2020
* Minor documentation, readme updates

## [1.6.0] - 06/28/2020
* Introduces `/src/utils`, which contains various small utilities I find useful in my projects. 
This initial release includes: 
  * `color_utils.dart` containing the `HexColor` class and `textLuminance` function
  * `json_utils.dart` containing the `printFormattedJson` function
* Refactor `src` to include directories `widgets` and `utils`
* Update example app

## [1.5.0] - 03/22/2020
* Introduces the AvatarBackButton widget
* **1.5.0+1**: run `flutter format` on `avatar_back_button.dart`
* **1.5.0+2 - 05/23/2020**
  * Update readme
  * Add FUNDING.yml
  * Update example
* **1.5.0+4 - 06/21/2020**
  * Constrain min Dart SDK to 2.7
  * Refactor widgets into `/src`

## [1.4.3 - 1.4.5] - 02/17/2020
* Addresses pub health suggestions
* Updates environment SDK
* Updates gitignore

## [1.4.2] - 05/20/2019
* Addresses pub health suggestions

## [1.4.1] - 05/20/2019
* Updates README

## [1.4.0] - 05/20/2019
* Adds the SplitColorBackground widget

## [1.3.2] - 12/30/2018
* Updates OutlineDropdownButtonFormField widget to allow for custom InputDecorations (credit: DarthDie)

## [1.3.1] - 12/25/2018
* Updates README

## [1.3.0] - 12/25/2018
* Introduces the OutlineDropdownButtonFormField widget (credit: DarthDie)

## [1.2.1] - 12/17/2018
* The default trailing icon in the GroovinExpansionTile widget now is initialized with Colors.grey,
and the property is open to customization

## [1.2.0] - 12/12/2018
* Added the GroovinExpansionTile widget

## [1.1.0] - 11/18/2018

* Changed the default padding for OutlineDropdownButton

## [1.0.1] - 11/18/2018

* Fix example not showing on pub

## [1.0.0] - 11/17/2018

* Initial release containing ModalDrawerHandle and OutlineDropdownButton widgets