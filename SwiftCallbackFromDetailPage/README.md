#SwiftCallbackFromDetailPage

This example shows an array 'FixedMessagesModel' of items 'fixedMessage' which are composed of several properties (id, title... and so on). The rows are shown in the form of a NavigationLink. Rows can be deleted (swipe to delete) and new rows can be added.
Additionally there are two buttons on the (child) detail View (Cmd to parent) and (Cmd to grandparent). Pressing the first starts a function on its parent view. Pressing the second leads the command back over the parent view to the grandparent view where a print function is initiated.


![Screenshot](https://github.com/RoSchmi/ProgramsXCode/blob/master/SwiftCallbackFromDetailPage/Pictures/SwiftNavigationList.png)


![Screenshot](https://github.com/RoSchmi/ProgramsXCode/blob/master/SwiftCallbackFromDetailPage/Pictures/SwiftCallback_2.png)


