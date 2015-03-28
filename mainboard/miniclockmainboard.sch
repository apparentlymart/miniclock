EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:chips
LIBS:miniclockmainboard-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_6 P?
U 1 1 5515D564
P 10700 1150
F 0 "P?" V 10650 1150 60  0000 C CNN
F 1 "CONN_6" V 10750 1150 60  0000 C CNN
F 2 "" H 10700 1150 60  0000 C CNN
F 3 "" H 10700 1150 60  0000 C CNN
	1    10700 1150
	1    0    0    -1  
$EndComp
Text Label 10300 900  2    60   ~ 0
GND
Text Label 10300 1000 2    60   ~ 0
CTS
Text Label 10300 1100 2    60   ~ 0
+5V
Text Label 10300 1200 2    60   ~ 0
TXD
Text Label 10300 1300 2    60   ~ 0
RXD
Text Label 10300 1400 2    60   ~ 0
RTS
Wire Wire Line
	10300 900  10350 900 
Wire Wire Line
	10300 1000 10350 1000
Wire Wire Line
	10300 1100 10350 1100
Wire Wire Line
	10300 1200 10350 1200
Wire Wire Line
	10300 1300 10350 1300
Wire Wire Line
	10300 1400 10350 1400
Text Notes 10800 1650 2    60   ~ 0
Programming\nConnector
$Comp
L LD1117 U?
U 1 1 5515DB1A
P 5100 1000
F 0 "U?" H 5250 804 60  0000 C CNN
F 1 "LD1117" H 5100 1200 60  0000 C CNN
F 2 "" H 5100 1000 60  0000 C CNN
F 3 "" H 5100 1000 60  0000 C CNN
	1    5100 1000
	1    0    0    -1  
$EndComp
Text Label 4400 950  2    60   ~ 0
+5V
Text Label 5750 950  0    60   ~ 0
+3V3
Text Label 5100 1550 3    60   ~ 0
GND
Wire Wire Line
	5500 950  5750 950 
Wire Wire Line
	4400 950  4700 950 
$Comp
L CP1 C?
U 1 1 5515DEE1
P 5650 1200
F 0 "C?" H 5700 1300 50  0000 L CNN
F 1 "CP1" H 5700 1100 50  0000 L CNN
F 2 "" H 5650 1200 60  0000 C CNN
F 3 "" H 5650 1200 60  0000 C CNN
	1    5650 1200
	1    0    0    -1  
$EndComp
$Comp
L CP1 C?
U 1 1 5515DF01
P 4550 1200
F 0 "C?" H 4600 1300 50  0000 L CNN
F 1 "CP1" H 4600 1100 50  0000 L CNN
F 2 "" H 4550 1200 60  0000 C CNN
F 3 "" H 4550 1200 60  0000 C CNN
	1    4550 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 1000 4550 950 
Connection ~ 4550 950 
Wire Wire Line
	5650 850  5650 1000
Connection ~ 5650 950 
Wire Wire Line
	5650 1450 5650 1400
Wire Wire Line
	4550 1450 5650 1450
Connection ~ 5100 1450
Wire Wire Line
	4550 1400 4550 1450
Wire Wire Line
	5100 1250 5100 1550
Text Notes 5250 1700 0    60   ~ 0
Voltage\nRegulator
$Comp
L LPC812M101JD20 U?
U 1 1 5515E50B
P 2400 1400
F 0 "U?" H 2100 1950 60  0000 C CNN
F 1 "LPC812M101JD20" H 2400 850 60  0000 C CNN
F 2 "" H 2400 1600 60  0000 C CNN
F 3 "" H 2400 1600 60  0000 C CNN
	1    2400 1400
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5515E5DD
P 3650 1400
F 0 "C?" H 3650 1500 40  0000 L CNN
F 1 "0.1uF" H 3656 1315 40  0000 L CNN
F 2 "" H 3688 1250 30  0000 C CNN
F 3 "" H 3650 1400 60  0000 C CNN
	1    3650 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 1350 3450 1350
Wire Wire Line
	3450 1350 3450 1150
Wire Wire Line
	3450 1150 3650 1150
Connection ~ 3650 1150
Wire Wire Line
	2850 1450 3450 1450
Wire Wire Line
	3450 1450 3450 1650
Wire Wire Line
	3450 1650 3650 1650
Connection ~ 3650 1650
Text Label 1900 1350 2    60   ~ 0
RXD
Text Label 2900 1050 0    60   ~ 0
TXD
$Comp
L SW_PUSH SW?
U 1 1 5516EC1F
P 1150 850
F 0 "SW?" H 1300 960 50  0000 C CNN
F 1 "SW_PUSH" H 1150 770 50  0000 C CNN
F 2 "" H 1150 850 60  0000 C CNN
F 3 "" H 1150 850 60  0000 C CNN
	1    1150 850 
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SW?
U 1 1 5516EC4F
P 1150 1250
F 0 "SW?" H 1300 1360 50  0000 C CNN
F 1 "SW_PUSH" H 1150 1170 50  0000 C CNN
F 2 "" H 1150 1250 60  0000 C CNN
F 3 "" H 1150 1250 60  0000 C CNN
	1    1150 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 1150 1600 1150
Wire Wire Line
	1600 1150 1600 850 
Wire Wire Line
	1600 850  1450 850 
Wire Wire Line
	1450 1250 1950 1250
Text Label 800  1300 3    60   ~ 0
GND
Wire Wire Line
	800  850  800  1300
Wire Wire Line
	800  850  850  850 
Text Label 1900 1650 2    60   ~ 0
SCL
Text Label 1900 1750 2    60   ~ 0
SDA
Text Label 2900 1850 0    60   ~ 0
SCLK
Text Label 2900 1650 0    60   ~ 0
MOSI
Text Label 2900 1750 0    60   ~ 0
MISO
Text Label 1900 1850 2    60   ~ 0
SSEL
Wire Wire Line
	2850 1650 2900 1650
Wire Wire Line
	2850 1750 2900 1750
Wire Wire Line
	2850 1850 2900 1850
Wire Wire Line
	2850 1050 2900 1050
Wire Wire Line
	1900 1350 1950 1350
Wire Wire Line
	1900 1650 1950 1650
Wire Wire Line
	1900 1750 1950 1750
Wire Wire Line
	1900 1850 1950 1850
$Comp
L GND #PWR?
U 1 1 5516F441
P 4800 1550
F 0 "#PWR?" H 4800 1550 30  0001 C CNN
F 1 "GND" H 4800 1480 30  0001 C CNN
F 2 "" H 4800 1550 60  0000 C CNN
F 3 "" H 4800 1550 60  0000 C CNN
	1    4800 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 1450 4800 1550
Connection ~ 4800 1450
$Comp
L VCC #PWR?
U 1 1 5516F505
P 5650 850
F 0 "#PWR?" H 5650 950 30  0001 C CNN
F 1 "VCC" H 5650 950 30  0000 C CNN
F 2 "" H 5650 850 60  0000 C CNN
F 3 "" H 5650 850 60  0000 C CNN
	1    5650 850 
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR?
U 1 1 5516F5B2
P 3650 1700
F 0 "#PWR?" H 3650 1800 30  0001 C CNN
F 1 "VCC" H 3650 1800 30  0000 C CNN
F 2 "" H 3650 1700 60  0000 C CNN
F 3 "" H 3650 1700 60  0000 C CNN
	1    3650 1700
	-1   0    0    1   
$EndComp
Wire Wire Line
	3650 1600 3650 1700
$Comp
L GND #PWR?
U 1 1 5516F6A7
P 3650 1100
F 0 "#PWR?" H 3650 1100 30  0001 C CNN
F 1 "GND" H 3650 1030 30  0001 C CNN
F 2 "" H 3650 1100 60  0000 C CNN
F 3 "" H 3650 1100 60  0000 C CNN
	1    3650 1100
	-1   0    0    1   
$EndComp
Wire Wire Line
	3650 1100 3650 1200
Text Notes 1450 1650 2    60   ~ 0
Controller
Wire Wire Line
	800  1250 850  1250
Connection ~ 800  1250
$EndSCHEMATC
