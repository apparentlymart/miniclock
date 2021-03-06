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
LIBS:mainboard-cache
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
L LD1117 VR1
U 1 1 55EE4AB2
P 9750 900
F 0 "VR1" H 9600 1050 60  0000 C CNN
F 1 "LD1117" H 9950 500 60  0000 C CNN
F 2 "miniclock:SOT223" H 9750 900 60  0001 C CNN
F 3 "" H 9750 900 60  0000 C CNN
	1    9750 900 
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X06 P1
U 1 1 55EE4BEF
P 1800 1100
F 0 "P1" H 1800 1450 50  0000 C CNN
F 1 "CONN_01X06" V 1900 1100 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06" H 1800 1100 60  0001 C CNN
F 3 "" H 1800 1100 60  0000 C CNN
	1    1800 1100
	1    0    0    -1  
$EndComp
Text GLabel 1550 850  0    60   Input ~ 0
GND
Text GLabel 1550 950  0    60   Input ~ 0
CTS
Text GLabel 1550 1050 0    60   Input ~ 0
+5V
Text GLabel 1550 1150 0    60   Input ~ 0
RXD
Text GLabel 1550 1250 0    60   Input ~ 0
TXD
Text GLabel 1550 1350 0    60   Input ~ 0
RTS
Wire Wire Line
	1550 850  1600 850 
Wire Wire Line
	1550 950  1600 950 
Wire Wire Line
	1550 1050 1600 1050
Wire Wire Line
	1550 1150 1600 1150
Wire Wire Line
	1550 1250 1600 1250
Wire Wire Line
	1550 1350 1600 1350
Text GLabel 9000 850  0    60   Input ~ 0
+5V
Text GLabel 10500 850  2    60   Output ~ 0
+3V3
Text GLabel 9750 1550 3    60   Input ~ 0
GND
Text Notes 2000 1200 0    60   ~ 0
FTDI-style\nConnector
$Comp
L C C2
U 1 1 55EE4DF1
P 9150 1150
F 0 "C2" H 9175 1250 50  0000 L CNN
F 1 "C" H 9175 1050 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 9188 1000 30  0001 C CNN
F 3 "" H 9150 1150 60  0000 C CNN
	1    9150 1150
	1    0    0    -1  
$EndComp
$Comp
L CP C3
U 1 1 55EE4E12
P 10350 1150
F 0 "C3" H 10375 1250 50  0000 L CNN
F 1 "CP" H 10375 1050 50  0000 L CNN
F 2 "miniclock:CPOL_SMD_6.3mm" H 10388 1000 30  0001 C CNN
F 3 "" H 10350 1150 60  0000 C CNN
	1    10350 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 1450 9750 1550
Wire Wire Line
	10200 850  10500 850 
Wire Wire Line
	10200 950  10250 950 
Wire Wire Line
	10250 950  10250 850 
Connection ~ 10250 850 
Wire Wire Line
	9000 850  9300 850 
Wire Wire Line
	10350 850  10350 1000
Connection ~ 10350 850 
Wire Wire Line
	10350 1500 10350 1300
Wire Wire Line
	9150 1500 10350 1500
Connection ~ 9750 1500
Wire Wire Line
	9150 850  9150 1000
Connection ~ 9150 850 
Wire Wire Line
	9150 1300 9150 1500
$Comp
L LPC812 U1
U 1 1 55EE5334
P 1900 2850
F 0 "U1" H 1500 3450 60  0000 C CNN
F 1 "LPC812" H 2200 2200 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-20_7.5x12.8mm_Pitch1.27mm" H 1650 3100 60  0001 C CNN
F 3 "" H 1650 3100 60  0000 C CNN
	1    1900 2850
	1    0    0    -1  
$EndComp
Text GLabel 2600 2900 2    60   Input ~ 0
+3V3
Wire Wire Line
	2550 2900 2600 2900
Text GLabel 2600 2800 2    60   Input ~ 0
GND
Wire Wire Line
	2550 2800 2600 2800
Text GLabel 2600 2500 2    60   Input ~ 0
RXD
Text GLabel 1200 2800 0    60   Input ~ 0
TXD
Text GLabel 1200 2700 0    60   Input ~ 0
~RESET
Text GLabel 1200 2600 0    60   Input ~ 0
~ISP
$Comp
L DS3231M U2
U 1 1 55EE568F
P 5000 1500
F 0 "U2" H 4700 1800 60  0000 C CNN
F 1 "DS3231M" H 5150 1200 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 4950 1450 60  0001 C CNN
F 3 "" H 4950 1450 60  0000 C CNN
	1    5000 1500
	1    0    0    -1  
$EndComp
Text GLabel 4400 1450 0    60   Input ~ 0
+3V3
Text GLabel 5650 1650 2    60   Input ~ 0
GND
Wire Wire Line
	4400 1450 4450 1450
Wire Wire Line
	5550 1650 5650 1650
Wire Wire Line
	5550 1550 5600 1550
Wire Wire Line
	5600 1550 5600 1650
Connection ~ 5600 1650
$Comp
L C C4
U 1 1 55EE5833
P 5050 2150
F 0 "C4" H 5075 2250 50  0000 L CNN
F 1 "C" H 5075 2050 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5088 2000 30  0001 C CNN
F 3 "" H 5050 2150 60  0000 C CNN
	1    5050 2150
	0    1    1    0   
$EndComp
Text GLabel 4850 2150 0    60   Input ~ 0
+3V3
Text GLabel 5250 2150 2    60   Input ~ 0
GND
Wire Wire Line
	4850 2150 4900 2150
Wire Wire Line
	5200 2150 5250 2150
Text GLabel 4400 1650 0    60   Input ~ 0
~RESET
Wire Wire Line
	4400 1650 4450 1650
Text GLabel 5850 1450 2    60   Input ~ 0
SDA
Text GLabel 5850 1350 2    60   Input ~ 0
SCL
Wire Wire Line
	5550 1450 5850 1450
Wire Wire Line
	5550 1350 5850 1350
$Comp
L R R3
U 1 1 55EE5A7A
P 5600 1100
F 0 "R3" V 5680 1100 50  0000 C CNN
F 1 "R" V 5600 1100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5530 1100 30  0001 C CNN
F 3 "" H 5600 1100 30  0000 C CNN
	1    5600 1100
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 55EE5AA1
P 5800 1100
F 0 "R4" V 5880 1100 50  0000 C CNN
F 1 "R" V 5800 1100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5730 1100 30  0001 C CNN
F 3 "" H 5800 1100 30  0000 C CNN
	1    5800 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 1350 5600 1250
Connection ~ 5600 1350
Wire Wire Line
	5800 1450 5800 1250
Connection ~ 5800 1450
Text GLabel 5700 850  1    60   Input ~ 0
+3V3
Wire Wire Line
	5800 900  5800 950 
Wire Wire Line
	5600 900  5800 900 
Wire Wire Line
	5700 900  5700 850 
Wire Wire Line
	5600 950  5600 900 
Connection ~ 5700 900 
Text GLabel 3850 1550 0    60   Input ~ 0
SQW
$Comp
L R R1
U 1 1 55EE5C80
P 3950 1300
F 0 "R1" V 4030 1300 50  0000 C CNN
F 1 "R" V 3950 1300 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3880 1300 30  0001 C CNN
F 3 "" H 3950 1300 30  0000 C CNN
	1    3950 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 1550 3850 1550
Wire Wire Line
	3950 1450 3950 1550
Connection ~ 3950 1550
Text GLabel 3950 1100 1    60   Input ~ 0
+3V3
Wire Wire Line
	1200 2800 1250 2800
Wire Wire Line
	1200 2700 1250 2700
Wire Wire Line
	1200 2600 1250 2600
Wire Wire Line
	2550 2500 2600 2500
Text GLabel 1200 3200 0    60   Input ~ 0
SDA
Text GLabel 1200 3100 0    60   Input ~ 0
SCL
Wire Wire Line
	1200 3100 1250 3100
Wire Wire Line
	1200 3200 1250 3200
Text GLabel 2600 3000 2    60   Input ~ 0
SCLK
Text GLabel 2600 3100 2    60   Input ~ 0
MOSI
Text GLabel 2600 3200 2    60   Input ~ 0
MISO
Text GLabel 2600 3300 2    60   Input ~ 0
SSEL
Wire Wire Line
	2550 3000 2600 3000
Wire Wire Line
	2550 3100 2600 3100
Wire Wire Line
	2550 3200 2600 3200
Wire Wire Line
	2550 3300 2600 3300
Text GLabel 1200 3300 0    60   Input ~ 0
SQW
Wire Wire Line
	1200 3300 1250 3300
Text GLabel 1200 2400 0    60   Input ~ 0
~UP
Text GLabel 1200 2500 0    60   Input ~ 0
~DOWN
Text GLabel 1200 2900 0    60   Input ~ 0
~LEFT
Text GLabel 1200 3000 0    60   Input ~ 0
~RIGHT
Wire Wire Line
	1200 2400 1250 2400
Wire Wire Line
	1200 2500 1250 2500
Wire Wire Line
	1200 2900 1250 2900
Wire Wire Line
	1200 3000 1250 3000
$Comp
L C C1
U 1 1 55EE7639
P 1900 3800
F 0 "C1" H 1925 3900 50  0000 L CNN
F 1 "C" H 1925 3700 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1938 3650 30  0001 C CNN
F 3 "" H 1900 3800 60  0000 C CNN
	1    1900 3800
	0    1    1    0   
$EndComp
Text GLabel 1700 3800 0    60   Input ~ 0
+3V3
Text GLabel 2100 3800 2    60   Input ~ 0
GND
Wire Wire Line
	1700 3800 1750 3800
Wire Wire Line
	2050 3800 2100 3800
Wire Wire Line
	3950 1100 3950 1150
Text Notes 1600 4250 0    60   ~ 0
Microcontroller
Text Notes 4700 2650 0    60   ~ 0
Real-time Clock
Text Notes 9350 1950 0    60   ~ 0
Voltage Regulator
Wire Notes Line
	8450 600  8450 5300
Wire Notes Line
	8450 2200 11100 2200
Wire Notes Line
	650  2000 3400 2000
Wire Notes Line
	3050 2000 3050 600 
Wire Notes Line
	3400 2000 3400 4400
Wire Notes Line
	6800 4400 650  4400
Wire Notes Line
	3400 2900 6800 2900
Wire Notes Line
	6800 600  6800 4400
Text Notes 1050 1700 0    60   ~ 0
Power/Programming Connector
$Comp
L CONN_01X08 P2
U 1 1 55EE8B80
P 4650 3500
F 0 "P2" H 4650 3950 50  0000 C CNN
F 1 "CONN_01X08" V 4750 3500 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08" H 4650 3500 60  0001 C CNN
F 3 "" H 4650 3500 60  0000 C CNN
	1    4650 3500
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X08 P3
U 1 1 55EE8C35
P 5450 3500
F 0 "P3" H 5450 3950 50  0000 C CNN
F 1 "CONN_01X08" V 5550 3500 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08" H 5450 3500 60  0001 C CNN
F 3 "" H 5450 3500 60  0000 C CNN
	1    5450 3500
	1    0    0    -1  
$EndComp
Text Notes 5700 3600 0    60   ~ 0
Mechanical\nconnection\nonly
Text GLabel 4400 3250 0    60   Input ~ 0
GND
Text GLabel 4400 3350 0    60   Input ~ 0
+3V3
Text GLabel 4400 3450 0    60   Input ~ 0
+3V3
Text GLabel 4400 3550 0    60   Input ~ 0
SCLK
Text GLabel 4400 3650 0    60   Input ~ 0
MOSI
Text GLabel 4400 3750 0    60   Input ~ 0
MISO
Text GLabel 4400 3850 0    60   Input ~ 0
SSEL
Text GLabel 4400 3150 0    60   Input ~ 0
~RESET
Wire Wire Line
	4400 3150 4450 3150
Wire Wire Line
	4400 3250 4450 3250
Wire Wire Line
	4400 3350 4450 3350
Wire Wire Line
	4400 3450 4450 3450
Wire Wire Line
	4400 3550 4450 3550
Wire Wire Line
	4400 3650 4450 3650
Wire Wire Line
	4400 3750 4450 3750
Wire Wire Line
	4400 3850 4450 3850
Text Notes 4450 4250 0    60   ~ 0
Display Board Interconnect
$Comp
L SW_PUSH SW1
U 1 1 55EE94AA
P 9650 2700
F 0 "SW1" H 9800 2810 50  0000 C CNN
F 1 "SW_PUSH" H 9650 2620 50  0000 C CNN
F 2 "miniclock:PUSHSWITCH" H 9650 2700 60  0001 C CNN
F 3 "" H 9650 2700 60  0000 C CNN
	1    9650 2700
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 55EE97D3
P 10150 2700
F 0 "R2" V 10230 2700 50  0000 C CNN
F 1 "R" V 10150 2700 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 10080 2700 30  0001 C CNN
F 3 "" H 10150 2700 30  0000 C CNN
	1    10150 2700
	0    1    1    0   
$EndComp
Text GLabel 10350 2700 2    60   Input ~ 0
GND
Text GLabel 9300 2700 0    60   Input ~ 0
~UP
Wire Wire Line
	9300 2700 9350 2700
Wire Wire Line
	9950 2700 10000 2700
Wire Wire Line
	10300 2700 10350 2700
$Comp
L SW_PUSH SW2
U 1 1 55EE9ABA
P 9650 3100
F 0 "SW2" H 9800 3210 50  0000 C CNN
F 1 "SW_PUSH" H 9650 3020 50  0000 C CNN
F 2 "miniclock:PUSHSWITCH" H 9650 3100 60  0001 C CNN
F 3 "" H 9650 3100 60  0000 C CNN
	1    9650 3100
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 55EE9AC0
P 10150 3100
F 0 "R5" V 10230 3100 50  0000 C CNN
F 1 "R" V 10150 3100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 10080 3100 30  0001 C CNN
F 3 "" H 10150 3100 30  0000 C CNN
	1    10150 3100
	0    1    1    0   
$EndComp
Text GLabel 10350 3100 2    60   Input ~ 0
GND
Text GLabel 9300 3100 0    60   Input ~ 0
~DOWN
Wire Wire Line
	9300 3100 9350 3100
Wire Wire Line
	9950 3100 10000 3100
Wire Wire Line
	10300 3100 10350 3100
$Comp
L SW_PUSH SW3
U 1 1 55EE9C09
P 9650 3500
F 0 "SW3" H 9800 3610 50  0000 C CNN
F 1 "SW_PUSH" H 9650 3420 50  0000 C CNN
F 2 "miniclock:PUSHSWITCH" H 9650 3500 60  0001 C CNN
F 3 "" H 9650 3500 60  0000 C CNN
	1    9650 3500
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 55EE9C0F
P 10150 3500
F 0 "R6" V 10230 3500 50  0000 C CNN
F 1 "R" V 10150 3500 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 10080 3500 30  0001 C CNN
F 3 "" H 10150 3500 30  0000 C CNN
	1    10150 3500
	0    1    1    0   
$EndComp
Text GLabel 10350 3500 2    60   Input ~ 0
GND
Text GLabel 9300 3500 0    60   Input ~ 0
~LEFT
Wire Wire Line
	9300 3500 9350 3500
Wire Wire Line
	9950 3500 10000 3500
Wire Wire Line
	10300 3500 10350 3500
$Comp
L SW_PUSH SW4
U 1 1 55EE9C1A
P 9650 3900
F 0 "SW4" H 9800 4010 50  0000 C CNN
F 1 "SW_PUSH" H 9650 3820 50  0000 C CNN
F 2 "miniclock:PUSHSWITCH" H 9650 3900 60  0001 C CNN
F 3 "" H 9650 3900 60  0000 C CNN
	1    9650 3900
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 55EE9C20
P 10150 3900
F 0 "R7" V 10230 3900 50  0000 C CNN
F 1 "R" V 10150 3900 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 10080 3900 30  0001 C CNN
F 3 "" H 10150 3900 30  0000 C CNN
	1    10150 3900
	0    1    1    0   
$EndComp
Text GLabel 10350 3900 2    60   Input ~ 0
GND
Text GLabel 9300 3900 0    60   Input ~ 0
~RIGHT
Wire Wire Line
	9300 3900 9350 3900
Wire Wire Line
	9950 3900 10000 3900
Wire Wire Line
	10300 3900 10350 3900
$Comp
L SW_PUSH SW5
U 1 1 55EE9D9C
P 9650 4300
F 0 "SW5" H 9800 4410 50  0000 C CNN
F 1 "SW_PUSH" H 9650 4220 50  0000 C CNN
F 2 "miniclock:PUSHSWITCH" H 9650 4300 60  0001 C CNN
F 3 "" H 9650 4300 60  0000 C CNN
	1    9650 4300
	1    0    0    -1  
$EndComp
$Comp
L R R8
U 1 1 55EE9DA2
P 10150 4300
F 0 "R8" V 10230 4300 50  0000 C CNN
F 1 "R" V 10150 4300 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 10080 4300 30  0001 C CNN
F 3 "" H 10150 4300 30  0000 C CNN
	1    10150 4300
	0    1    1    0   
$EndComp
Text GLabel 10350 4300 2    60   Input ~ 0
GND
Text GLabel 9300 4300 0    60   Input ~ 0
~RESET
Wire Wire Line
	9300 4300 9350 4300
Wire Wire Line
	9950 4300 10000 4300
Wire Wire Line
	10300 4300 10350 4300
$Comp
L SW_PUSH SW6
U 1 1 55EE9DAD
P 9650 4700
F 0 "SW6" H 9800 4810 50  0000 C CNN
F 1 "SW_PUSH" H 9650 4620 50  0000 C CNN
F 2 "miniclock:PUSHSWITCH" H 9650 4700 60  0001 C CNN
F 3 "" H 9650 4700 60  0000 C CNN
	1    9650 4700
	1    0    0    -1  
$EndComp
$Comp
L R R9
U 1 1 55EE9DB3
P 10150 4700
F 0 "R9" V 10230 4700 50  0000 C CNN
F 1 "R" V 10150 4700 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 10080 4700 30  0001 C CNN
F 3 "" H 10150 4700 30  0000 C CNN
	1    10150 4700
	0    1    1    0   
$EndComp
Text GLabel 10350 4700 2    60   Input ~ 0
GND
Text GLabel 9300 4700 0    60   Input ~ 0
~ISP
Wire Wire Line
	9300 4700 9350 4700
Wire Wire Line
	9950 4700 10000 4700
Wire Wire Line
	10300 4700 10350 4700
Text Notes 9650 5050 0    60   ~ 0
Push Buttons
Wire Notes Line
	8450 5300 11100 5300
$EndSCHEMATC
