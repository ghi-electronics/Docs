# Graphics
---
TinyCLR OS support includes two level of graphics support, the core elements and User Interface.

## Core Elements
The `GHIElectronics.TinyCLR.Drawing` NuGet package includes the backbone for all graphics needs. It includes support for shapes, fonts and bitmaps.

Shape examples are `Graphics.FillEllipse`, `Graphics.DrawLine` and `Graphics.DrawRectangle`. These methods need `Pen` and `Brush` that are also part of `Graphics`.

For images, TinyCLR OS supports BMP, GIF, and JPG. Depending on your hardware's limitation, one or more of these image formats maybe supported. Images can be loaded from a `stream` but the simplest option is to load from a resource. BMP supports 256 colors and 24bit. GIF does not support animated images.

Fonts are well supported. They are covered later on this page.

It is important to note that drawing functions process graphics in RAM independently from any display. The display driver then transfers the pixels from the internal memory to the display, through `Graphics.Flush`. Learn more about the [display](display.md) support.
