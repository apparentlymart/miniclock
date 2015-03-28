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
L CONN_6 P2
U 1 1 5515D564
P 3100 5850
F 0 "P2" V 3050 5850 60  0000 C CNN
F 1 "CONN_6" V 3150 5850 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x06" H 3100 5850 60  0001 C CNN
F 3 "" H 3100 5850 60  0000 C CNN
	1    3100 5850
	1    0    0    -1  
$EndComp
Text Label 2700 5600 2    60   ~ 0
GND
Text Label 2700 5700 2    60   ~ 0
CTS
Text Label 2700 5800 2    60   ~ 0
+5V
Text Label 2700 5900 2    60   ~ 0
TXD
Text Label 2700 6000 2    60   ~ 0
RXD
Text Label 2700 6100 2    60   ~ 0
RTS
Wire Wire Line
	2700 5600 2750 5600
Wire Wire Line
	2700 5700 2750 5700
Wire Wire Line
	2700 5800 2750 5800
Wire Wire Line
	2700 5900 2750 5900
Wire Wire Line
	2700 6000 2750 6000
Wire Wire Line
	2700 6100 2750 6100
Text Notes 3200 6350 2    60   ~ 0
Programming\nHeader
$Comp
L LD1117 U1
U 1 1 5515DB1A
P 3450 1950
F 0 "U1" H 3600 1754 60  0000 C CNN
F 1 "LD1117" H 3450 2150 60  0000 C CNN
F 2 "MiniClock:SOT-223" H 3450 1950 60  0001 C CNN
F 3 "" H 3450 1950 60  0000 C CNN
	1    3450 1950
	1    0    0    -1  
$EndComp
Text Label 2750 1900 2    60   ~ 0
+5V
Text Label 4100 1900 0    60   ~ 0
+3V3
Text Label 3450 2500 3    60   ~ 0
GND
Wire Wire Line
	3850 1900 4100 1900
Wire Wire Line
	2750 1900 3050 1900
$Comp
L CP1 C2
U 1 1 5515DEE1
P 4000 2150
F 0 "C2" H 4050 2250 50  0000 L CNN
F 1 "10uF" H 4050 2050 50  0000 L CNN
F 2 "MiniClock:Nichicon_PolCap_6.3" H 4000 2150 60  0001 C CNN
F 3 "" H 4000 2150 60  0000 C CNN
	1    4000 2150
	1    0    0    -1  
$EndComp
$Comp
L CP1 C1
U 1 1 5515DF01
P 2900 2150
F 0 "C1" H 2950 2250 50  0000 L CNN
F 1 "10uF" H 2950 2050 50  0000 L CNN
F 2 "MiniClock:Nichicon_PolCap_6.3" H 2900 2150 60  0001 C CNN
F 3 "" H 2900 2150 60  0000 C CNN
	1    2900 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 1950 2900 1900
Connection ~ 2900 1900
Wire Wire Line
	4000 1800 4000 1950
Connection ~ 4000 1900
Wire Wire Line
	4000 2400 4000 2350
Wire Wire Line
	2900 2400 4000 2400
Connection ~ 3450 2400
Wire Wire Line
	2900 2350 2900 2400
Wire Wire Line
	3450 2200 3450 2500
Text Notes 3600 2650 0    60   ~ 0
Voltage\nRegulator
$Comp
L LPC812M101JD20 U3
U 1 1 5515E50B
P 8200 4800
F 0 "U3" H 7900 5350 60  0000 C CNN
F 1 "LPC812M101JD20" H 8200 4250 60  0000 C CNN
F 2 "SOIC_Packages:SOIC-20_7.5x12.8mm_Pitch1.27mm" H 8200 5000 60  0001 C CNN
F 3 "" H 8200 5000 60  0000 C CNN
	1    8200 4800
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 5515E5DD
P 9450 4800
F 0 "C4" H 9450 4900 40  0000 L CNN
F 1 "0.1uF" H 9456 4715 40  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 9488 4650 30  0001 C CNN
F 3 "" H 9450 4800 60  0000 C CNN
	1    9450 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 4750 9250 4750
Wire Wire Line
	9250 4750 9250 4550
Wire Wire Line
	9250 4550 9450 4550
Connection ~ 9450 4550
Wire Wire Line
	8650 4850 9250 4850
Wire Wire Line
	9250 4850 9250 5050
Wire Wire Line
	9250 5050 9450 5050
Connection ~ 9450 5050
Text Label 7700 4750 2    60   ~ 0
RXD
Text Label 8700 4450 0    60   ~ 0
TXD
$Comp
L SW_PUSH SW1
U 1 1 5516EC1F
P 6950 4250
F 0 "SW1" H 7100 4360 50  0000 C CNN
F 1 "SW_PUSH" H 6950 4170 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 6950 4250 60  0001 C CNN
F 3 "" H 6950 4250 60  0000 C CNN
	1    6950 4250
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SW2
U 1 1 5516EC4F
P 6950 4650
F 0 "SW2" H 7100 4760 50  0000 C CNN
F 1 "SW_PUSH" H 6950 4570 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 6950 4650 60  0001 C CNN
F 3 "" H 6950 4650 60  0000 C CNN
	1    6950 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 4550 7400 4550
Wire Wire Line
	7400 4550 7400 4250
Wire Wire Line
	7400 4250 7250 4250
Wire Wire Line
	7250 4650 7750 4650
Wire Wire Line
	6600 4250 6600 4750
Wire Wire Line
	6600 4250 6650 4250
Text Label 7700 5050 2    60   ~ 0
SCL
Text Label 7700 5150 2    60   ~ 0
SDA
Text Label 8700 5150 0    60   ~ 0
SCLK
Text Label 8700 4950 0    60   ~ 0
MOSI
Text Label 8700 5050 0    60   ~ 0
MISO
Text Label 8700 5250 0    60   ~ 0
SSEL
Wire Wire Line
	8650 4450 8700 4450
Wire Wire Line
	7700 4750 7750 4750
Wire Wire Line
	7700 5050 7750 5050
Wire Wire Line
	7700 5150 7750 5150
$Comp
L GND #PWR01
U 1 1 5516F441
P 3150 2500
F 0 "#PWR01" H 3150 2500 30  0001 C CNN
F 1 "GND" H 3150 2430 30  0001 C CNN
F 2 "" H 3150 2500 60  0000 C CNN
F 3 "" H 3150 2500 60  0000 C CNN
	1    3150 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 2400 3150 2500
Connection ~ 3150 2400
$Comp
L VCC #PWR02
U 1 1 5516F505
P 4000 1800
F 0 "#PWR02" H 4000 1900 30  0001 C CNN
F 1 "VCC" H 4000 1900 30  0000 C CNN
F 2 "" H 4000 1800 60  0000 C CNN
F 3 "" H 4000 1800 60  0000 C CNN
	1    4000 1800
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR03
U 1 1 5516F5B2
P 9450 5100
F 0 "#PWR03" H 9450 5200 30  0001 C CNN
F 1 "VCC" H 9450 5200 30  0000 C CNN
F 2 "" H 9450 5100 60  0000 C CNN
F 3 "" H 9450 5100 60  0000 C CNN
	1    9450 5100
	-1   0    0    1   
$EndComp
Wire Wire Line
	9450 5000 9450 5100
$Comp
L GND #PWR04
U 1 1 5516F6A7
P 9450 4500
F 0 "#PWR04" H 9450 4500 30  0001 C CNN
F 1 "GND" H 9450 4430 30  0001 C CNN
F 2 "" H 9450 4500 60  0000 C CNN
F 3 "" H 9450 4500 60  0000 C CNN
	1    9450 4500
	-1   0    0    1   
$EndComp
Wire Wire Line
	9450 4500 9450 4600
Text Notes 7100 5050 2    60   ~ 0
Controller
Wire Wire Line
	6600 4650 6650 4650
Connection ~ 6600 4650
$Comp
L DS3231M U2
U 1 1 5517067C
P 7500 2100
F 0 "U2" H 7150 2400 60  0000 C CNN
F 1 "DS3231M" H 7700 1800 60  0000 C CNN
F 2 "SOIC_Packages:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 7500 2050 60  0001 C CNN
F 3 "" H 7500 2050 60  0000 C CNN
	1    7500 2100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 55170758
P 8150 2350
F 0 "#PWR05" H 8150 2350 30  0001 C CNN
F 1 "GND" H 8150 2280 30  0001 C CNN
F 2 "" H 8150 2350 60  0000 C CNN
F 3 "" H 8150 2350 60  0000 C CNN
	1    8150 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 2250 8150 2250
Wire Wire Line
	8150 2150 8150 2350
Wire Wire Line
	8100 2150 8150 2150
Connection ~ 8150 2250
$Comp
L VCC #PWR06
U 1 1 55170815
P 6650 1850
F 0 "#PWR06" H 6650 1950 30  0001 C CNN
F 1 "VCC" H 6650 1950 30  0000 C CNN
F 2 "" H 6650 1850 60  0000 C CNN
F 3 "" H 6650 1850 60  0000 C CNN
	1    6650 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 2050 6650 2050
Wire Wire Line
	6650 1850 6650 2100
$Comp
L VCC #PWR07
U 1 1 5517086E
P 8650 1850
F 0 "#PWR07" H 8650 1950 30  0001 C CNN
F 1 "VCC" H 8650 1950 30  0000 C CNN
F 2 "" H 8650 1850 60  0000 C CNN
F 3 "" H 8650 1850 60  0000 C CNN
	1    8650 1850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 5517088B
P 8650 2350
F 0 "#PWR08" H 8650 2350 30  0001 C CNN
F 1 "GND" H 8650 2280 30  0001 C CNN
F 2 "" H 8650 2350 60  0000 C CNN
F 3 "" H 8650 2350 60  0000 C CNN
	1    8650 2350
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 551708E7
P 8650 2100
F 0 "C3" H 8650 2200 40  0000 L CNN
F 1 "0.1uF" H 8656 2015 40  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 8688 1950 30  0001 C CNN
F 3 "" H 8650 2100 60  0000 C CNN
	1    8650 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 1850 8650 1900
Wire Wire Line
	8650 2300 8650 2350
Text Label 7700 4450 2    60   ~ 0
1HZ
Wire Wire Line
	7700 4450 7750 4450
$Comp
L R R3
U 1 1 55170E4C
P 6650 2350
F 0 "R3" V 6730 2350 40  0000 C CNN
F 1 "10k" V 6657 2351 40  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6580 2350 30  0001 C CNN
F 3 "" H 6650 2350 30  0000 C CNN
	1    6650 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 2150 6800 2150
Wire Wire Line
	6800 2150 6800 2600
Wire Wire Line
	6650 2600 6900 2600
Connection ~ 6650 2050
Text Label 6900 2600 0    60   ~ 0
1HZ
Connection ~ 6800 2600
Text Label 7350 4600 1    60   ~ 0
~RST
Text Label 7000 2500 0    60   ~ 0
~RST
Wire Wire Line
	6900 2250 6900 2500
Wire Wire Line
	6900 2500 7000 2500
$Comp
L VCC #PWR09
U 1 1 551715D8
P 4200 5500
F 0 "#PWR09" H 4200 5600 30  0001 C CNN
F 1 "VCC" H 4200 5600 30  0000 C CNN
F 2 "" H 4200 5500 60  0000 C CNN
F 3 "" H 4200 5500 60  0000 C CNN
	1    4200 5500
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 55171659
P 4050 5900
F 0 "R1" V 4130 5900 40  0000 C CNN
F 1 "10k" V 4057 5901 40  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3980 5900 30  0001 C CNN
F 3 "" H 4050 5900 30  0000 C CNN
	1    4050 5900
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 551716F4
P 4350 5900
F 0 "R2" V 4430 5900 40  0000 C CNN
F 1 "10k" V 4357 5901 40  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4280 5900 30  0001 C CNN
F 3 "" H 4350 5900 30  0000 C CNN
	1    4350 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 5500 4200 5550
Wire Wire Line
	4050 5550 4350 5550
Wire Wire Line
	4350 5550 4350 5650
Wire Wire Line
	4050 5550 4050 5650
Connection ~ 4200 5550
Text Label 4050 6200 3    60   ~ 0
SCL
Text Label 4350 6200 3    60   ~ 0
SDA
Wire Wire Line
	4050 6150 4050 6200
Wire Wire Line
	4350 6150 4350 6200
Text Label 8150 1950 0    60   ~ 0
SCL
Text Label 8150 2050 0    60   ~ 0
SDA
Wire Wire Line
	8100 1950 8150 1950
Wire Wire Line
	8100 2050 8150 2050
Text Notes 7900 2600 0    60   ~ 0
Real-time Clock
Text Notes 4600 6150 1    60   ~ 0
I2C Pullups
Text Label 2700 4550 2    60   ~ 0
SCLK
Text Label 2700 4350 2    60   ~ 0
MOSI
Text Label 2700 4450 2    60   ~ 0
MISO
Text Label 2700 4650 2    60   ~ 0
SSEL
$Comp
L GND #PWR010
U 1 1 55172A4F
P 2650 5050
F 0 "#PWR010" H 2650 5050 30  0001 C CNN
F 1 "GND" H 2650 4980 30  0001 C CNN
F 2 "" H 2650 5050 60  0000 C CNN
F 3 "" H 2650 5050 60  0000 C CNN
	1    2650 5050
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR011
U 1 1 55172A71
P 2650 4050
F 0 "#PWR011" H 2650 4150 30  0001 C CNN
F 1 "VCC" H 2650 4150 30  0000 C CNN
F 2 "" H 2650 4050 60  0000 C CNN
F 3 "" H 2650 4050 60  0000 C CNN
	1    2650 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 4250 2650 4050
Connection ~ 2650 4150
Wire Wire Line
	2650 4850 2650 5050
Connection ~ 2650 4950
$Comp
L CONN_9 P1
U 1 1 55172D53
P 3100 4550
F 0 "P1" V 3050 4550 60  0000 C CNN
F 1 "CONN_9" V 3150 4550 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x09" H 3100 4550 60  0001 C CNN
F 3 "" H 3100 4550 60  0000 C CNN
	1    3100 4550
	1    0    0    -1  
$EndComp
Text Label 2700 4750 2    60   ~ 0
~RST
Wire Wire Line
	2650 4150 2750 4150
Wire Wire Line
	2650 4250 2750 4250
Wire Wire Line
	2650 4850 2750 4850
Wire Wire Line
	2650 4950 2750 4950
Wire Wire Line
	2700 4650 2750 4650
Wire Wire Line
	2700 4750 2750 4750
$Comp
L CONN_7 P3
U 1 1 55173259
P 4350 4550
F 0 "P3" V 4320 4550 60  0000 C CNN
F 1 "CONN_7" V 4420 4550 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x07" H 4350 4550 60  0001 C CNN
F 3 "" H 4350 4550 60  0000 C CNN
	1    4350 4550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 5517329D
P 3900 4950
F 0 "#PWR012" H 3900 4950 30  0001 C CNN
F 1 "GND" H 3900 4880 30  0001 C CNN
F 2 "" H 3900 4950 60  0000 C CNN
F 3 "" H 3900 4950 60  0000 C CNN
	1    3900 4950
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR013
U 1 1 551732C0
P 3900 4150
F 0 "#PWR013" H 3900 4250 30  0001 C CNN
F 1 "VCC" H 3900 4250 30  0000 C CNN
F 2 "" H 3900 4150 60  0000 C CNN
F 3 "" H 3900 4150 60  0000 C CNN
	1    3900 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 4150 3900 4350
Wire Wire Line
	3900 4250 4000 4250
Wire Wire Line
	3900 4350 4000 4350
Connection ~ 3900 4250
Wire Wire Line
	4000 4850 3900 4850
Wire Wire Line
	3900 4750 3900 4950
Wire Wire Line
	4000 4750 3900 4750
Connection ~ 3900 4850
Text Label 3950 4650 2    60   ~ 0
~RST
Text Label 3950 4550 2    60   ~ 0
SDA
Text Label 3950 4450 2    60   ~ 0
SCL
Wire Wire Line
	3950 4450 4000 4450
Wire Wire Line
	3950 4550 4000 4550
Wire Wire Line
	3950 4650 4000 4650
Text Notes 3300 4800 1    60   ~ 0
SPI Header
Text Notes 4600 4800 1    60   ~ 0
I2C Header
NoConn ~ 6900 1950
Wire Wire Line
	8650 4650 8750 4650
Wire Wire Line
	8650 4550 8750 4550
Wire Wire Line
	8650 4350 9050 4350
$Comp
L GND #PWR014
U 1 1 551768E3
P 6600 4750
F 0 "#PWR014" H 6600 4750 30  0001 C CNN
F 1 "GND" H 6600 4680 30  0001 C CNN
F 2 "" H 6600 4750 60  0000 C CNN
F 3 "" H 6600 4750 60  0000 C CNN
	1    6600 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 4600 7350 4650
Connection ~ 7350 4650
$Comp
L GND #PWR015
U 1 1 55176A63
P 7350 5350
F 0 "#PWR015" H 7350 5350 30  0001 C CNN
F 1 "GND" H 7350 5280 30  0001 C CNN
F 2 "" H 7350 5350 60  0000 C CNN
F 3 "" H 7350 5350 60  0000 C CNN
	1    7350 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 4950 7350 4950
Wire Wire Line
	7750 4350 7450 4350
Wire Wire Line
	7450 4350 7450 4950
Wire Wire Line
	8750 4550 8750 4750
Connection ~ 8750 4750
Connection ~ 8750 4650
Wire Wire Line
	9050 4350 9050 4750
Connection ~ 9050 4750
Wire Wire Line
	2700 4350 2750 4350
Wire Wire Line
	2700 4450 2750 4450
Wire Wire Line
	2700 4550 2750 4550
Wire Wire Line
	8650 4950 8700 4950
Wire Wire Line
	8650 5050 8700 5050
Wire Wire Line
	8650 5150 8700 5150
Wire Wire Line
	8650 5250 8700 5250
Wire Wire Line
	7350 4950 7350 5350
Wire Wire Line
	7750 5250 7350 5250
Connection ~ 7350 5250
Wire Wire Line
	7450 4850 7750 4850
Connection ~ 7450 4850
Connection ~ 7450 4950
$EndSCHEMATC
