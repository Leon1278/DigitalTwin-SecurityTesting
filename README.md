# DigitalTwin-SecurityTesting

The following screenshot outlines the BoilerICS-DigitalTwin. The digital twin simulates an industrial control system (ICS) securing a boiler against failure caused by increasing pressure isnide the boiler. It consists of a PLC, a HMI and an input/output - simulator hosted in seperate virtual maschines. The components communicate using the modbus TCP protokoll.

![Screenshot](misc/DigitalerZwilling.png)


# Installation

It is possible to run the digital twin on one operating system alone, but to approximate a real system environment we split up to components over three different virtual maschines.

To Setup the digital twin properly follow the given instructions below.

### Install VirtualBox

To install VirtualBox visit https://www.virtualbox.org/. Click the download tab and choose a version depending on your operating system. 

In the next step setup two virtual maschines. Specific instructions to create a virtual maschine are given here https://www.virtualbox.org/wiki/Documentation.

Our Approach uses windows 10 to run the input/output-simulator due to the best compatibility. To host the openplc runtime we use ubuntu linux. ScadaBR uses an specific virtual maschine image, further informations are given below.

### Install OpenPLC

To install and setup the openplc runtime visit https://www.openplcproject.com/. Click the getting started tab and follow the instructions to install the openplc runtime.

### Install ScadaBR

To install and setup ScadaBR in a virtual maschine visit https://www.openplcproject.com/. Click the getting started tab and follow the instructions to install the ScadaBR HMI.

### Install Input/Output-Simulator

There are many different modbus tcp simulators out in the internet that can be used for our purposes, for the best usability we recommend http://easymodbustcp.net/modbus-server-simulator.


# Configuration

### OpenPLC runtime

After installing and starting the runtime visit localhost:8080 to open the user interface.

First click on the programs tab and upload the boiler.st file.

![Screenshot](misc/OpenPLC_Einstellungen_Program.png)

Next click on the slave devices tab and enter the following settings. The ip address should be the address of your virtual maschine where your input/output-simulator is running.

![Screenshot](misc/OpenPLC_Einstellungen_SlaveDevice.png)

Last click on the settings tab to do some small changes here also.

![Screenshot](misc/OpenPLC_Einstellungen_Settings.png)


### Input/Output-Simulator

Just start EasyModbusTCPServer Simulator and go to the tab Input Registers on the right upper side of the GUI. Then you can manipulate the Register with starting address 1.


### ScadaBR HMI

After starting the VM where ScadaBR is hosted, visit the URL promted in the terminal. After that choose Iiport in the settings and copy paste the json code from the scadabr_hmi.json file above.

# Attack Scenarios

## Metasploit Framework

To Setup Metasploit visit https://www.rapid7.com/de/products/metasploit/ or install a pentesting distribution like Linux Kali or Parrot OS. We used a VM which hosted a linux kali distribution.

Start Metasploit Framework

Markup :  `msfconsole`

Search for modbus Modules

search modbus

Select the right module 

use scanner/scada/modbusdetect

Display options

show options

From here set the RHOSTS and choose an ACTION you want to perform. Regarding to that ACTION set some more options that are required, for example: ACTION WRITE_REGISTERS requires the STARTING_ADDRESS of the register and the new DATA to be set.

## C++ Script
