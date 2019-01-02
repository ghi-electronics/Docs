# SPWF04Sx Wi-Fi Module
---
First introduced over twenty years ago, Wi-Fi has become the most popular wireless networking technology. Originally used to network desktop computers, Wi-Fi is being incorporated into an ever increasing number of electronic devices and is a driving force behind the Internet of things revolution.

Wi-Fi is a high bandwidth, low power, short range networking technology. Operating in the UHF and microwave spectrums, Wi-Fi radio waves propogate mainly by line of sight. The signal is blocked by hills, but can penetrate foliage and buildings well enough to be used effectively indoors and out.

## SPWF04Sx Methods

### ClearTlsServerRootCertificate()

`ClearTlsServerRootCertificate()`. Erases the currently loaded root certificates from the Wi-Fi module's flash memory. Takes no arguments and has no return value.

### CloseSocket()

`CloseSocket(int id)`. Closes the socket specified by the id parameter. The socket id is assigned by the `OpenSocket()` method when the socket is created. Has no return value.

### DisableRadio()

`DisableRadio()`. Disables the Wi-Fi radio. Takes no arguments and has no return value.

### Dispose()

`Dispose()`. Disposes of the Wi-Fi instance. Takes no arguments and has no return value.

### EnableRadio()

`EnableRadio()`. Enables the Wi-Fi radio. Takes no arguments and has no return value.

### GetConnectionSettings()

`GetConnectionSettings(SpiChipSelectType chipSelectType, int chipSelectLine)`. Returns the SPI connection settings used to open an SPI port for communication with the Wi-Fi module. The first parameter taken by this function specifies the type of chip select used -- only `SpiChipSelectType.Gpio` is supported at this time. The second parameter specifies the GPIO pin that controls the Wi-Fi module's chip select pin.

### JoinNetwork()

`JoinNetwork(string ssid, string password)`. Attempts to join the Wi-Fi network specified by the ssid and password values. Has no return value.

### ListSocket()

`ListSocket()`. Returns a string that lists all open socket clients in the format `AT-S.List::<id>:<connected>:<kind>:<len>:<IP>:<port>`. Takes no arguments.

### OpenSocket()

`OpenSocket(string host, int port, SPWF04SxConnectionType connectionType, SPWF04SxConnectionSecurityType connectionSecurity, string commonName)`. Opens a socket client. Arguments are a string host name, an integer port number, an SPWF04SxConnectionType connection type, and a connection security type of `none` or `Tls`. Returns an integer ID number for the socket.

### QuerySocket()

`QuerySocket(int socket)`. Queries a socket client for pending data. Returns an integer number of bytes that are waiting on the socket. Takes the socket id as its only argument. The socket id is returned by the `OpenSocket()` method when the socket is created.

### ReadHttpResponse()

`ReadHttpResponse(byte[] buffer, int offset, int count)`. Reads the response to the currently active HTTP command. Arguments are a byte array buffer to store the incoming data, an integer offset into the array, and an integer count of the size in bytes of available buffer. Returns an integer value of the number of bytes read.

### ReadSocket()

`ReadSocket(int socket, byte[] buffer, int offset, int count)`. Reads data from a socket client. Arguments are an integer socket ID, an input buffer byte array, an integer offset into the array, and an integer count of how many bytes can be read into the buffer array. The socket id is returned by the `OpenSocket()` method when the socket is created. Returns an integer number of bytes received.

### ResetConfiguration()

`ResetConfiguration()`. Restores the factory configuration variables to the flash of the Wi-Fi module. It is necessary to perform a hardware or software reset of the Wi-Fi module after a factory restore. Takes no arguments and has no return value.

### SendHttpGet()

`SendHttpGet(string host, string path, int port, SPWF04SxConnectionSecurityType connectionSecurity)`. Sends a single http get request to the given host and path to retrieve information from a server. Arguments are a string host name, a string host path, an integer port number, and a connection security type of `none` or `Tls`. Returns an integer HTTP server status code.

### SendHttpPost()

`SendHttpPost(string host, string path, int port, SPWF04SxConnectionSecurityType connectionSecurity)`. Sends an HTTP post request to a remote host. Arguments are a string host name, a string host path, an integer port number, and a connection security type of `none` or `Tls`. Returns an integer HTTP server status code.

### SetTlsServerRootCertificate()

`SetTlsServerRootCertificate(byte[] certificate)`. Loads a TLS certificate into the flash memory of the Wi-Fi module. Accepts a byte array containing the certificate as its only argument. Returns a string containing the Subject Key Identifier (SKI) of the certificate. The certificate must be loaded into your application as part of a resources file, be DER encoded, and have the extension .cer.

You can use your web browser to obtain a website's root certificate. In Chrome, click on the lock icon to the left of the web address. Then click on `Certificate` and select the `Details` tab. In `Details` click on the `Copy to File...` button. The `Certificate Export Wizard` will appear. Export the certificate as `DER encoded binary X.509 (.CER)`.

In Micorosoft Edge click on the lock icon to the left of the web address and then select `View certificate.` Click on the `Export to file` button and save the file with a .cer extension.

### SPWF04SxInterface()

`SPWF04SxInterface(SpiDevice spi, GpioPin irq, GpioPin reset)`. Used to create a new instance of the Wi-Fi driver. Takes the SPI device and the IRQ and RESET GPIO pins as arguments. Has no return value.

### TurnOff()

`TurnOff()`. Turns off the Wi-Fi module. Takes no arguments and has no return value.

### TurnOn()

`TurnOn()`. Turns on the Wi-Fi module. Takes no arguments and has no return value.

### WriteSocket()

`WriteSocket(int socket, byte[] data)`. Writes data to a socket client. Arguments are an integer ID number for the socket and a byte array of data. The socket id is returned by the `OpenSocket()` method when the socket is created.

`WriteSocket(int socket, byte[] data, int offset, int count)`. Same as above but also takes integer arguments for the offset into the data array and a count for the number bytes to send.

## SPWF04Sx Events

### IndicationReceived

Fires an event when a Wi-Fi indication (WIND) message is received.

### ErrorReceived

Fires an event when a Wi-Fi error message is received.

## SPWF04Sx Properties

### ForceSocketsTls

Boolean property that can be used to ensure a socket is opened as a secure TLS socket. For example, executing `wifi.ForceSocketsTls = true;` before `OpenSocket()` will cause the socket to be opened as a TLS Socket.

### ForceSocketsTlsCommonName

String property used to specify the common name as found in the websites certificate. The common name is listed in the `Subject Alternative Name` field of the certificate.

### State

Read only property of type `SPWF04SxWiFiState` that reflects the current state of the Wi-Fi module. For example:

`if (wifi.State == SPWF04SxWiFiState.HardwareFailure) Debug.WriteLine("Hardware Failure");`

The possible states are: `HardwarePowerUp`, `HardwareFailure`, `RadioTerminatedByUser`, `RadioIdle`, `ScanInProgress`, `ScanComplete`, `JoinInProgress`, `Joined`, `AccessPointStarted`, `HandshakeComplete`, and `ReadyToTransmit`.

## Sample Code

The following sample code will work on the FEZ and the UC5550 if they have Wi-Fi. Just comment out the code for the board you are not using (works as is on the FEZ).

```csharp
using GHIElectronics.TinyCLR.Devices.Gpio;
using GHIElectronics.TinyCLR.Devices.Spi;
using GHIElectronics.TinyCLR.Drivers.STMicroelectronics.SPWF04Sx;
using GHIElectronics.TinyCLR.Pins;
using System;
using System.Diagnostics;
using System.Net;
using System.Net.NetworkInterface;
using System.Net.Sockets;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading;

namespace WiFi {
    public static class Program {
        private static GpioPin led1;
        private static GpioPin btn1;
        private static SPWF04SxInterface wifi;

        public static void Main() {
            var cont = GpioController.GetDefault();

            //FEZ
            var reset = cont.OpenPin(FEZ.GpioPin.WiFiReset);
            var irq = cont.OpenPin(FEZ.GpioPin.WiFiInterrupt);
            var scont = SpiController.FromName(FEZ.SpiBus.WiFi);
            var spi = scont.GetDevice(SPWF04SxInterface.GetConnectionSettings(SpiChipSelectType.Gpio, FEZ.GpioPin.WiFiChipSelect));
            led1 = cont.OpenPin(FEZ.GpioPin.Led1);
            btn1 = cont.OpenPin(FEZ.GpioPin.Btn1);

            //UC5550
            //var reset = cont.OpenPin(UC5550.GpioPin.PG12);
            //var irq = cont.OpenPin(UC5550.GpioPin.PB11);
            //var scont = SpiController.FromName(UC5550.SpiBus.Spi5);
            //var spi = scont.GetDevice(SPWF04SxInterface.GetConnectionSettings(SpiChipSelectType.Gpio, UC5550.GpioPin.PB10));
            //led1 = cont.OpenPin(UC5550.GpioPin.PG3);
            //btn1 = cont.OpenPin(UC5550.GpioPin.PI8);

            led1.SetDriveMode(GpioPinDriveMode.Output);
            btn1.SetDriveMode(GpioPinDriveMode.InputPullUp);

            wifi = new SPWF04SxInterface(spi, irq, reset);

            wifi.IndicationReceived += (s, e) => Debug.WriteLine($"WIND: {Program.WindToName(e.Indication)} {e.Message}");
            wifi.ErrorReceived += (s, e) => Debug.WriteLine($"ERROR: {e.Error} {e.Message}");

            wifi.TurnOn();

            NetworkInterface.ActiveNetworkInterface = wifi;

            Run();
        }

        private static void Run() {
            WaitForButton();
            wifi.JoinNetwork("GHI", "password");

            WaitForButton();
            wifi.ClearTlsServerRootCertificate();
            wifi.SetTlsServerRootCertificate(Resources.GetBytes(Resources.BinaryResources.Digicert___GHI));

            while (true) {
                WaitForButton();

                //.NET
                TestHttp("http://www.ghielectronics.com", "/products/fez");
                //TestHttp("http://ghielectronics.com", "/products/system-on-modules");
                //TestSocket("www.ghielectronics.com", "/tinyclr/features", 80);

                //WiFi
                //TestHttp("www.ghielectronics.com", "/tinyclr/faq", 80, SPWF04SxConnectionSecurityType.None, true);
                //TestHttp("old.ghielectronics.com", "/downloads/", 80, SPWF04SxConnectionSecurityType.None, true);
                //TestSocket("www.ghielectronics.com", "/products/BrainPad", 80, SPWF04SxConnectionType.Tcp, SPWF04SxConnectionSecurityType.None);
                //TestSocket("www.ghielectronics.com", "/products/longevity", 443, SPWF04SxConnectionType.Tcp, SPWF04SxConnectionSecurityType.Tls, "ghielectronics.com");

                Debug.WriteLine(GC.GetTotalMemory(true).ToString("N0"));
            }
        }

        private static void TestSocket(string host, string url, int port, SPWF04SxConnectionType connectionType, SPWF04SxConnectionSecurityType connectionSecurity, string commonName = null) {
            var buffer = new byte[512];
            var id = wifi.OpenSocket(host, port, connectionType, connectionSecurity, commonName);

            var cont = true;
            while (cont) {
                var start = DateTime.UtcNow;

                wifi.WriteSocket(id, Encoding.UTF8.GetBytes($"GET {url} HTTP/1.1\r\nHost: {host}\r\n\r\n"));

                Thread.Sleep(100);

                var total = 0;
                var first = true;
                while ((wifi.QuerySocket(id) is var avail && avail > 0) || first || total < 120) {
                    if (avail > 0) {
                        first = false;

                        var read = wifi.ReadSocket(id, buffer, 0, Math.Min(avail, buffer.Length));

                        total += read;

                        Debugger.Log(0, "", Encoding.UTF8.GetString(buffer, 0, read));
                    }

                    Thread.Sleep(100);
                }

                Debug.WriteLine($"\r\nRead: {total:N0} in {(DateTime.UtcNow - start).TotalMilliseconds:N0}ms");

                WaitForButton();
            }

            wifi.CloseSocket(id);
        }

        private static void TestHttp(string host, string url, int port, SPWF04SxConnectionSecurityType security, bool get) {
            var buffer = new byte[512];
            var start = DateTime.UtcNow;
            var code = get ? wifi.SendHttpGet(host, url, port, security) : wifi.SendHttpPost(host, url, port, security);

            Debug.WriteLine($"HTTP {code}");

            var total = 0;
            while (wifi.ReadHttpResponse(buffer, 0, buffer.Length) is var read && read > 0) {
                total += read;

                try {
                    Debugger.Log(0, "", Encoding.UTF8.GetString(buffer, 0, read));
                }
                catch {
                    Debugger.Log(0, "", Encoding.UTF8.GetString(buffer, 0, read - 1));
                }

                Thread.Sleep(100);
            }

            Debug.WriteLine($"\r\nRead: {total:N0} in {(DateTime.UtcNow - start).TotalMilliseconds:N0}ms");
        }

        private static void TestSocket(string host, string url, int port, string commonName = null) {
            if (commonName != null) {
                wifi.ForceSocketsTls = true;
                wifi.ForceSocketsTlsCommonName = commonName;
            }

            var buffer = new byte[512];
            var data = Encoding.UTF8.GetBytes($"GET {url} HTTP/1.1\r\nHost: {host}\r\n\r\n");
            var entry = Dns.GetHostEntry(host);
            var socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);

            socket.Connect(new IPEndPoint(entry.AddressList[0], port));
            socket.ReceiveTimeout = 250;

            var cont = true;
            while (cont) {
                var start = DateTime.UtcNow;
                var written = socket.Send(data);

                Thread.Sleep(100);

                var total = 0;
                var first = true;
                while ((socket.Poll(0, SelectMode.SelectRead) is var ready && ready) || first || total < 120) {
                    if (ready && socket.Receive(buffer) is var read && read > 0) {
                        first = false;

                        Debugger.Log(0, "", Encoding.UTF8.GetString(buffer, 0, read));

                        total += read;
                    }

                    Thread.Sleep(100);
                }

                Debug.WriteLine($"\r\nRead: {total:N0} in {(DateTime.UtcNow - start).TotalMilliseconds:N0}ms");

                WaitForButton();
            }

            socket.Close();
        }

        private static void TestHttp(string host, string url, string commonName = null) {
            if (commonName != null) {
                wifi.ForceSocketsTls = true;
                wifi.ForceSocketsTlsCommonName = commonName;
            }

            var buffer = new byte[512];
            var start = DateTime.UtcNow;
            var req = (HttpWebRequest)HttpWebRequest.Create(host + url);
            req.HttpsAuthentCerts = new[] { new X509Certificate() };
            var res = (HttpWebResponse)req.GetResponse();
            var str = res.GetResponseStream();

            Debug.WriteLine($"HTTP {res.StatusCode}");

            var total = 0;
            while (str.Read(buffer, 0, buffer.Length) is var read && read > 0) {
                total += read;

                try {
                    Debugger.Log(0, "", Encoding.UTF8.GetString(buffer, 0, read));
                }
                catch {
                    Debugger.Log(0, "", Encoding.UTF8.GetString(buffer, 0, read - 1));
                }

                Thread.Sleep(100);
            }

            Debug.WriteLine($"\r\nRead: {total:N0} in {(DateTime.UtcNow - start).TotalMilliseconds:N0}ms");
        }

        private static void WaitForButton() {
            while (btn1.Read() == GpioPinValue.High) {
                led1.Write(led1.Read() == GpioPinValue.High ? GpioPinValue.Low : GpioPinValue.High);

                Thread.Sleep(50);
            }

            while (btn1.Read() == GpioPinValue.Low)
                Thread.Sleep(50);
        }

        private static string WindToName(SPWF04SxIndication wind) {
            switch (wind) {
                case SPWF04SxIndication.ConsoleActive: return nameof(SPWF04SxIndication.ConsoleActive);
                case SPWF04SxIndication.PowerOn: return nameof(SPWF04SxIndication.PowerOn);
                case SPWF04SxIndication.Reset: return nameof(SPWF04SxIndication.Reset);
                case SPWF04SxIndication.WatchdogRunning: return nameof(SPWF04SxIndication.WatchdogRunning);
                case SPWF04SxIndication.LowMemory: return nameof(SPWF04SxIndication.LowMemory);
                case SPWF04SxIndication.WiFiHardwareFailure: return nameof(SPWF04SxIndication.WiFiHardwareFailure);
                case SPWF04SxIndication.ConfigurationFailure: return nameof(SPWF04SxIndication.ConfigurationFailure);
                case SPWF04SxIndication.HardFault: return nameof(SPWF04SxIndication.HardFault);
                case SPWF04SxIndication.StackOverflow: return nameof(SPWF04SxIndication.StackOverflow);
                case SPWF04SxIndication.MallocFailed: return nameof(SPWF04SxIndication.MallocFailed);
                case SPWF04SxIndication.RadioStartup: return nameof(SPWF04SxIndication.RadioStartup);
                case SPWF04SxIndication.WiFiPSMode: return nameof(SPWF04SxIndication.WiFiPSMode);
                case SPWF04SxIndication.Copyright: return nameof(SPWF04SxIndication.Copyright);
                case SPWF04SxIndication.WiFiBssRegained: return nameof(SPWF04SxIndication.WiFiBssRegained);
                case SPWF04SxIndication.WiFiSignalLow: return nameof(SPWF04SxIndication.WiFiSignalLow);
                case SPWF04SxIndication.WiFiSignalOk: return nameof(SPWF04SxIndication.WiFiSignalOk);
                case SPWF04SxIndication.BootMessages: return nameof(SPWF04SxIndication.BootMessages);
                case SPWF04SxIndication.KeytypeNotImplemented: return nameof(SPWF04SxIndication.KeytypeNotImplemented);
                case SPWF04SxIndication.WiFiJoin: return nameof(SPWF04SxIndication.WiFiJoin);
                case SPWF04SxIndication.WiFiJoinFailed: return nameof(SPWF04SxIndication.WiFiJoinFailed);
                case SPWF04SxIndication.WiFiScanning: return nameof(SPWF04SxIndication.WiFiScanning);
                case SPWF04SxIndication.ScanBlewUp: return nameof(SPWF04SxIndication.ScanBlewUp);
                case SPWF04SxIndication.ScanFailed: return nameof(SPWF04SxIndication.ScanFailed);
                case SPWF04SxIndication.WiFiUp: return nameof(SPWF04SxIndication.WiFiUp);
                case SPWF04SxIndication.WiFiAssociationSuccessful: return nameof(SPWF04SxIndication.WiFiAssociationSuccessful);
                case SPWF04SxIndication.StartedAP: return nameof(SPWF04SxIndication.StartedAP);
                case SPWF04SxIndication.APStartFailed: return nameof(SPWF04SxIndication.APStartFailed);
                case SPWF04SxIndication.StationAssociated: return nameof(SPWF04SxIndication.StationAssociated);
                case SPWF04SxIndication.DhcpReply: return nameof(SPWF04SxIndication.DhcpReply);
                case SPWF04SxIndication.WiFiBssLost: return nameof(SPWF04SxIndication.WiFiBssLost);
                case SPWF04SxIndication.WiFiException: return nameof(SPWF04SxIndication.WiFiException);
                case SPWF04SxIndication.WiFiHardwareStarted: return nameof(SPWF04SxIndication.WiFiHardwareStarted);
                case SPWF04SxIndication.WiFiNetwork: return nameof(SPWF04SxIndication.WiFiNetwork);
                case SPWF04SxIndication.WiFiUnhandledEvent: return nameof(SPWF04SxIndication.WiFiUnhandledEvent);
                case SPWF04SxIndication.WiFiScan: return nameof(SPWF04SxIndication.WiFiScan);
                case SPWF04SxIndication.WiFiUnhandledIndication: return nameof(SPWF04SxIndication.WiFiUnhandledIndication);
                case SPWF04SxIndication.WiFiPoweredDown: return nameof(SPWF04SxIndication.WiFiPoweredDown);
                case SPWF04SxIndication.HWInMiniAPMode: return nameof(SPWF04SxIndication.HWInMiniAPMode);
                case SPWF04SxIndication.WiFiDeauthentication: return nameof(SPWF04SxIndication.WiFiDeauthentication);
                case SPWF04SxIndication.WiFiDisassociation: return nameof(SPWF04SxIndication.WiFiDisassociation);
                case SPWF04SxIndication.WiFiUnhandledManagement: return nameof(SPWF04SxIndication.WiFiUnhandledManagement);
                case SPWF04SxIndication.WiFiUnhandledData: return nameof(SPWF04SxIndication.WiFiUnhandledData);
                case SPWF04SxIndication.WiFiUnknownFrame: return nameof(SPWF04SxIndication.WiFiUnknownFrame);
                case SPWF04SxIndication.Dot11Illegal: return nameof(SPWF04SxIndication.Dot11Illegal);
                case SPWF04SxIndication.WpaCrunchingPsk: return nameof(SPWF04SxIndication.WpaCrunchingPsk);
                case SPWF04SxIndication.WpaTerminated: return nameof(SPWF04SxIndication.WpaTerminated);
                case SPWF04SxIndication.WpaStartFailed: return nameof(SPWF04SxIndication.WpaStartFailed);
                case SPWF04SxIndication.WpaHandshakeComplete: return nameof(SPWF04SxIndication.WpaHandshakeComplete);
                case SPWF04SxIndication.GpioInterrupt: return nameof(SPWF04SxIndication.GpioInterrupt);
                case SPWF04SxIndication.Wakeup: return nameof(SPWF04SxIndication.Wakeup);
                case SPWF04SxIndication.PendingData: return nameof(SPWF04SxIndication.PendingData);
                case SPWF04SxIndication.InputToRemote: return nameof(SPWF04SxIndication.InputToRemote);
                case SPWF04SxIndication.OutputFromRemote: return nameof(SPWF04SxIndication.OutputFromRemote);
                case SPWF04SxIndication.SocketClosed: return nameof(SPWF04SxIndication.SocketClosed);
                case SPWF04SxIndication.IncomingSocketClient: return nameof(SPWF04SxIndication.IncomingSocketClient);
                case SPWF04SxIndication.SocketClientGone: return nameof(SPWF04SxIndication.SocketClientGone);
                case SPWF04SxIndication.SocketDroppingData: return nameof(SPWF04SxIndication.SocketDroppingData);
                case SPWF04SxIndication.RemoteConfiguration: return nameof(SPWF04SxIndication.RemoteConfiguration);
                case SPWF04SxIndication.FactoryReset: return nameof(SPWF04SxIndication.FactoryReset);
                case SPWF04SxIndication.LowPowerMode: return nameof(SPWF04SxIndication.LowPowerMode);
                case SPWF04SxIndication.GoingIntoStandby: return nameof(SPWF04SxIndication.GoingIntoStandby);
                case SPWF04SxIndication.ResumingFromStandby: return nameof(SPWF04SxIndication.ResumingFromStandby);
                case SPWF04SxIndication.GoingIntoDeepSleep: return nameof(SPWF04SxIndication.GoingIntoDeepSleep);
                case SPWF04SxIndication.ResumingFromDeepSleep: return nameof(SPWF04SxIndication.ResumingFromDeepSleep);
                case SPWF04SxIndication.StationDisassociated: return nameof(SPWF04SxIndication.StationDisassociated);
                case SPWF04SxIndication.SystemConfigurationUpdated: return nameof(SPWF04SxIndication.SystemConfigurationUpdated);
                case SPWF04SxIndication.RejectedFoundNetwork: return nameof(SPWF04SxIndication.RejectedFoundNetwork);
                case SPWF04SxIndication.RejectedAssociation: return nameof(SPWF04SxIndication.RejectedAssociation);
                case SPWF04SxIndication.WiFiAuthenticationTimedOut: return nameof(SPWF04SxIndication.WiFiAuthenticationTimedOut);
                case SPWF04SxIndication.WiFiAssociationTimedOut: return nameof(SPWF04SxIndication.WiFiAssociationTimedOut);
                case SPWF04SxIndication.MicFailure: return nameof(SPWF04SxIndication.MicFailure);
                case SPWF04SxIndication.UdpBroadcast: return nameof(SPWF04SxIndication.UdpBroadcast);
                case SPWF04SxIndication.WpsGeneratedDhKeyset: return nameof(SPWF04SxIndication.WpsGeneratedDhKeyset);
                case SPWF04SxIndication.WpsEnrollmentAttemptTimedOut: return nameof(SPWF04SxIndication.WpsEnrollmentAttemptTimedOut);
                case SPWF04SxIndication.SockdDroppingClient: return nameof(SPWF04SxIndication.SockdDroppingClient);
                case SPWF04SxIndication.NtpServerDelivery: return nameof(SPWF04SxIndication.NtpServerDelivery);
                case SPWF04SxIndication.DhcpFailedToGetLease: return nameof(SPWF04SxIndication.DhcpFailedToGetLease);
                case SPWF04SxIndication.MqttPublished: return nameof(SPWF04SxIndication.MqttPublished);
                case SPWF04SxIndication.MqttClosed: return nameof(SPWF04SxIndication.MqttClosed);
                case SPWF04SxIndication.WebSocketData: return nameof(SPWF04SxIndication.WebSocketData);
                case SPWF04SxIndication.WebSocketClosed: return nameof(SPWF04SxIndication.WebSocketClosed);
                case SPWF04SxIndication.FileReceived: return nameof(SPWF04SxIndication.FileReceived);
                default: return "Other";
            }
        }
    }
}


```


