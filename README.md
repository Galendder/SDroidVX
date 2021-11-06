# SDroidVX
THIS REPOSITORY IS A FORK OF https://github.com/danielpontello/sdvx-mobile-controller
This repository contains an Android application that serves as a mobile controller for Sound Voltex-like games (like K-Shoot Mania).

Games like these need special controllers to be played correctly, with things like analog knobs that can't be easily emulated with a mouse and keyboard. This project uses the flexibility of touch screens to simulate those controls on a mobile phone/tablet.

## COMPATIBLE GAMES
- Unnamed Sound Voltex Clone
- K-ShootMania
- DJMax Respect V
- Osu!Mania

## NEW FEATURES
- IP and port setter
- Button color customization color picker
- Background image [NOT AVAILABLE YET]
- Graphical server-side interface

## Installing
[COMING SOON]
Download the client-side APK from the release and install it on your Android phone/tablet

Download the server from the release and launch it on your computer.

To run the server, you'll need the [vJoy Virtual Joystick Drivers](https://github.com/jshafer817/vJoy). Those drivers are used to create a virtual device that will be controlled by your mobile phone.

After installing vJoy, open up the "Configure vJoy" application and configure your first virtual joystick as follows:

![vJoy settings screen](/docs/vjoy.png?raw=true "VJoy configuration")

## How to Use
### Client

Open up the application on your mobile phone and you are ready to go. Make sure your phone is connected to the same network as your server.
Once you launched the app, hold start button for 5 seconds. You can now change the IP and the port of your server.

### Server

![Server interface](/docs/server_side.png?raw=true "Server Interface")

Open the server application and, if everything is working, it will show the message `[OSC] Now listening to messages.`. Try pressing some buttons on the mobile phone to test if the connection is working properly.

After that, configure your game to use the "vJoy - Virtual Joystick" controller as the main input device. The buttons are mapped as follows:

| Button | vJoy input |
|:------:|:----------:|
| BTN-A  | Button 1   |
| BTN-B  | Button 2   |
| BTN-C  | Button 3   |
| BTN-D  | Button 4   |
| FX-L   | Button 5   |
| FX-R   | Button 6   |
| VOL-L  | Slider 1   |
| VOL-R  | Slider 2   |
| Start  | Button 7   |

## Librares Used

- [OscP5](http://www.sojamo.de/libraries/oscP5/) for sending the OSC messages on the Android app
- [SharpOSC](https://github.com/ValdemarOrn/SharpOSC) for receiving the OSC messages on the Desktop app
- [vJoy C# SDK](https://github.com/shauleiz/vJoy/tree/master/SDK/c%23) for simulating joystick inputs
- [ControlP5](https://github.com/sojamo/controlp5) for making menus
