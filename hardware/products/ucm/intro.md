# UCM Introduction

What is UCM? UCM is a Universal Compute Module based on the 200-pin SO-DIMM, Small Outline Dual In-line Memory Module. To make these modules mostly interchangeable, GHI Electronics has made a standard pin format for these 200-pins.

The standard consists of several widely used peripherals found on many microcontrollers such as UART, SPI, I2C, PWM, etc.

The peripherals found on each module may vary.
# UCM Standard
## UCM Standard - Available Peripherals
| Peripheral											| Up to Max	|
| :----------------------------------------------------	| :--------	|
| UART (Universal Asynchronous Receiver/Transmitter)	| 4			|
| UART HS (Handshaking)									| 2			|
| I2C  (Inter-Integrated Circuit)						| 2			|
| SPI  (Serial Peripheral Interface)					| 2			|
| CAN  (Controller Area Network)						| 2			|
| SDIO (SD Card)										| 1			|
| I2S  (Inter-IC Sound Bus)								| 1			|
| ADC  (Analog Input)									| 8			|
| PWM  (Pulse Width Modulation)							| 8			|
| GPIO (General Purpose Input/Output)					| 12		|
| IRQ  (Interrupt Capable GPIO)							| 4			|
| USB Client											| 1			|
| USB Host												| 1			|
| LCD  (TFT Controller - 16bpp or 24bpp)				| 1			|
| Ethernet PHY											| 1			|
| DCMI (Digital Camera Interface)						| 1			|
| VBAT (Battery Backup for RTC)							| 1			|
| JTAG													| 1			|

## UCM Standard - Pin Assignment
| SO-DIMM Pin	| Universal Compute Standard	|
| :-----------:	| :---------------------------:	|
| 1				| AGND							|
| 2				| Ethernet TX-					|
| 3				| Bootstrap A					|
| 4				| Ethernet TX+					|
| 5				| Analog VREF-					|
| 6				| Ethernet RX-					|
| 7				| Reserved						|
| 8				| Ethernet RX+					|
| 9				| Reserved						|
| 10			| Ethernet LED SPEED			|
| 11			| Ethernet LED LINK				|
| 12			| Reserved						|
| 13			| GND							|
| 14			| DCMI D0						|
| 15			| DCMI D1						|
| 16			| DCMI D2						|
| 17			| DCMI D3						|
| 18			| DCMI D4						|
| 19			| DCMI D5						|
| 20			| Analog 3.3V					|
| 21			| DCMI D6						|
| 22			| DCMI D7						|
| 23			| DCMI VSYNC					|
| 24			| DCMI HSYNC					|
| 25			| DCMI PIXCLK					|
| 26			| DCMI XCLK						|
| 27			| GND							|
| 28			| PWM E							|
| 29			| PWM F							|
| 30			| PWM G							|
| 31			| PWM H							|
| 32			| Analog VREF+					|
| 33			| Reserved						|
| 34			| 5V							|
| 35			| Module Specific 4				|
| 36			| Module Specific 5				|
| 37			| Module Specific 6				|
| 38			| Module Specific 7				|
| 39			| Module Specific 8				|
| 40			| GND							|
| 41			| GND							|
| 42			| LCD 24bpp R0					|
| 43			| LCD 24bpp R1					|
| 44			| LCD 24bpp R2					|
| 45			| LCD 24bpp G0					|
| 46			| 3.3V							|
| 47			| LCD 24bpp G1					|
| 48			| LCD 24bpp B0					|
| 49			| LCD 24bpp B1					|
| 50			| LCD 24bpp B2					|
| 51			| GND							|
| 52			| Module Specific 9				|
| 53			| I2S SCK						|
| 54			| I2S WD						|
| 55			| I2S WS						|
| 56			| 5V							|
| 57			| IRQ A							|
| 58			| IRQ B							|
| 59			| IRQ C							|
| 60			| 3.3V							|
| 61			| IRQ D							|
| 62			| GPIO A						|
| 63			| GPIO B						|
| 64			| GPIO C						|
| 65			| GND							|
| 66			| GPIO D						|
| 67			| GPIO E						|
| 68			| GPIO F						|
| 69			| GPIO G						|
| 70			| 5V							|
| 71			| Reserved						|
| 72			| 3.3V							|
| 73			| I2C B	SDA						|
| 74			| I2C B SCL						|
| 75			| UART C TX						|
| 76			| UART C RX						|
| 77			| UART D TX						|
| 78			| UART D RX						|
| 79			| GND							|
| 80			| Reserved						|
| 81			| Reserved						|
| 82			| Reserved						|
| 83			| Reserved						|
| 84			| Reserved						|
| 85			| Reserved						|
| 86			| 5V							|
| 87			| USB Device ID					|
| 88			| 3.3V							|
| 89			| UART B TX						|
| 90			| UART B RX						|
| 91			| ADC A							|
| 92			| GPIO H						|
| 93			| SPI B MISO					|
| 94			| SPI B MOSI					|
| 95			| GND							|
| 96			| SPI B SCK						|
| 97			| ADC B							|
| 98			| CAN A TD						|
| 99			| CAN A RD						|
| 100			| CAN B TD						|
| 101			| CAN B RD						|
| 102			| UART HS A TX					|
| 103			| UART HS A RX					|
| 104			| ADC C							|
| 105			| PWM A							|
| 106			| 3.3V							|
| 107			| Module Specific 1				|
| 108			| Module Specific 2				|
| 109			| Module Specific 3				|
| 110			| ADC D							|
| 111			| Bootstrap C					|
| 112			| PWM B							|
| 113			| GND							|
| 114			| ADC E							|
| 115			| I2C A SDA						|
| 116			| I2C A SCL						|
| 117			| UART A RX						|
| 118			| UART A TX						|
| 119			| GPIO I						|
| 120			| UART HS A RTS					|
| 121			| UART HS A CTS					|
| 122			| GPIO J						|
| 123			| SD Card D0					|
| 124			| 3.3V							|
| 125			| SD Card CMD					|
| 126			| SD Card CLK					|
| 127			| SD Card D1					|
| 128			| SD Card D2					|
| 129			| SD Card D3					|
| 130			| PWM C							|
| 131			| GND							|
| 132			| GPIO K						|
| 133			| PWM D							|
| 134			| Bootstrap B					|
| 135			| Bootstrap D					|
| 136			| GPIO L						|
| 137			| Module Specific 10			|
| 138			| UART HS B RTS					|
| 139			| UART HS B CTS					|
| 140			| UART HS B TX					|
| 141			| UART HS B RX					|
| 142			| 3.3V							|
| 143			| LCD VSYNC						|
| 144			| LCD HSYNC						|
| 145			| LCD CLK						|
| 146			| LCD DE						|
| 147			| Module Specific 11			|
| 148			| SD Card CD					|
| 149			| Module Specific 12			|
| 150			| Reserved						|
| 151			| GND							|
| 152			| LCD B3						|
| 153			| LCD B4						|
| 154			| LCD B5						|
| 155			| LCD B6						|
| 156			| LCD B7						|
| 157			| ADC F							|
| 158			| ADC G							|
| 159			| ADC H							|
| 160			| 3.3V							|
| 161			| LCD G2						|
| 162			| LCD G3						|
| 163			| LCD G4						|
| 164			| LCD G5						|
| 165			| LCD G6						|
| 166			| Module Specific 13			|
| 167			| Reserved						|
| 168			| LCD R7						|
| 169			| GND							|
| 170			| LCD G7						|
| 171			| LCD R3						|
| 172			| LCD R4						|
| 173			| LCD R5						|
| 174			| LCD R6						|
| 175			| SPI A SCK						|
| 176			| SPI A MISO					|
| 177			| Module Specific 14			|
| 178			| SPI A MOSI					|
| 179			| Module Specific 15			|
| 180			| 3.3V							|
| 181			| Module Specific 16			|
| 182			| Module Specific 17			|
| 183			| VBAT							|
| 184			| Module Specific 18			|
| 185			| GND							|
| 186			| GND							|
| 187			| RESET							|
| 188			| USB Host D+					|
| 189			| JTAG RTCK						|
| 190			| USB Host D-					|
| 191			| JTAG TDO						|
| 192			| 3.3V							|
| 193			| JTAG NTRST					|
| 194			| USB Device D+					|
| 195			| JTAG TDI						|
| 196			| USB Device D-					|
| 197			| JTAG TCK (SWCLK)				|
| 198			| GND							|
| 199			| JTAG TMS (SWDIO)				|
| 200			| Reserved						|

## UCM Standard - Module Dimesions
### Module Size A
![UCM Dev board](images/g400dev.jpg)

The standard module size (67.75mm x 31.75mm).

### Module Size B
![UCM Breakout](images/g400th.jpg)

For larger additional components (67.75mm x 47.625mm).

### Module Size C
![UCM Breakout](images/g400th.jpg)

For larger additional components (67.75mm x 63.5mm).
