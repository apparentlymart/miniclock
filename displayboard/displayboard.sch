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
LIBS:parts
LIBS:displayboard-cache
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
L CONN_01X08 P1
U 1 1 55EE8B80
P 9450 5650
F 0 "P1" H 9450 6100 50  0000 C CNN
F 1 "CONN_01X08" V 9550 5650 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08" H 9450 5650 60  0001 C CNN
F 3 "" H 9450 5650 60  0000 C CNN
	1    9450 5650
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X08 P2
U 1 1 55EE8C35
P 10250 5650
F 0 "P2" H 10250 6100 50  0000 C CNN
F 1 "CONN_01X08" V 10350 5650 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08" H 10250 5650 60  0001 C CNN
F 3 "" H 10250 5650 60  0000 C CNN
	1    10250 5650
	1    0    0    -1  
$EndComp
Text Notes 10500 5750 0    60   ~ 0
Mechanical\nconnection\nonly
Text GLabel 9200 5400 0    60   Input ~ 0
GND
Text GLabel 9200 5500 0    60   Input ~ 0
+3V3
Text GLabel 9200 5600 0    60   Input ~ 0
+3V3
Text GLabel 9200 5700 0    60   Input ~ 0
SCLK
Text GLabel 9200 5800 0    60   Input ~ 0
MOSI
Text GLabel 9200 5900 0    60   Input ~ 0
MISO
Text GLabel 9200 6000 0    60   Input ~ 0
SSEL
Text GLabel 9200 5300 0    60   Input ~ 0
~RESET
Wire Wire Line
	9200 5300 9250 5300
Wire Wire Line
	9200 5400 9250 5400
Wire Wire Line
	9200 5500 9250 5500
Wire Wire Line
	9200 5600 9250 5600
Wire Wire Line
	9200 5700 9250 5700
Wire Wire Line
	9200 5800 9250 5800
Wire Wire Line
	9200 5900 9250 5900
Wire Wire Line
	9200 6000 9250 6000
Text Notes 9250 6400 0    60   ~ 0
Main Board Interconnect
$Comp
L LEDM U?
U 1 1 56526517
P 3350 3500
F 0 "U?" H 2850 2900 60  0000 C CNN
F 1 "LEDM" H 3800 2900 60  0000 C CNN
F 2 "" H 3200 3500 60  0000 C CNN
F 3 "" H 3200 3500 60  0000 C CNN
	1    3350 3500
	1    0    0    -1  
$EndComp
$Comp
L LEDM U?
U 1 1 56526560
P 5450 3500
F 0 "U?" H 4950 2900 60  0000 C CNN
F 1 "LEDM" H 5900 2900 60  0000 C CNN
F 2 "" H 5300 3500 60  0000 C CNN
F 3 "" H 5300 3500 60  0000 C CNN
	1    5450 3500
	1    0    0    -1  
$EndComp
$Comp
L LEDM U?
U 1 1 565265E7
P 7550 3500
F 0 "U?" H 7050 2900 60  0000 C CNN
F 1 "LEDM" H 8000 2900 60  0000 C CNN
F 2 "" H 7400 3500 60  0000 C CNN
F 3 "" H 7400 3500 60  0000 C CNN
	1    7550 3500
	1    0    0    -1  
$EndComp
$EndSCHEMATC
