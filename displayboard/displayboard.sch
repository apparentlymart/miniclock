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
P 5200 7200
F 0 "P1" H 5200 7650 50  0000 C CNN
F 1 "CONN_01X08" V 5300 7200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08" H 5200 7200 60  0001 C CNN
F 3 "" H 5200 7200 60  0000 C CNN
	1    5200 7200
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X08 P2
U 1 1 55EE8C35
P 6000 7200
F 0 "P2" H 6000 7650 50  0000 C CNN
F 1 "CONN_01X08" V 6100 7200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08" H 6000 7200 60  0001 C CNN
F 3 "" H 6000 7200 60  0000 C CNN
	1    6000 7200
	1    0    0    -1  
$EndComp
Text Notes 6250 7300 0    60   ~ 0
Mechanical\nconnection\nonly
Text GLabel 4950 6950 0    60   Input ~ 0
GND
Text GLabel 4950 7050 0    60   Input ~ 0
+3V3
Text GLabel 4950 7150 0    60   Input ~ 0
+3V3
Text GLabel 4950 7250 0    60   Input ~ 0
SCLK
Text GLabel 4950 7350 0    60   Input ~ 0
MOSI
Text GLabel 4950 7450 0    60   Input ~ 0
MISO
Text GLabel 4950 7550 0    60   Input ~ 0
SSEL
Text GLabel 4950 6850 0    60   Input ~ 0
~RESET
Wire Wire Line
	4950 6850 5000 6850
Wire Wire Line
	4950 6950 5000 6950
Wire Wire Line
	4950 7050 5000 7050
Wire Wire Line
	4950 7150 5000 7150
Wire Wire Line
	4950 7250 5000 7250
Wire Wire Line
	4950 7350 5000 7350
Wire Wire Line
	4950 7450 5000 7450
Wire Wire Line
	4950 7550 5000 7550
Text Notes 5000 7750 0    60   ~ 0
Main Board Interconnect
$Comp
L LEDM U?
U 1 1 56526517
P 3850 5650
F 0 "U?" H 3350 5050 60  0000 C CNN
F 1 "LEDM" H 4300 5050 60  0000 C CNN
F 2 "" H 3700 5650 60  0000 C CNN
F 3 "" H 3700 5650 60  0000 C CNN
	1    3850 5650
	1    0    0    -1  
$EndComp
$Comp
L LEDM U?
U 1 1 56526560
P 5950 5650
F 0 "U?" H 5450 5050 60  0000 C CNN
F 1 "LEDM" H 6400 5050 60  0000 C CNN
F 2 "" H 5800 5650 60  0000 C CNN
F 3 "" H 5800 5650 60  0000 C CNN
	1    5950 5650
	1    0    0    -1  
$EndComp
$Comp
L LEDM U?
U 1 1 565265E7
P 8050 5650
F 0 "U?" H 7550 5050 60  0000 C CNN
F 1 "LEDM" H 8500 5050 60  0000 C CNN
F 2 "" H 7900 5650 60  0000 C CNN
F 3 "" H 7900 5650 60  0000 C CNN
	1    8050 5650
	1    0    0    -1  
$EndComp
$Comp
L MAX6960 U?
U 1 1 56527C95
P 4600 2350
F 0 "U?" H 4200 3750 60  0000 C CNN
F 1 "MAX6960" H 4850 850 60  0000 C CNN
F 2 "" H 4400 1350 60  0000 C CNN
F 3 "" H 4400 1350 60  0000 C CNN
	1    4600 2350
	1    0    0    -1  
$EndComp
$Comp
L MAX6960 U?
U 1 1 56527DE8
P 7400 2350
F 0 "U?" H 7000 3750 60  0000 C CNN
F 1 "MAX6960" H 7650 850 60  0000 C CNN
F 2 "" H 7200 1350 60  0000 C CNN
F 3 "" H 7200 1350 60  0000 C CNN
	1    7400 2350
	1    0    0    -1  
$EndComp
Text GLabel 6650 1100 0    60   Input ~ 0
+3V3
Wire Wire Line
	6650 1100 6750 1100
Wire Wire Line
	6700 1100 6700 1400
Wire Wire Line
	6700 1200 6750 1200
Connection ~ 6700 1100
Wire Wire Line
	6700 1300 6750 1300
Connection ~ 6700 1200
Wire Wire Line
	6700 1400 6750 1400
Connection ~ 6700 1300
Text GLabel 3850 1100 0    60   Input ~ 0
+3V3
Wire Wire Line
	3850 1100 3950 1100
Wire Wire Line
	3900 1100 3900 1400
Wire Wire Line
	3900 1200 3950 1200
Connection ~ 3900 1100
Wire Wire Line
	3900 1300 3950 1300
Connection ~ 3900 1200
Wire Wire Line
	3900 1400 3950 1400
Connection ~ 3900 1300
Text GLabel 3850 3700 0    60   Input ~ 0
GND
Wire Wire Line
	3850 3700 3950 3700
Wire Wire Line
	3900 3300 3900 3700
Wire Wire Line
	3900 3600 3950 3600
Connection ~ 3900 3700
Wire Wire Line
	3900 3500 3950 3500
Connection ~ 3900 3600
Wire Wire Line
	3900 3400 3950 3400
Connection ~ 3900 3500
Wire Wire Line
	3900 3300 3950 3300
Connection ~ 3900 3400
Text GLabel 6650 3700 0    60   Input ~ 0
GND
Wire Wire Line
	6650 3700 6750 3700
Wire Wire Line
	6700 3300 6700 3700
Wire Wire Line
	6700 3600 6750 3600
Connection ~ 6700 3700
Wire Wire Line
	6700 3500 6750 3500
Connection ~ 6700 3600
Wire Wire Line
	6700 3400 6750 3400
Connection ~ 6700 3500
Wire Wire Line
	6700 3300 6750 3300
Connection ~ 6700 3400
Wire Wire Line
	5250 1100 6050 1100
Wire Wire Line
	6050 1100 6050 1700
Wire Wire Line
	6050 1700 6750 1700
$EndSCHEMATC
