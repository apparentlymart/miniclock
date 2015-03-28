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
P 9800 2250
F 0 "P?" V 9750 2250 60  0000 C CNN
F 1 "CONN_6" V 9850 2250 60  0000 C CNN
F 2 "" H 9800 2250 60  0000 C CNN
F 3 "" H 9800 2250 60  0000 C CNN
	1    9800 2250
	1    0    0    -1  
$EndComp
Text Label 9400 2000 2    60   ~ 0
GND
Text Label 9400 2100 2    60   ~ 0
CTS
Text Label 9400 2200 2    60   ~ 0
+5V
Text Label 9400 2300 2    60   ~ 0
TXD
Text Label 9400 2400 2    60   ~ 0
RXD
Text Label 9400 2500 2    60   ~ 0
RTS
Wire Wire Line
	9400 2000 9450 2000
Wire Wire Line
	9400 2100 9450 2100
Wire Wire Line
	9400 2200 9450 2200
Wire Wire Line
	9400 2300 9450 2300
Wire Wire Line
	9400 2400 9450 2400
Wire Wire Line
	9400 2500 9450 2500
Text Notes 9900 2750 2    60   ~ 0
Programming\nConnector
$Comp
L LD1117 U?
U 1 1 5515DB1A
P 9450 3450
F 0 "U?" H 9600 3254 60  0000 C CNN
F 1 "LD1117" H 9450 3650 60  0000 C CNN
F 2 "" H 9450 3450 60  0000 C CNN
F 3 "" H 9450 3450 60  0000 C CNN
	1    9450 3450
	1    0    0    -1  
$EndComp
Text Label 8750 3400 2    60   ~ 0
+5V
Text Label 10100 3400 0    60   ~ 0
+3V3
Text Label 9450 4000 3    60   ~ 0
GND
Wire Wire Line
	9850 3400 10100 3400
Wire Wire Line
	8750 3400 9050 3400
$Comp
L CP1 C?
U 1 1 5515DEE1
P 10000 3650
F 0 "C?" H 10050 3750 50  0000 L CNN
F 1 "CP1" H 10050 3550 50  0000 L CNN
F 2 "" H 10000 3650 60  0000 C CNN
F 3 "" H 10000 3650 60  0000 C CNN
	1    10000 3650
	1    0    0    -1  
$EndComp
$Comp
L CP1 C?
U 1 1 5515DF01
P 8900 3650
F 0 "C?" H 8950 3750 50  0000 L CNN
F 1 "CP1" H 8950 3550 50  0000 L CNN
F 2 "" H 8900 3650 60  0000 C CNN
F 3 "" H 8900 3650 60  0000 C CNN
	1    8900 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 3450 8900 3400
Connection ~ 8900 3400
Wire Wire Line
	10000 3450 10000 3400
Connection ~ 10000 3400
Wire Wire Line
	10000 3900 10000 3850
Wire Wire Line
	8900 3900 10000 3900
Connection ~ 9450 3900
Wire Wire Line
	8900 3850 8900 3900
Wire Wire Line
	9450 3700 9450 4000
Text Notes 9600 4150 0    60   ~ 0
Voltage\nRegulator
$Comp
L LPC812M101JD20 U?
U 1 1 5515E50B
P 6350 2400
F 0 "U?" H 6050 2950 60  0000 C CNN
F 1 "LPC812M101JD20" H 6350 1850 60  0000 C CNN
F 2 "" H 6350 2600 60  0000 C CNN
F 3 "" H 6350 2600 60  0000 C CNN
	1    6350 2400
	1    0    0    -1  
$EndComp
Text Label 7600 2100 1    60   ~ 0
GND
Text Label 7600 2700 3    60   ~ 0
+3V3
$Comp
L C C?
U 1 1 5515E5DD
P 7600 2400
F 0 "C?" H 7600 2500 40  0000 L CNN
F 1 "0.1uF" H 7606 2315 40  0000 L CNN
F 2 "" H 7638 2250 30  0000 C CNN
F 3 "" H 7600 2400 60  0000 C CNN
	1    7600 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 2350 7400 2350
Wire Wire Line
	7400 2350 7400 2150
Wire Wire Line
	7400 2150 7600 2150
Wire Wire Line
	7600 2100 7600 2200
Connection ~ 7600 2150
Wire Wire Line
	6800 2450 7400 2450
Wire Wire Line
	7400 2450 7400 2650
Wire Wire Line
	7400 2650 7600 2650
Wire Wire Line
	7600 2600 7600 2700
Connection ~ 7600 2650
$EndSCHEMATC
