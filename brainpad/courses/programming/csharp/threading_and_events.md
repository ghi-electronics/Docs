# Threading and Events

## Methods
The `BrainPad` object (or class) includes methods to control many aspects of the BrainPad's hardware. A method is a set of instructions grouped together. If a student is asked to speak, the command may look like `Student.Say("Hello")`. The `Say()` method is simple, but speaking requires many things like taking in air and moving your vocal cords. In the same sense, activating the LightBulb and Turning it green is a simple request but internally it does many small tasks to reach the final goal.
Methods can also take arguments. For example, you could have a method called `Student.Run()` to order a student to run or `Student.Run(slow)` to order them to run slow. Methods can also return a value, like `Student.GetAge()` which returns the student's age.

In the code example below, we show how a method we create called `Add` can be used to add 5 + 2 and print the total integer to the Output window. We've also added an additional line to display the result on the BrainPad's own display too. 
```
public class Program {
    public void BrainPadSetup() {
        int total = Add(5, 2);
        BrainPad.WriteToComputer(total);
        BrainPad.Display.DrawNumberAndShowOnScreen(1, 1, total);
    }

    public void BrainPadLoop() {
        // Declared but not used
    }

    public int Add(int a, int b) {
        return a + b;
    }
}
```
The above example creates a simple method that takes two integer arguments and returns an integer. The method will add the two arguments and return the results. 

Method names are like variable names, only certain things are allowed. Method names cannot start with a number, contain a symbol besides the underscore "_" or have a space in them.
The following examples show proper and improper use of method names.

Valid Method Names
```
bool AreAll4ButtonsPressed()
string Add(int a, int b)
```
Poorly named Methods
```
bool areallbuttonspressed()
int method34from94handler()
```
Note: Method names should always be easy to read and meaningful. This allows a programmer to easily discern what it does.

Invalid Method Names
```
bool Are All Buttons Pressed()
bool AreAllButtonsPressed?()
```
Methods are not required to return anything. To fill that case of not returning a value the keyword void is used.
```
void ActivateAlarm()
```
Finally, methods can also be private or public and static or non-static. This is beyond the scope of this course and `public static` will always be used.

## Overloading Methods
The same method name can have one or more argument types. Depending on the argument passed to the method, the system will determine which method to call as shown in in the code sample below we create a method called `Test` which can handle both an integer or a double. 

```
public class Program {
    public void BrainPadSetup() {
        Test(5);
        Test(5.0);
    }

    public void BrainPadLoop() {
        // Declared but not used
    }

    public void Test(int x) {
        BrainPad.WriteToComputer("integer");
        BrainPad.Display.DrawSmallText(1,1,"integer");
        BrainPad.Display.ShowOnScreen();
    }

    public void Test(double x) {
        BrainPad.WriteToComputer("double");
        BrainPad.Display.DrawSmallText(1, 20, "double");
        BrainPad.Display.ShowOnScreen();
    }
}
```
In the code above, you'll notice in the `BrainPadSetup()` we use the `Test()` method twice, once with a integer`(5)` and then with a double`(5.0)`. When the `Test()` method is called the computer determines what the data type is and routes to the appropriate method. This is what is meant by overloading a method. 

## Boolean Variables
In programming we use `true` or `false` to represent the truth values of logic. These values are known as `Boolean` or `bool` when coding. For example, let's say we need to check if the up and down buttons are pressed in multiple spots throughout our program. We could check each button in each spot or we could create a reusable method that returns true if both are pressed or false otherwise, as shown in the code examples below. 
```
public class Program {
    public void BrainPadSetup() {
        // Declared but not used
    }

    public void BrainPadLoop() {
        if (UpAndDownPressed()) {
            BrainPad.LightBulb.TurnGreen();
        }
        else {
            rainPad.LightBulb.TurnOff();
        }
    }

    public bool UpAndDownPressed() {
        if (BrainPad.Buttons.IsUpPressed() && BrainPad.Buttons.IsDownPressed()) {
            return true;
        }
        else {
            return false;
       }
    }
}
```
## The new Keyword
In the examples used so far, the BrainPad object has been used directly. This will not work for all object types. Remember the `Student.Say("Hello")` example? This statement is not completely valid because we don't know which student is going to say "Hello". To access a specific student, you need to create a variable named `mike` to hold the Student object as shown in the code sample below.
```
Student mike = new Student();
```
## Threading
Threading in the programming world is a way to describe multitasking. Each task is a thread that runs separately. The threading support in TinyCLR OS on the BrainPad is easy to work with. 

First, we need to inform the system that the threading library needs to be imported. We do this by adding the code below to the very top of our program, where other libraries are also imported. Like the `using GHIElectronics.TinyCLR.BrainPad;` library,  that allows us to program using the `BrainPad` object.
```
using System.Threading;
```
Before adding a thread, we need a method for it to use as shown in the code below. 
```
public class Program {
    public void BrainPadSetup() {
        Thread blinkerThread = new Thread(Blinker);
        blinkerThread.Start();

        while (true) {
            BrainPad.LightBulb.TurnRed();
            BrainPad.Wait.Seconds(0.1);
            BrainPad.LightBulb.TurnOff();
            BrainPad.Wait.Seconds(1);
        }
    }

    public void BrainPadLoop() {
        // Declared but not used
    }

    public void Blinker() {
        while (true) {
            BrainPad.LightBulb.TurnGreen();
            BrainPad.Wait.Seconds(0.2);
            BrainPad.LightBulb.TurnOff();
            BrainPad.Wait.Seconds(0.2);
        }
    }
}
```
The previous program will blink the light green Stepping through code, we can easily see how the Blinker method never returns execution to BrainPadSetup(). The program keeps looping infinitely inside the Blinker method. But most programs would probably need to blink the light while doing something else. This is where threads come in very handy.
First, we need to construct a Thread object as shown below. This object has special internal control over the program flow.
```
Thread blinkerThread = new Thread(Blinker);
```
Note how the names easily identify what they represent. The `blinkerThread()` method is a thread that handles the `Blinker()` method. All we need to do is `Start()` the thread and the `Blinker()` method will be executed. However, there is still an issue. The `BrainPadSetup()` method will reach the end, which will cause the program and all its threads to terminate. A temporary solution is to make the `BrainPadSetup()` method wait indefinitely is by using -1 milliseconds as shown in the code example below. 
```
public class Program {
    public void BrainPadSetup() {
        Thread blinkerThread = new Thread(Blinker);
         blinkerThread.Start();
        BrainPad.Wait.Milliseconds(-1);
    }
     
    public void BrainPadLoop() {
        // Declared but not used
    }

    public void Blinker() {
        while (true) {
            BrainPad.LightBulb.TurnGreen();
            BrainPad.Wait.Seconds(0.2);
            BrainPad.LightBulb.TurnOff();
            BrainPad.Wait.Seconds(0.2);
        }
    }
}
```
In code example below, while the red light is blinking in its own thread, the system can now go do other things like incrementing our `count` variable and showing the results on the display. 
```
public class Program {
    int count = 0;

    public void BrainPadSetup() {
        Thread blinkerThread = new Thread(Blinker);
        blinkerThread.Start();

        while (true) {
             BrainPad.LightBulb.TurnRed();
             BrainPad.Wait.Seconds(0.1);
             BrainPad.LightBulb.TurnOff();
             BrainPad.Wait.Seconds(1);
        }
    }

    public void BrainPadLoop() {
         // Declared but not used
    }

    public void Blinker() {
        while (true) {
             count = count + 1;
             BrainPad.Display.DrawTextAndShowOnScreen(40,25," "+ count);
         }
    }
}
```
## Events
If a program needs to turn a light on via a button press, that program will need to check the button's state indefinitely. How often should we check the button? What if the button was pressed and released before the check? If we check too fast the system cannot enter low power mode.

This is important for battery operated devices like circuit boards or mobile phones. If the phone was always fully on, the battery would not last more than a few minutes. The only way a mobile phone can last an entire day on a charged battery is by shutting off unneeded components (like turning the screen off).

The proper way to handle the button is to subscribe to an event that is fired when the button is pressed or released. The BrainPad's `BrainPad.Buttons.WhenUpButtonPressed` event allows us to subscribe using the `+=` symbols. Now every time the `Up` button is pressed the `Buttons_WhenUpButtonPressed()` method is called. In the example below we've created event handlers for all the buttons on the BrainPad. There is a handler to also check when the button is released as shown in the code below. 
```
public class Program {
    public void BrainPadSetup() {

        BrainPad.Buttons.WhenUpButtonPressed += Buttons_WhenUpButtonPressed;
        BrainPad.Buttons.WhenDownButtonPressed += Buttons_WhenDownButtonPressed;
        BrainPad.Buttons.WhenRightButtonPressed += Buttons_WhenRightButtonPressed;
        BrainPad.Buttons.WhenLeftButtonPressed += Buttons_WhenLeftButtonPressed;

        BrainPad.Buttons.WhenUpButtonReleased += Buttons_WhenUpButtonReleased;
        BrainPad.Buttons.WhenDownButtonReleased += Buttons_WhenDownButtonReleased;
        BrainPad.Buttons.WhenRightButtonReleased += Buttons_WhenRightButtonReleased;
        BrainPad.Buttons.WhenLeftButtonReleased += Buttons_WhenLeftButtonReleased;
    }
    private void Buttons_WhenUpButtonPressed() {
        BrainPad.LightBulb.TurnRed();
    }
    private void Buttons_WhenDownButtonPressed() {
        BrainPad.LightBulb.TurnGreen();
    }
    private void Buttons_WhenRightButtonPressed() {
        BrainPad.LightBulb.TurnBlue();
    }
    private void Buttons_WhenLeftButtonPressed() {
        BrainPad.LightBulb.TurnWhite();
    }
    private void Buttons_WhenUpButtonReleased() {
        BrainPad.LightBulb.TurnOff();
    }
    private void Buttons_WhenDownButtonReleased() {
        BrainPad.LightBulb.TurnOff();
    }
    private void Buttons_WhenRightButtonReleased() {
        BrainPad.LightBulb.TurnOff();
    }
    private void Buttons_WhenLeftButtonReleased() {
        BrainPad.LightBulb.TurnOff();
    }

    public void BrainPadLoop() {
            
    }
}
```
When typing, after you enter the += symbols, Visual Studio will instruct you to press TAB to insert a pre-named event handler. After doing so, you'll want to press TAB again to generate the actual handler inside the class.

Activating a light on a button press can be done in a loop but then the system is always running. Using events in this example, the system is mostly sleeping (in low power mode). The first thing it does is subscribe to the button event. The system sleeps until one of the buttons is pressed or released, at which point it wakes up and runs the appropriate Button method. But the code above can be simplified a bit more. Since each ButtonReleased method in our program does the same thing we can share a single event as demonstrated in the code below. 
```
public class Program {
    public void BrainPadSetup() {
        BrainPad.Buttons.WhenUpButtonPressed += Buttons_WhenUpButtonPressed;
        BrainPad.Buttons.WhenDownButtonPressed += Buttons_WhenDownButtonPressed;
        BrainPad.Buttons.WhenRightButtonPressed += Buttons_WhenRightButtonPressed;
        BrainPad.Buttons.WhenLeftButtonPressed += Buttons_WhenLeftButtonPressed;

        BrainPad.Buttons.WhenUpButtonReleased += Buttons_WhenButtonReleased;
        BrainPad.Buttons.WhenDownButtonReleased += Buttons_WhenButtonReleased;
        BrainPad.Buttons.WhenRightButtonReleased += Buttons_WhenButtonReleased;
        BrainPad.Buttons.WhenLeftButtonReleased += Buttons_WhenButtonReleased;
    }
    private void Buttons_WhenUpButtonPressed() {
        BrainPad.LightBulb.TurnRed();
    }
    private void Buttons_WhenDownButtonPressed() {
        BrainPad.LightBulb.TurnGreen();
    }
    private void Buttons_WhenRightButtonPressed() {
        BrainPad.LightBulb.TurnBlue();
    }
    private void Buttons_WhenLeftButtonPressed() {
        BrainPad.LightBulb.TurnWhite();
    }
    private void Buttons_WhenButtonReleased() {
        BrainPad.LightBulb.TurnOff();
    }

    public void BrainPadLoop() {
            
    }
}
```
In the above code, we've accomplish the same thing as before using a few less lines of code. This might not always be the case. But since each button release does the same thing we can simplify our code by sharing the `Buttons_WhenButtonReleased()` method with all our Button Release events. 
