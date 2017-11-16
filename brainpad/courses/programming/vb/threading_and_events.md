# Threading and Events

## Functions
The `BrainPad` object (or class) includes **Functions** to control many aspects of the BrainPad's hardware. A function is a set of instructions grouped together. If a student is asked to speak, the command may look like `Student.Say("Hello")`. The `Say()` function is simple, but speaking requires many things like taking in air and moving your vocal cords. In the same sense, activating the LightBulb and Turning it green is a simple request but internally it does many small tasks to reach the final goal.
Functions can also take arguments. For example, you could have a function called `Student.Run()` to order a student to run or `Student.Run(slow)` to order them to run slow. Functions can also return a value, like `Student.GetAge()` which returns the student's age.

In the code example below, we show how a function we create called `Add` can be used to add 5 + 2 and print the total integer to the Output window. We've also added an additional line to display the result on the BrainPad's own display too. 

```vb
Class Program
    Public Sub BrainPadSetup()
        Dim total As Integer
        
        total = Add(5, 2)

        BrainPad.WriteToComputer(total)

        BrainPad.Display.DrawNumberAndShowOnScreen(1, 1, total)
    End Sub

    Public Sub BrainPadLoop()

    End Sub

    Public Function Add(a As Integer, b As Integer) As Integer
        Return a + b
    End Function
End Class
```

The above example creates a simple function that takes two integer arguments and returns an integer. The function will add the two arguments and return the results. 

In Visual Basic, a function that returns a value is set up as in the example below. The line contains the keyword `Function` and ends the line with the type of variable to be returned. In this case we us `As Integer` to return an integer.

```vb
Public Function Add(a As Integer, b As Integer) As Integer
```

But Functions are not alway required to return values, sometimes they just perform a certian task. In the example below we show how a function is setup that doesn't return a value. 

```vb
Public Sub Add(a As Integer, b As Integer)
```

You'll notice the keyword `Function` is absent, as well as the return type of `As Integer` at the end of the line.
 
Here is an example of how this type of function would actually work. You'll notice in the code below there is also no keyword `Return`
 
```vb
Public Sub Add(a As Integer, b As Integer)
    BrainPad.WriteToComputer(a + b)
End Sub
```

In the previous example we called our `Function` Add, function names are like variable names, only certain things are allowed. Function names cannot start with a number, contain a symbol besides the underscore "_" or have a space in them.
The following examples show proper and improper use of function names.

Valid Function Names

```vb
Public Function AreAll4ButtonsPressed() As Boolean
Public Function Add() As Integer
```

Poorly named Functions

```vb
Public Function areallbuttonspressed() As Boolean
Public Function function34from94handler() As Integer
```

Invalid Function Names

```vb
Public Function Are All Buttons Pressed() As Boolean
Public Function AreAllButtonsPressed?() As Boolean
```

Note: Function names should always be easy to read and meaningful. This allows a programmer to easily discern what it does.

```vb
Public Sub ActivateAlarm()
```

Finally, functions can also be private or public and shared or non-shared. This is beyond the scope of this course and `Public Sub` will always be used, unless returning a value, then we'll use `Public Function` .

## Overloading Functions
The same function name can have one or more argument types. Depending on the argument passed to the function, the system will determine which function to call as shown in in the code sample below we create a function called `Add` which can handle both an integer or a string. 

```vb
Class Program
    Public Sub BrainPadSetup()
        Add(5, 4)

        Add("five", "four")
    End Sub

    Public Sub BrainPadLoop()

    End Sub

    Public Sub Add(a As Integer, b As Integer)
        BrainPad.WriteToComputer(a + b)
    End Sub

    Public Sub Add(a As String, b As String)
        BrainPad.WriteToComputer(a + b)
    End Sub
End Class
```

In the code above, you'll notice in the `BrainPadSetup()` we use the `Add()` function twice, once with an integers`(5, 4)` and then with two strings`("five", "four")`. When the `Add()` function is called the computer determines what the data type is and routes to the appropriate function. As an example, if the function is sent an integer it displays the added total, if we send the function two strings it will print them both combined. This is what is meant by overloading a function. 

## Boolean Variables
In programming we use `True` or `False` to represent the truth values of logic. These values are known as `Boolean` or `bool` when coding. For example, let's say we need to check if the up and down buttons are pressed in multiple spots throughout our program. We could check each button in each spot or we could create a reusable function that returns true if both are pressed or false otherwise, as shown in the code examples below. 

```vb
Class Program
    Public Sub BrainPadSetup()

    End Sub

    Public Sub BrainPadLoop()
        If UpAndDownPressed() Then
            BrainPad.LightBulb.TurnGreen()
        Else
            BrainPad.LightBulb.TurnOff()
        End If
    End Sub

    Public Function UpAndDownPressed() As Boolean
        If BrainPad.Buttons.IsUpPressed() And BrainPad.Buttons.IsDownPressed Then
            Return True
        Else
            Return False
        End If
    End Function
End Class
```

## The "New" Keyword
In the examples used so far, the BrainPad object has been used directly. This will not work for all object types. Remember the `Student.Say("Hello")` example? This statement is not completely valid because we don't know which student is going to say "Hello". To access a specific student, you need to create a variable named `mike` to hold the Student object as shown in the code sample below.

```vb
Dim student As New Student()
```

## Threading
Threading in the programming world is a way to describe multitasking. Each task is a thread that runs separately. The threading support in TinyCLR OS on the BrainPad is easy to work with. 

First, we need to inform the system that the threading library needs to be imported. We do this by adding code to the end of our `Thread` declaration. As shown in the example below.
 
```vb
Dim blinkerThread = New System.Threading.Thread(AddressOf Blinker)
```

Before we add a thread, we need a function for it to use as shown in the code below. 

```vb
Class Program
    Public Sub BrainPadSetup()
        Dim blinkerThread = New System.Threading.Thread(AddressOf Blinker)
        
        blinkerThread.Start()

        While True
            BrainPad.LightBulb.TurnRed()
            BrainPad.Wait.Seconds(0.1)
            BrainPad.LightBulb.TurnOff()
            BrainPad.Wait.Seconds(1)
        End While
    End Sub

    Public Sub BrainPadLoop()

    End Sub

    Public Sub Blinker()
        While True
            BrainPad.LightBulb.TurnGreen()
            BrainPad.Wait.Seconds(0.2)
            BrainPad.LightBulb.TurnOff()
            BrainPad.Wait.Seconds(0.2)
        End While
    End Sub
End Class
```

The previous program will blink the light green Stepping through code, we can easily see how the Blinker function never returns execution to BrainPadSetup(). The program keeps looping infinitely inside the Blinker function. But most programs would probably need to blink the light while doing something else. This is where threads come in very handy.
First, we need to construct a Thread object as shown below. This object has special internal control over the program flow.

```vb
Dim blinkerThread = New System.Threading.Thread(AddressOf Blinker)
```

Note how the names easily identify what they represent. The `blinkerThread()` function is a thread that handles the `Blinker()` function. All we need to do is `Start()` the thread and the `Blinker()` function will be executed. However, there is still an issue. The `BrainPadSetup()` function will reach the end, which will cause the program and all its threads to terminate. A temporary solution is to make the `BrainPadSetup()` function wait indefinitely is by using -1 milliseconds as shown in the code example below. 

```vb
Class Program
    Public Sub BrainPadSetup()
        Dim blinkerThread = New System.Threading.Thread(AddressOf Blinker)

        blinkerThread.Start()

        BrainPad.Wait.Milliseconds(-1)

        While True
            BrainPad.LightBulb.TurnRed()
            BrainPad.Wait.Seconds(0.1)
            BrainPad.LightBulb.TurnOff()
            BrainPad.Wait.Seconds(1)
        End While
    End Sub

    Public Sub BrainPadLoop()

    End Sub

    Public Sub Blinker()
        While True
            BrainPad.LightBulb.TurnGreen()
            BrainPad.Wait.Seconds(0.2)
            BrainPad.LightBulb.TurnOff()
            BrainPad.Wait.Seconds(0.2)
        End While
    End Sub
End Class
```

In code example below, while the red light is blinking in its own thread, the system can now go do other things like incrementing our `count` variable and showing the results on the display. 

```vb
Class Program
    Dim count As Integer = 0

    Public Sub BrainPadSetup()
        Dim blinkerThread = New System.Threading.Thread(AddressOf Blinker)

        blinkerThread.Start()

        BrainPad.Wait.Milliseconds(-1)

        While True
            BrainPad.LightBulb.TurnRed()
            BrainPad.Wait.Seconds(0.1)

            BrainPad.LightBulb.TurnOff()
            BrainPad.Wait.Seconds(1)
        End While
    End Sub

    Public Sub BrainPadLoop()

    End Sub

    Public Sub Blinker()
        While True
            BrainPad.Display.DrawTextAndShowOnScreen(40, 25, " " + count)
        End While
    End Sub
End Class
```

## Events
If a program needs to turn a light on via a button press, that program will need to check the button's state indefinitely. How often should we check the button? What if the button was pressed and released before the check? If we check too fast the system cannot enter low power mode.

This is important for battery operated devices like circuit boards or mobile phones. If the phone was always fully on, the battery would not last more than a few minutes. The only way a mobile phone can last an entire day on a charged battery is by shutting off unneeded components (like turning the screen off).

The proper way to handle the button is to subscribe to an **Event** that is fired when the button is pressed or released.  In the example below we've created event handlers for all the buttons on the BrainPad. There is a handler to also check when the button is released as shown in the code below. 

```vb
Class Program
    Public Sub BrainPadSetup()
        'Button Press Events
        AddHandler BrainPad.Buttons.WhenRightButtonPressed, AddressOf WhenRightButtonPressed
        AddHandler BrainPad.Buttons.WhenLeftButtonPressed, AddressOf WhenLeftButtonPressed
        AddHandler BrainPad.Buttons.WhenUpButtonPressed, AddressOf WhenUpButtonPressed
        AddHandler BrainPad.Buttons.WhenDownButtonPressed, AddressOf WhenDownButtonPressed

        'Button Release Events
        AddHandler BrainPad.Buttons.WhenRightButtonReleased, AddressOf WhenRightButtonReleased
        AddHandler BrainPad.Buttons.WhenLeftButtonReleased, AddressOf WhenLeftButtonReleased
        AddHandler BrainPad.Buttons.WhenUpButtonReleased, AddressOf WhenUpButtonReleased
        AddHandler BrainPad.Buttons.WhenDownButtonReleased, AddressOf WhenDownButtonReleased
    End Sub

    Public Sub WhenRightButtonPressed()
        BrainPad.LightBulb.TurnGreen()
    End Sub

    Public Sub WhenLeftButtonPressed()
        BrainPad.LightBulb.TurnBlue()
    End Sub

    Public Sub WhenUpButtonPressed()
        BrainPad.LightBulb.TurnRed()
    End Sub

    Public Sub WhenDownButtonPressed()
        BrainPad.LightBulb.TurnWhite()
    End Sub

    Public Sub WhenRightButtonReleased()
        BrainPad.LightBulb.TurnOff()
    End Sub

    Public Sub WhenLeftButtonReleased()
        BrainPad.LightBulb.TurnOff()
    End Sub

    Public Sub WhenUpButtonReleased()
        BrainPad.LightBulb.TurnOff()
    End Sub

    Public Sub WhenDownButtonReleased()
        BrainPad.LightBulb.TurnOff()
    End Sub

    Public Sub BrainPadLoop()

    End Sub
End Class
```

In the example above and the consolidated example below we break down the line that adds the Event handler for our `Buttons`. We first used the `AddHandler` keyword. Followed by our `BrainPad.Buttons.WhenRightButtonPressed` event. This tells our program to keep listening to see if the right button is being pressed. The second part of the line followed by the `,` uses the keyword `AddressOf` . This tells the program what function to use when the button is pressed. In the case below it runs the `WhenRightButtonPress()` function and Turns the LightBulb green.   

```vb
Public Sub BrainPadSetup()
    AddHandler BrainPad.Buttons.WhenRightButtonPressed, AddressOf WhenRightButtonPressed
End Sub

Public Sub WhenRightButtonPressed()
    BrainPad.LightBulb.TurnGreen()
End Sub
```

Activating a light on a button press can be done in a loop but then the system is always running. Using events in our examples, the system is mostly sleeping (in low power mode). The first thing it does is subscribe to the button event. The system sleeps until one of the buttons is pressed or released, at which point it wakes up and runs the appropriate Button function. But the code above can be simplified a bit more. Since each ButtonReleased function in our program does the same thing we can share a single event as demonstrated in the code below. 

```vb
Class Program
    Public Sub BrainPadSetup()
        'Button Press Events
        AddHandler BrainPad.Buttons.WhenRightButtonPressed, AddressOf WhenRightButtonPressed
        AddHandler BrainPad.Buttons.WhenLeftButtonPressed, AddressOf WhenLeftButtonPressed
        AddHandler BrainPad.Buttons.WhenUpButtonPressed, AddressOf WhenUpButtonPressed
        AddHandler BrainPad.Buttons.WhenDownButtonPressed, AddressOf WhenDownButtonPressed

        'Button Release Events
        AddHandler BrainPad.Buttons.WhenRightButtonReleased, AddressOf WhenButtonReleased
        AddHandler BrainPad.Buttons.WhenLeftButtonReleased, AddressOf WhenButtonReleased
        AddHandler BrainPad.Buttons.WhenUpButtonReleased, AddressOf WhenUpButtonReleased
        AddHandler BrainPad.Buttons.WhenDownButtonReleased, AddressOf WhenButtonReleased
    End Sub

    Public Sub WhenRightButtonPressed()
        BrainPad.LightBulb.TurnGreen()
    End Sub

    Public Sub WhenLeftButtonPressed()
        BrainPad.LightBulb.TurnBlue()
    End Sub

    Public Sub WhenUpButtonPressed()
        BrainPad.LightBulb.TurnRed()
    End Sub

    Public Sub WhenDownButtonPressed()
        BrainPad.LightBulb.TurnWhite()
    End Sub

    Public Sub WhenButtonReleased()
        BrainPad.LightBulb.TurnOff()
    End Sub

    Public Sub BrainPadLoop()

    End Sub
End Class
```

In the above code, we've accomplish the same thing as before using a few less lines of code. This might not always be the case. But since each button release does the same thing we can simplify our code by sharing the `Buttons_WhenButtonReleased()` function with all our Button Release events and telling the program to turn off the Light Bulb. 

