# Codeclan Week 02 Day 05

## Multiple Classes, Interactions & Class Diagrams Week Homework



## Homework Review Notes

Remember to test negative cases.
Each class should be invisible to each other. River should have had a get_fish function - see homework answers.
Abstraction? Each method should not see into the others mechanisms.



## Homework MVP

Create an object oriented model of a Karaoke Bar.
This should have Rooms, Guests, Songs and a Bar - each will need a class.
* Requirements:
* Guests should be able to check in and out of rooms
* Songs should be added to rooms
* Number of guests should not exceed room capacity
* Guests should pay an entry fee to check into room
* Guests should have a favourite song and if it's on  playlist execute their party piece





Stick to your principles:

* Always start on paper with the screen off, write down MVP.
* Create Class diagram detailing classes, attributes, tests and methods. Check before beginning to code.
* Read MVP again make sure it's covered.
* Take breaks or the screen will turn your eyes to fudge
* Test first, make it fail, code it to pass, test again, commit THEN refactor - this lets you know your passes are solid.
* Keep your variable names typed for understanding.
* Watch the console, use PRY for this one and progress step-by-step when muddled.




## Notes

* Initially I'd considered giving both the room and the bar a check_if_guest_has_money function but - drawing from pub lab solution - if you limit the guest purchasing action with a check_sufficient_fund function you can kill 2 birds with one stone. Responsibility though?
* Reading through this it at first seems that rooms should have functionality to check in check out guests - HOWEVER - it's a karaoke bar - there may be many rooms with different prices and you'd only want to be in one at any one time (assuming it's like a hotel) make the Bar class the runner/linchpin.
* Be careful of nils slipping through if you've mistyped instance variables e.g. song instead of song_1 in both function and assertion but still return true yet be functionally useless.



### Order of approach:

* Write it down on paper first - split it up into attributes and behaviours, understand what needs built.
* Create Class Diagram utilising UML detailing classes & interaction
* Set up directory, spec files and source code files, create Git repository and get that first commit in.
* Begin with the classes which have zero dependencies and then work your way up.
* Get your test requirements, file requirements and headers down then draw down from MiniTest to create test class.
* Create setup data in each test file to be used - create an @object of each class necessary to be tested.
* Create class in source file. Create initialize method.
* Begin creating test functions, let it fail, then code it to pass.
* Commit once passed. Keep a record, keep it clean.




## Files

* drink.rb - Source code for Drink class
* drink_spec.rb - Test spec for Drink class
* song.rb - Source code for Song class
* song_spec.rb - Test spec for Song class
* guest.rb - Source code for Guest class
* guest_spec.rb - Test spec for Guest class
* room.rb - Source code for Room class
* room_spec.rb - Test spec for Room class
* bar.rb - Source code for Bar class
* bar_spec.rb - Test spec for Bar class


> "What do I know? I'm a bear. I sucks the heads off fish..."
