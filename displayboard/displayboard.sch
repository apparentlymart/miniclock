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
P 4450 7200
F 0 "P1" H 4450 7650 50  0000 C CNN
F 1 "CONN_01X08" V 4550 7200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08" H 4450 7200 60  0001 C CNN
F 3 "" H 4450 7200 60  0000 C CNN
	1    4450 7200
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X08 P2
U 1 1 55EE8C35
P 5250 7200
F 0 "P2" H 5250 7650 50  0000 C CNN
F 1 "CONN_01X08" V 5350 7200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08" H 5250 7200 60  0001 C CNN
F 3 "" H 5250 7200 60  0000 C CNN
	1    5250 7200
	1    0    0    -1  
$EndComp
Text Notes 5500 7300 0    60   ~ 0
Mechanical\nconnection\nonly
Text GLabel 3650 6950 0    60   Output ~ 0
GND
Text GLabel 3650 7050 0    60   Output ~ 0
+3V3
Text GLabel 4200 7150 0    60   Output ~ 0
+3V3
Text GLabel 3650 7250 0    60   Output ~ 0
SCLK
Text GLabel 3650 7350 0    60   Output ~ 0
MOSI
Text GLabel 3650 7450 0    60   Input ~ 0
MISO
Text GLabel 3650 7550 0    60   Output ~ 0
SSEL
Text GLabel 4200 6850 0    60   Output ~ 0
~RESET
Wire Wire Line
	4200 7150 4250 7150
Text Notes 4250 7750 0    60   ~ 0
Main Board Interconnect
$Comp
L LEDM U2
U 1 1 56526517
P 10450 1900
F 0 "U2" H 9950 1300 60  0000 C CNN
F 1 "LEDM" H 10900 1300 60  0000 C CNN
F 2 "miniclock:KWM-R30881CUYB" H 10300 1900 60  0001 C CNN
F 3 "" H 10300 1900 60  0000 C CNN
	1    10450 1900
	1    0    0    -1  
$EndComp
$Comp
L LEDM U4
U 1 1 56526560
P 10450 3800
F 0 "U4" H 9950 3200 60  0000 C CNN
F 1 "LEDM" H 10900 3200 60  0000 C CNN
F 2 "miniclock:KWM-R30881CUYB" H 10300 3800 60  0001 C CNN
F 3 "" H 10300 3800 60  0000 C CNN
	1    10450 3800
	1    0    0    -1  
$EndComp
$Comp
L LEDM U6
U 1 1 565265E7
P 10450 5700
F 0 "U6" H 9950 5100 60  0000 C CNN
F 1 "LEDM" H 10900 5100 60  0000 C CNN
F 2 "miniclock:KWM-R30881CUYB" H 10300 5700 60  0001 C CNN
F 3 "" H 10300 5700 60  0000 C CNN
	1    10450 5700
	1    0    0    -1  
$EndComp
$Comp
L MAX6960 U3
U 1 1 56527C95
P 1900 2100
F 0 "U3" H 1500 3500 60  0000 C CNN
F 1 "MAX6960" H 2150 600 60  0000 C CNN
F 2 "miniclock:MAX6960" H 1700 1100 60  0001 C CNN
F 3 "" H 1700 1100 60  0000 C CNN
	1    1900 2100
	1    0    0    -1  
$EndComp
$Comp
L MAX6960 U5
U 1 1 56527DE8
P 4700 2100
F 0 "U5" H 4300 3500 60  0000 C CNN
F 1 "MAX6960" H 4950 600 60  0000 C CNN
F 2 "miniclock:MAX6960" H 4500 1100 60  0001 C CNN
F 3 "" H 4500 1100 60  0000 C CNN
	1    4700 2100
	1    0    0    -1  
$EndComp
Text GLabel 3950 850  0    60   Input ~ 0
+3V3
Wire Wire Line
	3950 850  4050 850 
Wire Wire Line
	4000 850  4000 1150
Wire Wire Line
	4000 950  4050 950 
Connection ~ 4000 850 
Wire Wire Line
	4000 1050 4050 1050
Connection ~ 4000 950 
Wire Wire Line
	4000 1150 4050 1150
Connection ~ 4000 1050
Text GLabel 1150 850  0    60   Input ~ 0
+3V3
Wire Wire Line
	1150 850  1250 850 
Wire Wire Line
	1200 850  1200 1150
Wire Wire Line
	1200 950  1250 950 
Connection ~ 1200 850 
Wire Wire Line
	1200 1050 1250 1050
Connection ~ 1200 950 
Wire Wire Line
	1200 1150 1250 1150
Connection ~ 1200 1050
Text GLabel 1150 3450 0    60   Input ~ 0
GND
Wire Wire Line
	1150 3450 1250 3450
Wire Wire Line
	1200 3050 1200 3450
Wire Wire Line
	1200 3350 1250 3350
Connection ~ 1200 3450
Wire Wire Line
	1200 3250 1250 3250
Connection ~ 1200 3350
Wire Wire Line
	1200 3150 1250 3150
Connection ~ 1200 3250
Wire Wire Line
	1200 3050 1250 3050
Connection ~ 1200 3150
Text GLabel 3950 3450 0    60   Input ~ 0
GND
Wire Wire Line
	3950 3450 4050 3450
Wire Wire Line
	4000 3050 4000 3450
Wire Wire Line
	4000 3350 4050 3350
Connection ~ 4000 3450
Wire Wire Line
	4000 3250 4050 3250
Connection ~ 4000 3350
Wire Wire Line
	4000 3150 4050 3150
Connection ~ 4000 3250
Wire Wire Line
	4000 3050 4050 3050
Connection ~ 4000 3150
Wire Wire Line
	2550 850  3350 850 
Wire Wire Line
	3350 850  3350 1450
Wire Wire Line
	3350 1450 4050 1450
Text GLabel 1150 1450 0    60   Input ~ 0
+3V3
Text GLabel 1150 1650 0    60   Input ~ 0
SSEL
Wire Wire Line
	1150 1650 1250 1650
Text GLabel 1150 1950 0    60   Output ~ 0
MISO
Text GLabel 1150 1850 0    60   Input ~ 0
MOSI
Text GLabel 1150 2050 0    60   Input ~ 0
SCLK
Wire Wire Line
	1150 1850 1250 1850
Wire Wire Line
	1150 1950 1250 1950
Wire Wire Line
	1150 2050 1250 2050
Text GLabel 3950 1950 0    60   Output ~ 0
MISO
Text GLabel 3950 1850 0    60   Input ~ 0
MOSI
Text GLabel 3950 2050 0    60   Input ~ 0
SCLK
Wire Wire Line
	3950 1850 4050 1850
Wire Wire Line
	3950 1950 4050 1950
Wire Wire Line
	3950 2050 4050 2050
Text GLabel 1150 1350 0    60   BiDi ~ 0
ADDCLK
Wire Wire Line
	1150 1350 1250 1350
Wire Wire Line
	1150 1450 1250 1450
Text GLabel 3950 1350 0    60   BiDi ~ 0
ADDCLK
Wire Wire Line
	3950 1350 4050 1350
Text GLabel 3950 1650 0    60   Input ~ 0
SSEL
Wire Wire Line
	3950 1650 4050 1650
Text GLabel 3950 2450 0    60   Input ~ 0
~RESET
Wire Wire Line
	3950 2450 4050 2450
Text GLabel 1150 2450 0    60   Input ~ 0
~RESET
Wire Wire Line
	1150 2450 1250 2450
$Comp
L Jumper_NO_Small JP1
U 1 1 565A4D43
P 1100 2650
F 0 "JP1" H 1100 2730 50  0000 C CNN
F 1 "Jumper_NO_Small" H 1110 2590 50  0001 C CNN
F 2 "miniclock:0805" H 1100 2650 60  0001 C CNN
F 3 "" H 1100 2650 60  0000 C CNN
	1    1100 2650
	1    0    0    -1  
$EndComp
$Comp
L Jumper_NO_Small JP2
U 1 1 565A4D7E
P 1100 2750
F 0 "JP2" H 1100 2830 50  0000 C CNN
F 1 "Jumper_NO_Small" H 1110 2690 50  0001 C CNN
F 2 "miniclock:0805" H 1100 2750 60  0001 C CNN
F 3 "" H 1100 2750 60  0000 C CNN
	1    1100 2750
	-1   0    0    1   
$EndComp
Wire Wire Line
	1200 2650 1250 2650
Wire Wire Line
	1200 2750 1250 2750
Text GLabel 900  2750 0    60   Input ~ 0
GND
Wire Wire Line
	1000 2750 900  2750
Wire Wire Line
	1000 2650 950  2650
Wire Wire Line
	950  2650 950  2750
Connection ~ 950  2750
$Comp
L Jumper_NO_Small JP3
U 1 1 565A5163
P 3900 2650
F 0 "JP3" H 3900 2730 50  0000 C CNN
F 1 "Jumper_NO_Small" H 3910 2590 50  0001 C CNN
F 2 "miniclock:0805" H 3900 2650 60  0001 C CNN
F 3 "" H 3900 2650 60  0000 C CNN
	1    3900 2650
	1    0    0    -1  
$EndComp
$Comp
L Jumper_NO_Small JP4
U 1 1 565A5169
P 3900 2750
F 0 "JP4" H 3900 2830 50  0000 C CNN
F 1 "Jumper_NO_Small" H 3910 2690 50  0001 C CNN
F 2 "miniclock:0805" H 3900 2750 60  0001 C CNN
F 3 "" H 3900 2750 60  0000 C CNN
	1    3900 2750
	-1   0    0    1   
$EndComp
Text GLabel 3700 2750 0    60   Input ~ 0
GND
Wire Wire Line
	3800 2750 3700 2750
Wire Wire Line
	3800 2650 3750 2650
Wire Wire Line
	3750 2650 3750 2750
Connection ~ 3750 2750
Wire Wire Line
	4000 2650 4050 2650
Wire Wire Line
	4000 2750 4050 2750
Text GLabel 2600 1050 2    60   Output ~ 0
D0_R1
Text GLabel 2600 1150 2    60   Output ~ 0
D0_R2
Text GLabel 2600 1250 2    60   Output ~ 0
D0_R3
Text GLabel 2600 1350 2    60   Output ~ 0
D0_R4
Text GLabel 2600 1450 2    60   Output ~ 0
D0_R5
Text GLabel 2600 1550 2    60   Output ~ 0
D0_R6
Text GLabel 2600 1650 2    60   Output ~ 0
D0_R7
Text GLabel 2600 1750 2    60   Output ~ 0
D0_R8
Wire Wire Line
	2550 1050 2600 1050
Wire Wire Line
	2550 1150 2600 1150
Wire Wire Line
	2550 1250 2600 1250
Wire Wire Line
	2550 1350 2600 1350
Wire Wire Line
	2550 1450 2600 1450
Wire Wire Line
	2550 1550 2600 1550
Wire Wire Line
	2550 1650 2600 1650
Wire Wire Line
	2550 1750 2600 1750
Text GLabel 5400 1050 2    60   Output ~ 0
D2_R1
Text GLabel 5400 1150 2    60   Output ~ 0
D2_R2
Text GLabel 5400 1250 2    60   Output ~ 0
D2_R3
Text GLabel 5400 1350 2    60   Output ~ 0
D2_R4
Text GLabel 5400 1450 2    60   Output ~ 0
D2_R5
Text GLabel 5400 1550 2    60   Output ~ 0
D2_R6
Text GLabel 5400 1650 2    60   Output ~ 0
D2_R7
Text GLabel 5400 1750 2    60   Output ~ 0
D2_R8
Wire Wire Line
	5350 1050 5400 1050
Wire Wire Line
	5350 1150 5400 1150
Wire Wire Line
	5350 1250 5400 1250
Wire Wire Line
	5350 1350 5400 1350
Wire Wire Line
	5350 1450 5400 1450
Wire Wire Line
	5350 1550 5400 1550
Wire Wire Line
	5350 1650 5400 1650
Wire Wire Line
	5350 1750 5400 1750
Text GLabel 2600 1950 2    60   Output ~ 0
D0_C1
Text GLabel 2600 2050 2    60   Output ~ 0
D0_C2
Text GLabel 2600 2150 2    60   Output ~ 0
D0_C3
Text GLabel 2600 2250 2    60   Output ~ 0
D0_C4
Text GLabel 2600 2350 2    60   Output ~ 0
D0_C5
Text GLabel 2600 2450 2    60   Output ~ 0
D0_C6
Text GLabel 2600 2550 2    60   Output ~ 0
D0_C7
Text GLabel 2600 2650 2    60   Output ~ 0
D0_C8
Text GLabel 2600 2750 2    60   Output ~ 0
D1_C1
Text GLabel 2600 2850 2    60   Output ~ 0
D1_C2
Text GLabel 2600 2950 2    60   Output ~ 0
D1_C3
Text GLabel 2600 3050 2    60   Output ~ 0
D1_C4
Text GLabel 2600 3150 2    60   Output ~ 0
D1_C5
Text GLabel 2600 3250 2    60   Output ~ 0
D1_C6
Text GLabel 2600 3350 2    60   Output ~ 0
D1_C7
Text GLabel 2600 3450 2    60   Output ~ 0
D1_C8
Wire Wire Line
	2550 1950 2600 1950
Wire Wire Line
	2550 2050 2600 2050
Wire Wire Line
	2550 2150 2600 2150
Wire Wire Line
	2550 2250 2600 2250
Wire Wire Line
	2550 2350 2600 2350
Wire Wire Line
	2550 2450 2600 2450
Wire Wire Line
	2550 2550 2600 2550
Wire Wire Line
	2550 2650 2600 2650
Wire Wire Line
	2550 2750 2600 2750
Wire Wire Line
	2550 2850 2600 2850
Wire Wire Line
	2550 2950 2600 2950
Wire Wire Line
	2550 3050 2600 3050
Wire Wire Line
	2550 3150 2600 3150
Wire Wire Line
	2550 3250 2600 3250
Wire Wire Line
	2550 3350 2600 3350
Wire Wire Line
	2550 3450 2600 3450
Text GLabel 5400 1950 2    60   Output ~ 0
D2_C1
Text GLabel 5400 2050 2    60   Output ~ 0
D2_C2
Text GLabel 5400 2150 2    60   Output ~ 0
D2_C3
Text GLabel 5400 2250 2    60   Output ~ 0
D2_C4
Text GLabel 5400 2350 2    60   Output ~ 0
D2_C5
Text GLabel 5400 2450 2    60   Output ~ 0
D2_C6
Text GLabel 5400 2550 2    60   Output ~ 0
D2_C7
Text GLabel 5400 2650 2    60   Output ~ 0
D2_C8
Wire Wire Line
	5350 1950 5400 1950
Wire Wire Line
	5350 2050 5400 2050
Wire Wire Line
	5350 2150 5400 2150
Wire Wire Line
	5350 2250 5400 2250
Wire Wire Line
	5350 2350 5400 2350
Wire Wire Line
	5350 2450 5400 2450
Wire Wire Line
	5350 2550 5400 2550
Wire Wire Line
	5350 2650 5400 2650
Text GLabel 10100 1100 1    60   Input ~ 0
D0_C1
Text GLabel 10200 1100 1    60   Input ~ 0
D0_C2
Text GLabel 10300 1100 1    60   Input ~ 0
D0_C3
Text GLabel 10400 1100 1    60   Input ~ 0
D0_C4
Text GLabel 10500 1100 1    60   Input ~ 0
D0_C5
Text GLabel 10600 1100 1    60   Input ~ 0
D0_C6
Text GLabel 10700 1100 1    60   Input ~ 0
D0_C7
Text GLabel 10800 1100 1    60   Input ~ 0
D0_C8
Text GLabel 10100 3000 1    60   Input ~ 0
D1_C1
Text GLabel 10200 3000 1    60   Input ~ 0
D1_C2
Text GLabel 10300 3000 1    60   Input ~ 0
D1_C3
Text GLabel 10400 3000 1    60   Input ~ 0
D1_C4
Text GLabel 10500 3000 1    60   Input ~ 0
D1_C5
Text GLabel 10600 3000 1    60   Input ~ 0
D1_C6
Text GLabel 10700 3000 1    60   Input ~ 0
D1_C7
Text GLabel 10800 3000 1    60   Input ~ 0
D1_C8
Text GLabel 10100 4900 1    60   Input ~ 0
D2_C1
Text GLabel 10200 4900 1    60   Input ~ 0
D2_C2
Text GLabel 10300 4900 1    60   Input ~ 0
D2_C3
Text GLabel 10400 4900 1    60   Input ~ 0
D2_C4
Text GLabel 10500 4900 1    60   Input ~ 0
D2_C5
Text GLabel 10600 4900 1    60   Input ~ 0
D2_C6
Text GLabel 10700 4900 1    60   Input ~ 0
D2_C7
Text GLabel 10800 4900 1    60   Input ~ 0
D2_C8
Wire Wire Line
	10100 1100 10100 1150
Wire Wire Line
	10200 1100 10200 1150
Wire Wire Line
	10300 1100 10300 1150
Wire Wire Line
	10400 1100 10400 1150
Wire Wire Line
	10500 1100 10500 1150
Wire Wire Line
	10600 1100 10600 1150
Wire Wire Line
	10700 1100 10700 1150
Wire Wire Line
	10800 1100 10800 1150
Wire Wire Line
	10100 3000 10100 3050
Wire Wire Line
	10200 3000 10200 3050
Wire Wire Line
	10300 3000 10300 3050
Wire Wire Line
	10400 3000 10400 3050
Wire Wire Line
	10500 3000 10500 3050
Wire Wire Line
	10600 3000 10600 3050
Wire Wire Line
	10700 3000 10700 3050
Wire Wire Line
	10800 3000 10800 3050
Wire Wire Line
	10100 4900 10100 4950
Wire Wire Line
	10200 4900 10200 4950
Wire Wire Line
	10300 4900 10300 4950
Wire Wire Line
	10400 4900 10400 4950
Wire Wire Line
	10500 4900 10500 4950
Wire Wire Line
	10600 4900 10600 4950
Wire Wire Line
	10700 4900 10700 4950
Wire Wire Line
	10800 4900 10800 4950
Text GLabel 9650 1550 0    60   Input ~ 0
D0_R1
Text GLabel 9650 1650 0    60   Input ~ 0
D0_R2
Text GLabel 9650 1750 0    60   Input ~ 0
D0_R3
Text GLabel 9650 1850 0    60   Input ~ 0
D0_R4
Text GLabel 9650 1950 0    60   Input ~ 0
D0_R5
Text GLabel 9650 2050 0    60   Input ~ 0
D0_R6
Text GLabel 9650 2150 0    60   Input ~ 0
D0_R7
Text GLabel 9650 2250 0    60   Input ~ 0
D0_R8
Text GLabel 9650 3450 0    60   Input ~ 0
D0_R1
Text GLabel 9650 3550 0    60   Input ~ 0
D0_R2
Text GLabel 9650 3650 0    60   Input ~ 0
D0_R3
Text GLabel 9650 3750 0    60   Input ~ 0
D0_R4
Text GLabel 9650 3850 0    60   Input ~ 0
D0_R5
Text GLabel 9650 3950 0    60   Input ~ 0
D0_R6
Text GLabel 9650 4050 0    60   Input ~ 0
D0_R7
Text GLabel 9650 4150 0    60   Input ~ 0
D0_R8
Text GLabel 9650 5350 0    60   Input ~ 0
D2_R1
Text GLabel 9650 5450 0    60   Input ~ 0
D2_R2
Text GLabel 9650 5550 0    60   Input ~ 0
D2_R3
Text GLabel 9650 5650 0    60   Input ~ 0
D2_R4
Text GLabel 9650 5750 0    60   Input ~ 0
D2_R5
Text GLabel 9650 5850 0    60   Input ~ 0
D2_R6
Text GLabel 9650 5950 0    60   Input ~ 0
D2_R7
Text GLabel 9650 6050 0    60   Input ~ 0
D2_R8
Wire Wire Line
	9650 1550 9700 1550
Wire Wire Line
	9650 1650 9700 1650
Wire Wire Line
	9650 1750 9700 1750
Wire Wire Line
	9650 1850 9700 1850
Wire Wire Line
	9650 1950 9700 1950
Wire Wire Line
	9650 2050 9700 2050
Wire Wire Line
	9650 2150 9700 2150
Wire Wire Line
	9650 2250 9700 2250
Wire Wire Line
	9650 3450 9700 3450
Wire Wire Line
	9650 3550 9700 3550
Wire Wire Line
	9650 3650 9700 3650
Wire Wire Line
	9650 3750 9700 3750
Wire Wire Line
	9650 3850 9700 3850
Wire Wire Line
	9650 3950 9700 3950
Wire Wire Line
	9650 4050 9700 4050
Wire Wire Line
	9650 4150 9700 4150
Wire Wire Line
	9650 5350 9700 5350
Wire Wire Line
	9650 5450 9700 5450
Wire Wire Line
	9650 5550 9700 5550
Wire Wire Line
	9650 5650 9700 5650
Wire Wire Line
	9650 5750 9700 5750
Wire Wire Line
	9650 5850 9700 5850
Wire Wire Line
	9650 5950 9700 5950
Wire Wire Line
	9650 6050 9700 6050
$Comp
L SG-636PCE U1
U 1 1 565A9830
P 1450 6950
F 0 "U1" H 1200 7250 60  0000 C CNN
F 1 "SG-636PCE" H 1750 6650 60  0000 C CNN
F 2 "miniclock:SG-636PCE" H 1450 6950 60  0001 C CNN
F 3 "" H 1450 6950 60  0000 C CNN
	1    1450 6950
	1    0    0    -1  
$EndComp
Text GLabel 1450 7500 3    60   Input ~ 0
GND
Text GLabel 1450 6400 1    60   Input ~ 0
+3V3
NoConn ~ 950  6950
Text GLabel 2000 6950 2    60   Output ~ 0
OSC
Wire Wire Line
	1950 6950 2000 6950
Text GLabel 1150 2250 0    60   Input ~ 0
OSC
Wire Wire Line
	1150 2250 1250 2250
Text GLabel 3950 2250 0    60   Input ~ 0
OSC
Wire Wire Line
	3950 2250 4050 2250
$Comp
L C_Small C1
U 1 1 565AA363
P 600 6950
F 0 "C1" H 610 7020 50  0000 L CNN
F 1 "0.1u" H 610 6870 50  0000 L CNN
F 2 "miniclock:0805" H 600 6950 60  0001 C CNN
F 3 "" H 600 6950 60  0000 C CNN
	1    600  6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 7500 1450 7400
Wire Wire Line
	1450 6500 1450 6400
Wire Wire Line
	1450 6450 600  6450
Wire Wire Line
	600  6450 600  6850
Connection ~ 1450 6450
Wire Wire Line
	600  7050 600  7450
Wire Wire Line
	600  7450 1450 7450
Connection ~ 1450 7450
NoConn ~ 5350 2750
NoConn ~ 5350 2850
NoConn ~ 5350 2950
NoConn ~ 5350 3050
NoConn ~ 5350 3150
NoConn ~ 5350 3250
NoConn ~ 5350 3350
NoConn ~ 5350 3450
NoConn ~ 5050 6850
NoConn ~ 5050 6950
NoConn ~ 5050 7050
NoConn ~ 5050 7150
NoConn ~ 5050 7250
NoConn ~ 5050 7350
NoConn ~ 5050 7450
NoConn ~ 5050 7550
Text Notes 1300 7650 2    60   ~ 0
Oscillator
Wire Notes Line
	1800 6550 6850 6550
Wire Notes Line
	2500 6550 2500 7700
Wire Notes Line
	1800 6550 1800 5900
Wire Notes Line
	1800 5900 600  5900
Wire Notes Line
	8750 550  8750 6500
Text Notes 8950 3900 1    60   ~ 0
LED Matrix Displays
$Comp
L C_Small C2
U 1 1 565ADFD6
P 1300 4450
F 0 "C2" H 1310 4520 50  0000 L CNN
F 1 "0.1u" H 1310 4370 50  0000 L CNN
F 2 "miniclock:0805" H 1300 4450 60  0001 C CNN
F 3 "" H 1300 4450 60  0000 C CNN
	1    1300 4450
	1    0    0    -1  
$EndComp
$Comp
L C_Small C3
U 1 1 565AE241
P 1600 4450
F 0 "C3" H 1610 4520 50  0000 L CNN
F 1 "0.1u" H 1610 4370 50  0000 L CNN
F 2 "miniclock:0805" H 1600 4450 60  0001 C CNN
F 3 "" H 1600 4450 60  0000 C CNN
	1    1600 4450
	1    0    0    -1  
$EndComp
$Comp
L C_Small C4
U 1 1 565AE29E
P 1900 4450
F 0 "C4" H 1910 4520 50  0000 L CNN
F 1 "0.1u" H 1910 4370 50  0000 L CNN
F 2 "miniclock:0805" H 1900 4450 60  0001 C CNN
F 3 "" H 1900 4450 60  0000 C CNN
	1    1900 4450
	1    0    0    -1  
$EndComp
$Comp
L C_Small C5
U 1 1 565AE2FC
P 2200 4450
F 0 "C5" H 2210 4520 50  0000 L CNN
F 1 "0.1u" H 2210 4370 50  0000 L CNN
F 2 "miniclock:0805" H 2200 4450 60  0001 C CNN
F 3 "" H 2200 4450 60  0000 C CNN
	1    2200 4450
	1    0    0    -1  
$EndComp
$Comp
L CP_Small C6
U 1 1 565AE51C
P 2500 4450
F 0 "C6" H 2510 4520 50  0000 L CNN
F 1 "47uF" H 2510 4370 50  0000 L CNN
F 2 "miniclock:UWX1V470MCL1GB" H 2500 4450 60  0001 C CNN
F 3 "" H 2500 4450 60  0000 C CNN
	1    2500 4450
	1    0    0    -1  
$EndComp
Text GLabel 1900 4200 1    60   Input ~ 0
+3V3
Wire Wire Line
	1900 4200 1900 4350
Wire Wire Line
	1300 4250 2500 4250
Wire Wire Line
	2500 4250 2500 4350
Connection ~ 1900 4250
Wire Wire Line
	1300 4350 1300 4250
Wire Wire Line
	1600 4350 1600 4250
Connection ~ 1600 4250
Wire Wire Line
	2200 4350 2200 4250
Connection ~ 2200 4250
Text GLabel 1900 4700 3    60   Input ~ 0
GND
Wire Wire Line
	1900 4700 1900 4550
Wire Wire Line
	1300 4650 2500 4650
Wire Wire Line
	2500 4650 2500 4550
Connection ~ 1900 4650
Wire Wire Line
	1300 4650 1300 4550
Wire Wire Line
	1600 4550 1600 4650
Connection ~ 1600 4650
Wire Wire Line
	2200 4550 2200 4650
Connection ~ 2200 4650
$Comp
L C_Small C7
U 1 1 565AFB6D
P 4100 4450
F 0 "C7" H 4110 4520 50  0000 L CNN
F 1 "0.1u" H 4110 4370 50  0000 L CNN
F 2 "miniclock:0805" H 4100 4450 60  0001 C CNN
F 3 "" H 4100 4450 60  0000 C CNN
	1    4100 4450
	1    0    0    -1  
$EndComp
$Comp
L C_Small C8
U 1 1 565AFB73
P 4400 4450
F 0 "C8" H 4410 4520 50  0000 L CNN
F 1 "0.1u" H 4410 4370 50  0000 L CNN
F 2 "miniclock:0805" H 4400 4450 60  0001 C CNN
F 3 "" H 4400 4450 60  0000 C CNN
	1    4400 4450
	1    0    0    -1  
$EndComp
$Comp
L C_Small C9
U 1 1 565AFB79
P 4700 4450
F 0 "C9" H 4710 4520 50  0000 L CNN
F 1 "0.1u" H 4710 4370 50  0000 L CNN
F 2 "miniclock:0805" H 4700 4450 60  0001 C CNN
F 3 "" H 4700 4450 60  0000 C CNN
	1    4700 4450
	1    0    0    -1  
$EndComp
$Comp
L C_Small C10
U 1 1 565AFB7F
P 5000 4450
F 0 "C10" H 5010 4520 50  0000 L CNN
F 1 "0.1u" H 5010 4370 50  0000 L CNN
F 2 "miniclock:0805" H 5000 4450 60  0001 C CNN
F 3 "" H 5000 4450 60  0000 C CNN
	1    5000 4450
	1    0    0    -1  
$EndComp
$Comp
L CP_Small C11
U 1 1 565AFB85
P 5300 4450
F 0 "C11" H 5310 4520 50  0000 L CNN
F 1 "47uF" H 5310 4370 50  0000 L CNN
F 2 "miniclock:UWX1V470MCL1GB" H 5300 4450 60  0001 C CNN
F 3 "" H 5300 4450 60  0000 C CNN
	1    5300 4450
	1    0    0    -1  
$EndComp
Text GLabel 4700 4200 1    60   Input ~ 0
+3V3
Wire Wire Line
	4700 4200 4700 4350
Wire Wire Line
	4100 4250 5300 4250
Wire Wire Line
	5300 4250 5300 4350
Connection ~ 4700 4250
Wire Wire Line
	4100 4350 4100 4250
Wire Wire Line
	4400 4350 4400 4250
Connection ~ 4400 4250
Wire Wire Line
	5000 4350 5000 4250
Connection ~ 5000 4250
Text GLabel 4700 4700 3    60   Input ~ 0
GND
Wire Wire Line
	4700 4700 4700 4550
Wire Wire Line
	4100 4650 5300 4650
Wire Wire Line
	5300 4650 5300 4550
Connection ~ 4700 4650
Wire Wire Line
	4100 4650 4100 4550
Wire Wire Line
	4400 4550 4400 4650
Connection ~ 4400 4650
Wire Wire Line
	5000 4550 5000 4650
Connection ~ 5000 4650
Text Notes 2950 3950 0    60   ~ 0
Display Drivers
Wire Notes Line
	600  5100 5900 5100
Wire Notes Line
	5900 5100 5900 600 
Wire Wire Line
	4250 6850 4200 6850
$Comp
L TESTPOINT TP1
U 1 1 565A7F3D
P 3750 6950
F 0 "TP1" H 3750 6900 20  0000 C BNN
F 1 "TESTPOINT" H 3800 6950 20  0001 L CNN
F 2 "miniclock:TESTPOINT" H 3750 6950 60  0001 C CNN
F 3 "" H 3750 6950 60  0000 C CNN
	1    3750 6950
	1    0    0    -1  
$EndComp
$Comp
L TESTPOINT TP2
U 1 1 565A81B2
P 3750 7050
F 0 "TP2" H 3750 7000 20  0000 C BNN
F 1 "TESTPOINT" H 3800 7050 20  0001 L CNN
F 2 "miniclock:TESTPOINT" H 3750 7050 60  0001 C CNN
F 3 "" H 3750 7050 60  0000 C CNN
	1    3750 7050
	1    0    0    -1  
$EndComp
$Comp
L TESTPOINT TP3
U 1 1 565A820D
P 3750 7250
F 0 "TP3" H 3750 7200 20  0000 C BNN
F 1 "TESTPOINT" H 3800 7250 20  0001 L CNN
F 2 "miniclock:TESTPOINT" H 3750 7250 60  0001 C CNN
F 3 "" H 3750 7250 60  0000 C CNN
	1    3750 7250
	1    0    0    -1  
$EndComp
$Comp
L TESTPOINT TP4
U 1 1 565A8275
P 3750 7350
F 0 "TP4" H 3750 7300 20  0000 C BNN
F 1 "TESTPOINT" H 3800 7350 20  0001 L CNN
F 2 "miniclock:TESTPOINT" H 3750 7350 60  0001 C CNN
F 3 "" H 3750 7350 60  0000 C CNN
	1    3750 7350
	1    0    0    -1  
$EndComp
$Comp
L TESTPOINT TP5
U 1 1 565A82D6
P 3750 7450
F 0 "TP5" H 3750 7400 20  0000 C BNN
F 1 "TESTPOINT" H 3800 7450 20  0001 L CNN
F 2 "miniclock:TESTPOINT" H 3750 7450 60  0001 C CNN
F 3 "" H 3750 7450 60  0000 C CNN
	1    3750 7450
	1    0    0    -1  
$EndComp
$Comp
L TESTPOINT TP6
U 1 1 565A833A
P 3750 7550
F 0 "TP6" H 3750 7500 20  0000 C BNN
F 1 "TESTPOINT" H 3800 7550 20  0001 L CNN
F 2 "miniclock:TESTPOINT" H 3750 7550 60  0001 C CNN
F 3 "" H 3750 7550 60  0000 C CNN
	1    3750 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 6950 4250 6950
Wire Wire Line
	3650 7050 4250 7050
Wire Wire Line
	3650 7250 4250 7250
Wire Wire Line
	3650 7350 4250 7350
Wire Wire Line
	3650 7450 4250 7450
Wire Wire Line
	3650 7550 4250 7550
Connection ~ 3750 6950
Connection ~ 3750 7050
Connection ~ 3750 7250
Connection ~ 3750 7350
Connection ~ 3750 7450
Connection ~ 3750 7550
$EndSCHEMATC
