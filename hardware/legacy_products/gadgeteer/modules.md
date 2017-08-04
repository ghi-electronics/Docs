# .NET Gadgeteer Modules
This page lists all .NET Gadgeteer modules and how can they be used with [TinyCLR OS](../../../tinyclr/intro.md). If you are planning on using the old NETMF/Gadgeteer software then read the [.NET Gadgeteer Intro](intro.md) page.

> [!Tip]
> We discourage writing specific drivers that can't be used outside gadgeteer. It should be easy to transition from a gadgeteer to a non-gadgeteer design.
> If a module is simple, then no driver at all is provided!

> [!Tip]
> You can use Intellisense with the pin definition class to quickly determine where things go.
> For example: Typing `FEZSpider.GpioPin.Socket3.` lists the available GPIO pins on socket3
> Another example: Typing `FEZSpider.UartPort.` lists all available UART sockets (that is U in the old Gadgeteer standard)

> [!Tip]
> We will be using the original, and most popular, FEZ Spider as a base for this page but any other mainboard will work very similarly.


# Accel G248
![Accel G248](images/modules/accel_g248.jpg)

The Accel G248 measures acceleration though I2C bus.

Coming Soon! https://github.com/ghi-electronics/NETMF-Gadgeteer/blob/master/Modules/GHIElectronics/AccelG248/AccelG248_43/AccelG248_43.cs

# Barometer
![Barometer](images/modules/barometer.jpg)

https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/Barometer

# Bluetooth
![Bluetooth](images/modules/bluetooth.jpg)

https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/Bluetooth
# Breadboard X1
![Breadboard X1](images/modules/breadboard_x1.jpg)

An easy breadboard option. Simply access the socket directly to wire whatever your heart desires!

# Breakout
![Breakout](images/modules/breakout.jpg)
Simply a breakout of all signals.

# Breakout TB10
![Breakout TB10](images/modules/breakout_tb10.jpg)

Simply a breakout of all signals, on a terminal block.

# Button
![Button](images/modules/button.jpg)

The Button module is very simple, with a button connected to pin 3 and an LED connected to pin4.

This example will blink the LED a different rate, depending on the button press.
```
using System.Threading;
using GHIElectronics.TinyCLR.Devices.Gpio;
using GHIElectronics.TinyCLR.Pins;

class Program {
    static void Main() { 
        var LED = GpioController.GetDefault().OpenPin(FEZSpiderII.GpioPin.Socket1.Pin3);
        LED.SetDriveMode(GpioPinDriveMode.Output);

        var Button = GpioController.GetDefault().OpenPin(FEZSpiderII.GpioPin.Socket4.Pin4);
        Button.SetDriveMode(GpioPinDriveMode.InputPullUp);
        var speed = 200;
        while (true) {
            if (Button.Read() == GpioPinValue.High)
                speed = 200;// high = button is not pressed
            else
                speed = 500;// low = button is pressed

            // blink the LED
            LED.Write(GpioPinValue.High);
            Thread.Sleep(speed);
            LED.Write(GpioPinValue.Low);
            Thread.Sleep(speed);
        }
    }
}
```
# Button S7
![Button S7](images/modules/button_s7.jpg)

7 buttons on a single module, with LEDs that light up with button presses! 

Use the same code example provided for the Button Module.

Buttons map:
* Left: Pin  
* Right: Pin 8
* Up: Pin 6
* Down: Pin 7
* Enter: Pin 3
* Back: Pin 4
* Forward: Pin 9

# CAN DW
![Button S7](images/modules/can_dw.jpg)

CAN is not yet supported in TinyCLR OS, you can add it if you are up for a challenge!

# Camera
![Camera](images/modules/camera.jpg)

USB Host is not supported in TinyCLR OS

# Cellular Radio
![Cellular Radio](images/modules/cellular_radio.jpg)

Coming soon!
https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/CellularRadio

# Character Display
![Character Display](images/modules/character_display.jpg)

This is a standard and very common HD44780 display.

Coming soon! https://github.com/ghi-electronics/NETMF-Gadgeteer/blob/master/Modules/GHIElectronics/CharacterDisplay/CharacterDisplay_43/CharacterDisplay_43.cs

# ColorSense
![ColorSense](images/modules/color_sense.jpg)

A color sensor that uses software I2C, not yet supported in TinyCLR OS.

Coming soon!
https://github.com/ghi-electronics/NETMF-Gadgeteer/blob/master/Modules/GHIElectronics/ColorSense/ColorSense_43/ColorSense_43.cs

# Compass
![Compass](images/modules/compass.jpg)

Coming soon!
https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/Compass

# Current ACS712
![Current ACS712](images/modules/current_acs712.jpg)

This is a current sensor that uses ACS712, which simply outputs an analog voltage.
add example that shows the conversion math https://github.com/ghi-electronics/NETMF-Gadgeteer/blob/master/Modules/GHIElectronics/CurrentACS712/CurrentACS712_43/CurrentACS712_43.cs

# Display CP7
![Display CP7](images/modules/display_cp7.jpg)

Read more about the [display support](../../../tinyclr/tutorials/display.md) on TinyCLR OS.
The configurations for the display:
```
// these are the wrong values!
Width = 480,
Height = 272,
PixelClockRate = 20000000,
PixelPolarity = false,
OutputEnablePolarity = true,
OutputEnableIsFixed = false,
HorizontalFrontPorch = 2,
HorizontalBackPorch = 2,
HorizontalSyncPulseWidth = 41,
HorizontalSyncPolarity = false,
VerticalFrontPorch = 2,
VerticalBackPorch = 2,
VerticalSyncPulseWidth = 10,
VerticalSyncPolarity = false,
```

# Display N18
![Display N18](images/modules/display_n18.jpg)

This is an SPI display that can work on any system, even small ones without TFT display support.
Coming soon! Use the old BrainPad driver.


# Display N7
![Display N7](images/modules/display_n7.jpg)

Read more about the [display support](../../../tinyclr/tutorials/display.md) on TinyCLR OS.
The configurations for the display:
```
// these are the wrong values!
Width = 480,
Height = 272,
PixelClockRate = 20000000,
PixelPolarity = false,
OutputEnablePolarity = true,
OutputEnableIsFixed = false,
HorizontalFrontPorch = 2,
HorizontalBackPorch = 2,
HorizontalSyncPulseWidth = 41,
HorizontalSyncPolarity = false,
VerticalFrontPorch = 2,
VerticalBackPorch = 2,
VerticalSyncPulseWidth = 10,
VerticalSyncPolarity = false,
```


# Display NHVN
![Display NHVN](images/modules/display_nhvn.jpg)

This allows the use of several displays offered by http://newhavendisplay.com/

Supported displays:
* 1
* 2
* 3


# Display T35
![Display T35](images/modules/display_t35.jpg)

Read more about the [display support](../../../tinyclr/tutorials/display.md) on TinyCLR OS.
The configurations for the display:
```
// these are the wrong values!
Width = 480,
Height = 272,
PixelClockRate = 20000000,
PixelPolarity = false,
OutputEnablePolarity = true,
OutputEnableIsFixed = false,
HorizontalFrontPorch = 2,
HorizontalBackPorch = 2,
HorizontalSyncPulseWidth = 41,
HorizontalSyncPolarity = false,
VerticalFrontPorch = 2,
VerticalBackPorch = 2,
VerticalSyncPulseWidth = 10,
VerticalSyncPolarity = false,
```

# Display T43
![Display T43](images/modules/display_t43.jpg)

Read more about the [display support](../../../tinyclr/tutorials/display.md) on TinyCLR OS.
The configurations for the display:
```
// these are the wrong values!
Width = 480,
Height = 272,
PixelClockRate = 20000000,
PixelPolarity = false,
OutputEnablePolarity = true,
OutputEnableIsFixed = false,
HorizontalFrontPorch = 2,
HorizontalBackPorch = 2,
HorizontalSyncPulseWidth = 41,
HorizontalSyncPolarity = false,
VerticalFrontPorch = 2,
VerticalBackPorch = 2,
VerticalSyncPulseWidth = 10,
VerticalSyncPolarity = false,
```

# Display TE35
![Display TE35](images/modules/display_te35.jpg)

Read more about the [display support](../../../tinyclr/tutorials/display.md) on TinyCLR OS.
The configurations for the display:
```
// these are the wrong values!
Width = 480,
Height = 272,
PixelClockRate = 20000000,
PixelPolarity = false,
OutputEnablePolarity = true,
OutputEnableIsFixed = false,
HorizontalFrontPorch = 2,
HorizontalBackPorch = 2,
HorizontalSyncPulseWidth = 41,
HorizontalSyncPolarity = false,
VerticalFrontPorch = 2,
VerticalBackPorch = 2,
VerticalSyncPulseWidth = 10,
VerticalSyncPolarity = false,
```

# Distance US3
![Distance US3](images/modules/distance_us3.jpg)

A very common ultrasonic sensor that works by sending a pulse on the trig and measuring the response time on echo pin.

```
I have the code in the robot example
```


# Ethernet ENC28
![Ethernet ENC28](images/modules/ethernet_enc28.jpg)

Requires an internal support in the TinyCLR OS port.

# Ethernet J11D
![Ethernet J11D](images/modules/ethernet_j11d.jpg)

Requires an internal support in the TinyCLR OS port.

# Extender
![Extender](images/modules/extender.jpg)

No drivers are needed.

# FEZtive
![FEZtive](images/modules/feztive.jpg)

https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/FEZtive

# Flash
![Flash](images/modules/flash.jpg)

Coming soon!
https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/FLASH

# GPS
![GPS](images/modules/gps.jpg)

Coming soon!
https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/GPS

# GasSense
![GasSense](images/modules/gas_sense.jpg)

This module can host several different air sensors, like Alcohol and CO2.

The sensor has an internal heater that needs to be enabled and then it is a simple analog read.

```
using System.Threading;
using System.Diagnostics;
using GHIElectronics.TinyCLR.Devices.Adc;
using GHIElectronics.TinyCLR.Devices.Gpio;
using GHIElectronics.TinyCLR.Pins;

class Program {
    static void Main() {
        var Enable = GpioController.GetDefault().OpenPin(FEZSpiderII.GpioPin.Socket10.Pin4);
        Enable.SetDriveMode(GpioPinDriveMode.Output);
        Enable.Write(GpioPinValue.High);// Enable the internal heater

        var Ain = AdcController.GetDefault().OpenChannel(FEZSpiderII.AdcChannel.Socket10.Pin3);
        while (true) {
            Debug.WriteLine("Ain: " + Ain.ReadRatio());
            Thread.Sleep(500);
        }
    }
}
```

# Gyro
![Gyro](images/modules/gyro.jpg)

Coming soon! 
https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/Gyro

# HD44780
![HD44780](images/modules/hd44780.jpg)

See the Character Display Module

# HubAP5
![HubAP5](images/modules/hub_ap5.jpg)

No hub support is currently planned.

# IO60P16
![IO60P16](images/modules/io60p16.jpg)

This module provide 60 IOs and 16 PWM pins.
Will not be ported but you can port the [original driver](https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/IO60P16).

# IR Receiver
![IR Receiver](images/modules/ir_reciever.jpg)

Coming soon!
https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/IRReceiver


# Joystick
![Joystick](images/modules/joystick.jpg)

The Joystick module has two analog inputs for X and Y position. Pressing the knob also works like a button.

```
using System.Threading;
using System.Diagnostics;
using GHIElectronics.TinyCLR.Devices.Adc;
using GHIElectronics.TinyCLR.Devices.Gpio;
using GHIElectronics.TinyCLR.Pins;

class Program {
    static void Main() {
        var AinX = AdcController.GetDefault().OpenChannel(FEZSpiderII.AdcChannel.Socket10.Pin4);
        var AinY = AdcController.GetDefault().OpenChannel(FEZSpiderII.AdcChannel.Socket10.Pin5);
        var Button = GpioController.GetDefault().OpenPin(FEZSpiderII.GpioPin.Socket10.Pin3);
        Button.SetDriveMode(GpioPinDriveMode.InputPullUp);

        while (true) {
            Debug.WriteLine("PosX: " + AinX.ReadRatio() + "%"+ "PosY: " + AinY.ReadRatio() + "%");
            if (Button.Read() == GpioPinValue.Low)
                Debug.WriteLine("Pressed!");
            Thread.Sleep(500);
        }
    }
}
```

# Keypad KP16
![Keypad KP16](images/modules/keypad_kp16.jpg)

A numerical Keypad
https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/KeypadKP16

# LED 7C
![LED 7C](images/modules/led_7c.jpg)

An LED that can be set to one of 7 colors, 8 if you count off!

```
using System.Threading;
using System.Diagnostics;
using GHIElectronics.TinyCLR.Devices.Adc;
using GHIElectronics.TinyCLR.Devices.Gpio;
using GHIElectronics.TinyCLR.Pins;

class Program {
    static void Main() {
        var GPIO = GpioController.GetDefault();
        var Red = GPIO.OpenPin(FEZSpiderII.GpioPin.Socket8.Pin4);
        Red.SetDriveMode(GpioPinDriveMode.Output);
        var Green = GPIO.OpenPin(FEZSpiderII.GpioPin.Socket8.Pin4);
        Green.SetDriveMode(GpioPinDriveMode.Output);
        var Blue = GPIO.OpenPin(FEZSpiderII.GpioPin.Socket8.Pin4);
        Blue.SetDriveMode(GpioPinDriveMode.Output);

        while (true) {
            // Off
            Red.Write(GpioPinValue.Low); Green.Write(GpioPinValue.Low); Blue.Write(GpioPinValue.Low);
            Thread.Sleep(500);
            // Red
            Red.Write(GpioPinValue.High); Green.Write(GpioPinValue.Low); Blue.Write(GpioPinValue.Low);
            Thread.Sleep(500);
            // Green
            Red.Write(GpioPinValue.Low); Green.Write(GpioPinValue.High); Blue.Write(GpioPinValue.Low);
            Thread.Sleep(500);
            // Blue
            Red.Write(GpioPinValue.Low); Green.Write(GpioPinValue.Low); Blue.Write(GpioPinValue.High);
            Thread.Sleep(500);
            // White
            Red.Write(GpioPinValue.High); Green.Write(GpioPinValue.High); Blue.Write(GpioPinValue.High);
            Thread.Sleep(500);
            // Yellow
            Red.Write(GpioPinValue.High); Green.Write(GpioPinValue.High); Blue.Write(GpioPinValue.Low);
            Thread.Sleep(500);
            // Magenta
            Red.Write(GpioPinValue.High); Green.Write(GpioPinValue.Low); Blue.Write(GpioPinValue.High);
            Thread.Sleep(500);
            // Cyan
            Red.Write(GpioPinValue.Low); Green.Write(GpioPinValue.High); Blue.Write(GpioPinValue.High);
            Thread.Sleep(500);
        }
    }
}
```
# LED 7R
![LED 7R](images/modules/led_7r.jpg)

This is a ring of 6 LEDs and a 7th center LED.
Reference the LED 7C module for using pins.

Center LED: pin ??
LEDs in CW starting from the top: 1,2,3,4???

# LED Strip
![LED Strip](images/modules/led_strip.jpg)

A strip of 7 LEDs, connected to pins 3 through 9.

# Light Sense
![Light Sense](images/modules/light_sense.jpg)

Simply using analog on pin 3. Use the same code as the potentiometer.

# Load
![Load](images/modules/load.jpg)

Each one of the 7 GPIO pins are connected to a transistor to handle a load, like a motor.

# MaxO
![MaxO](images/modules/maxo.jpg)

Shift registers used to take serial SPI data and put on parallel pins, perfect for driving tons of LEDs.

Coming soon!
https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/MaxO

# MicroSD Card
![MicroSD Card](images/modules/microsd.jpg)

No file system support yet.

# Moisture
![Moisture](images/modules/moisture.jpg)

This is a simple analog input measuring the direct resistance (moisture). An enable pin needs to be activated.

```
using System.Threading;
using System.Diagnostics;
using GHIElectronics.TinyCLR.Devices.Adc;
using GHIElectronics.TinyCLR.Devices.Gpio;
using GHIElectronics.TinyCLR.Pins;

class Program {
    static void Main() {
        var Enable = GpioController.GetDefault().OpenPin(FEZSpiderII.GpioPin.Socket10.Pin6);
        Enable.SetDriveMode(GpioPinDriveMode.Output);
        Enable.Write(GpioPinValue.High);// Enable

        var Ain = AdcController.GetDefault().OpenChannel(FEZSpiderII.AdcChannel.Socket10.Pin3);
        while (true) {
            Debug.WriteLine("Ain: " + Ain.ReadRatio());
            Thread.Sleep(500);
        }
    }
}
```

# Motor Driver
![Motor Driver](images/modules/motordriver.jpg)

The Motor Driver Module uses L298 H-bridge that can drive two motors up to 4A.

* Pin 6: Motor A Direction (GPIO)
* Pin 7: Motor A Speed (PWM)
* Pin 8: Motor B Direction (GPIO)
* Pin 9: Motor B Speed (PWM)

> [!Tip]
> NETMF didn't handle PWM correctly. TinyCLR OS breaks PWM pins to individual channels. Read more about [PWM](../../../tinyclr/tutorials/pwm.md).

This example will setup both motors and then will make motor A go very slow forward then very fast backward, in a loop.

```
using System.Threading;
using GHIElectronics.TinyCLR.Devices.Pwm;
using GHIElectronics.TinyCLR.Devices.Gpio;
using GHIElectronics.TinyCLR.Pins;

class Program {
    static void Main() {
        // Determine what PWM controller is used for specific pins, use the power of intellisense!
        // start typing FEZSpider.PwmPin. to navigate the options
        // >>>>>>>>>>>> Will this work if we have different controller?

        // Motor A
        var MotorDirA = GpioController.GetDefault().OpenPin(FEZSpiderII.GpioPin.Socket8.Pin6);
        MotorDirA.SetDriveMode(GpioPinDriveMode.Output);
        var ControllerA = PwmController.FromId(FEZSpiderII.PwmPin.Controller1.Id);
        ControllerA.SetDesiredFrequency(5000);
        var MotorSpeedA = ControllerA.OpenPin(FEZSpiderII.PwmPin.Controller1.Socket8.Pin7);

        // Motor B
        var MotorDirB = GpioController.GetDefault().OpenPin(FEZSpiderII.GpioPin.Socket8.Pin8);
        MotorDirB.SetDriveMode(GpioPinDriveMode.Output);
        var ControllerB = PwmController.FromId(FEZSpiderII.PwmPin.Controller1.Id);
        ControllerB.SetDesiredFrequency(5000);
        var MotorSpeedB = ControllerB.OpenPin(FEZSpiderII.PwmPin.Controller1.Socket8.Pin9);

        while (true) {
            MotorDirA.Write(GpioPinValue.High);// Forward
            MotorSpeedA.SetActiveDutyCyclePercentage(0.1);// slow 10%
            Thread.Sleep(500);

            MotorDirA.Write(GpioPinValue.Low);// Backwards
            MotorSpeedA.SetActiveDutyCyclePercentage(0.9);// fast 90%
            Thread.Sleep(500);
        }
    }
}
```
# Multicolor LED
![Multicolor LED](images/modules/multicolor_led.jpg)


This module used DaisyLink bus to chain some expensive LED! We will not support the DaisyLink bus.

 # Music
![Music](images/modules/music.jpg)

The Music Module uses the popular VS1053 decoder chip that decodes MP3, WMA, OGG, MIDI and WAV files.
Original code is found at [here](https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/Music) and needs a volunteer to update.

# Null Modem
![Null Modem](images/modules/null_modem.jpg)

No driver is needed.

# OBD II
![OBD II](images/modules/obd_ii.jpg)

https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/OBDII

# OneWire X1
![OneWire X1](images/modules/onewire_x1.jpg)

A breakout with a terminal block for easily connecting one wire devices, specifically the common temperature probes.
one wire is not supported yet.
https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/OneWireX1

# PIR
![PIR](images/modules/pir.jpg)

Motion detection. Simply pin 3 changes irs state when it detects motion.

# Parallel CNC
![Parallel CNC](images/modules/parallel_cnc.jpg)

Will not be supported.

# Potentiometer
![Potentiometer](images/modules/potentiometer.jpg)

The Potentiometer module is simply a variable resistor connected to pin3. Rotating its knob will result in an analog value changing from min to max.

```
using System.Threading;
using System.Diagnostics;
using GHIElectronics.TinyCLR.Devices.Adc;
using GHIElectronics.TinyCLR.Pins;

class Program {
    static void Main() {
        var Ain = AdcController.GetDefault().OpenChannel(FEZSpiderII.AdcChannel.Socket10.Pin3);

        while (true) {
            Debug.WriteLine("Pos: " + Ain.ReadRatio() + "%");
            Thread.Sleep(500);
        }
    }
}
```
# Pulse Count
![Pulse Count](images/modules/pulse_count.jpg)

https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/PulseCount

# Pulse InOut
![Pulse InOut](images/modules/pulse_inout.jpg)

https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/PulseInOut

# Pulse Oximeter
![Pulse Oximeter](images/modules/pulse_oximeter.jpg)

https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/PulseOximeter

# RFID Reader
![RFID Reader](images/modules/rfid_reader.jpg)

https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/RFIDReader

# RS232
![RS232](images/modules/rs232.jpg)

Simply a serial port.

# RS485 
![RS485](images/modules/rs485.jpg)

Simply a serial port.

# Radio FM1
![Radio FM1](images/modules/radio_fm1.jpg)

I have the code on click

# Reflector R3
![Reflector R3](images/modules/reflector_r3.jpg)

https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/ReflectorR3

# Relay ISOx16
![Relay ISOx16](images/modules/relay_isox16.jpg)

An array of 16 relays.
https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/RelayISOx16

# Relay X1
![Relay X1](images/modules/relay_x1.jpg)

Simply use set pin 3 high to activate the relay.

# Rotary H1
![Rotary H1](images/modules/rotary_h1.jpg)

https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/RotaryH1

# SD Card
![SD Card](images/modules/sd_card.jpg)

File system is not supported yet.

# S-Plus
![S-Plus](images/modules/s_plus.jpg)

We will not support hubs and socket indirection.

# Serial Camera
![Serial Camera](images/modules/serial_camera.jpg)

Aren't they both the same?
https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/SerialCameraL1
https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/SerialCameraL2

# Stepper L6470
![Stepper L6470](images/modules/stepper_l6470.jpg)

https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/StepperL6470

# TempHumidity
![TempHumidity](images/modules/temp_humidity.jpg)

https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/TempHumidity

# Thermocouple
![Thermocouple](images/modules/thermocouple.jpg)

https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/Thermocouple

# Touch C8
![Touch C8](images/modules/touch_c8.jpg)

https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/TouchC8

# Touch L12
![Touch L12](images/modules/touch_l12.jpg)

https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/TouchL12

# Tunes
![Tunes](images/modules/tunes.jpg)

The Tunes Module is a tiny speaker that is connected to pin 9. Use PWM to generate sounds

This example will keep changing the frequency.

```
using System.Threading;
using GHIElectronics.TinyCLR.Devices.Pwm;
using GHIElectronics.TinyCLR.Pins;

class Program {
    static void Main() {
        var controller = PwmController.FromId(FEZSpiderII.PwmPin.Controller0.Id);
        var buzz = controller.OpenPin(FEZSpiderII.PwmPin.Controller0.Socket11.Pin9);

        controller.SetDesiredFrequency(500);// change the frequency for sounds
        buzz.SetActiveDutyCyclePercentage(0.5);// always use this for sounds
        buzz.Start();

        while (true) {
            controller.SetDesiredFrequency(500);
            Thread.Sleep(500);
            controller.SetDesiredFrequency(200);
            Thread.Sleep(500);
        }
    }
}
```
# UC Battery 4xAA
![UC Battery 4xAA](images/modules/uc_battery_4xaa.jpg)

No driver is needed.

# USB Client DP
![USB Client DP](images/modules/usb_client.jpg)

No driver is needed.

# USB Client SP
![USB Client SP](images/modules/usb_client_sp.jpg)

No driver is needed.

# USB Host
![USB Host](images/modules/usb_host.jpg)

USB Host is not currently supported.

# USB Serial
![USB Serial](images/modules/usb_serial.jpg)

Simply, a serial port.

# USB Serial SP
![USB Serial SP](images/modules/usb_serial_sp.jpg)

Simply, a serial port.

# VideoOut
![VideoOut](images/modules/video_out.jpg)

https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/VideoOut

# WiFi RN171
![WiFi RN171](images/modules/wifi_rn171.jpg)

https://github.com/ghi-electronics/NETMF-Gadgeteer/tree/master/Modules/GHIElectronics/WiFiRN171

# WiFi RS21
![WiFi RS21](images/modules/wifi_rs21.jpg)

Will not be supported, NDA issues.

# XBee Adapter
![XBee Adapter](images/modules/xbee_adapter.jpg)

Simply, a serial port. From there a driver like https://xbee.codeplex.com/

