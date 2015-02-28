EESchema Schematic File Version 2
LIBS:atmel
LIBS:microchip
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
LIBS:contrib
LIBS:valves
LIBS:nxp
LIBS:maxim
EELAYER 24 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Mini Clock"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_2 P1
U 1 1 54F24A59
P 700 1200
F 0 "P1" V 650 1200 40  0000 C CNN
F 1 "CONN_2" V 750 1200 40  0000 C CNN
F 2 "" H 700 1200 60  0000 C CNN
F 3 "" H 700 1200 60  0000 C CNN
	1    700  1200
	-1   0    0    1   
$EndComp
$Comp
L LD1117 U1
U 1 1 54F24C9B
P 1800 1000
F 0 "U1" H 2000 800 40  0000 C CNN
F 1 "LD1117" H 1550 1200 40  0000 L CNN
F 2 "TO-263/SOT-223" H 1800 1100 30  0000 C CIN
F 3 "" H 1800 1000 60  0000 C CNN
	1    1800 1000
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR1
U 1 1 54F24CE7
P 1400 700
F 0 "#PWR1" H 1400 790 20  0001 C CNN
F 1 "+5V" H 1400 790 30  0000 C CNN
F 2 "" H 1400 700 60  0000 C CNN
F 3 "" H 1400 700 60  0000 C CNN
	1    1400 700 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR2
U 1 1 54F24D02
P 1800 1600
F 0 "#PWR2" H 1800 1600 30  0001 C CNN
F 1 "GND" H 1800 1530 30  0001 C CNN
F 2 "" H 1800 1600 60  0000 C CNN
F 3 "" H 1800 1600 60  0000 C CNN
	1    1800 1600
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR3
U 1 1 54F24D2D
P 2200 700
F 0 "#PWR3" H 2200 660 30  0001 C CNN
F 1 "+3.3V" H 2200 810 30  0000 C CNN
F 2 "" H 2200 700 60  0000 C CNN
F 3 "" H 2200 700 60  0000 C CNN
	1    2200 700 
	1    0    0    -1  
$EndComp
$Comp
L CP C1
U 1 1 54F24DAF
P 1400 1200
F 0 "C1" H 1450 1300 40  0000 L CNN
F 1 "10uF" H 1450 1100 40  0000 L CNN
F 2 "" H 1500 1050 30  0000 C CNN
F 3 "" H 1400 1200 300 0000 C CNN
	1    1400 1200
	1    0    0    -1  
$EndComp
$Comp
L CP C2
U 1 1 54F24DC3
P 2200 1200
F 0 "C2" H 2250 1300 40  0000 L CNN
F 1 "10uF" H 2250 1100 40  0000 L CNN
F 2 "" H 2300 1050 30  0000 C CNN
F 3 "" H 2200 1200 300 0000 C CNN
	1    2200 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 700  1400 1000
Wire Wire Line
	2200 700  2200 1000
Connection ~ 2200 950 
Connection ~ 1400 950 
Wire Wire Line
	1800 1250 1800 1600
Wire Wire Line
	1400 1400 2200 1400
Connection ~ 1800 1400
Wire Wire Line
	1050 1100 1200 1100
Wire Wire Line
	1200 1100 1200 900 
Wire Wire Line
	1200 900  1400 900 
Connection ~ 1400 900 
Wire Wire Line
	1050 1300 1200 1300
Wire Wire Line
	1200 1300 1200 1500
Wire Wire Line
	1200 1500 1800 1500
Connection ~ 1800 1500
$EndSCHEMATC
