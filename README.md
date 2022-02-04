# BirthdaysAppChallenge

A simple application that allows the user to keep track of birthdays stored at https://randomuser.me/api/?results=1000&seed=chalkboard&inc=name,dob

When you open the app, you'll be able to see a list of peoples birthdays in order. You will also be able to view a person and it will also tell you how old they are (or will be).

### Prerequisites

##### CocoaPods

-  Make sure CocoaPods is installed.

- [CocoaPods](https://github.com/CocoaPods/CocoaPods) - The application level dependency manager used.  Update your Podfile to include the following:

`pod 'Alamofire'`

- Run pod install.

### Running the app

Open BirthdaysAppChallenge.xcworkspace with xcode. you can either install in an iOS device or running the project in the simulator.

### User Interface

The user interface is made up of 2 viewcontrollers:

- BirthdaysListViewController
- BirthdayDetailViewController

#### BirthdaysListViewController

- This is the meain view of the application showing a list of names and alongside their date of birth.

- Tapping on any of the names takes you to the BirthdayDetailViewController.


#### BirthdayDetailViewController

- This view shows a single page with the selected persons name and age.


### Technical Decisions

- An MVVM architecture was used due to its suitability with the project.  MVVM allows greater distribution between the app modules which in turn allows for greater testability.  Although this is a simple app, the archetecutre chosen will help maintain it's distribution and testability if the app were to grow in complexity.

- Alamofire was used as the single dependency to aid in network calling.  It was used to as an implementation example and would also help reduce complexity if multiple network calls were to be added in future versions of the app.

- The two above choices have their trade offs.  For example MVVM requires more boiler plate code than other architectures (such as MVC) to get started but is more supportive of a complex application and so this choice was forward thinking.  Similarly adding dependencies (Alamofire) that are not completely necessary can be seen as a limitation but again can help as the app evolves.


### Areas for impovment

- If given more time more tests should be added to test other areas of the app beyond the api response

- The included test would fail if the data retreived from the api was not static

- The formatting used for the date of birth has the potential to fail if the remote format was to be updated

- Adding a simple search bar to filter the birthdays list by user input would be a good addition to the user experience




