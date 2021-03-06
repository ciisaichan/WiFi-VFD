EESchema Schematic File Version 4
EELAYER 30 0
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
L Connector:USB_C_Receptacle_USB2.0 J1
U 1 1 604F80CD
P 1500 5350
F 0 "J1" H 1607 6217 50  0000 C CNN
F 1 "USB_C_Receptacle_USB2.0" H 1607 6126 50  0000 C CNN
F 2 "wifivfd:USB_C_Receptacle_XKB_U262-16XN-4BVC11" H 1650 5350 50  0001 C CNN
F 3 "https://www.usb.org/sites/default/files/documents/usb_type-c.zip" H 1650 5350 50  0001 C CNN
	1    1500 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 4750 2450 4750
Wire Wire Line
	2450 4650 2450 4750
Wire Wire Line
	1500 6250 1500 6350
$Comp
L power:GND #PWR0101
U 1 1 60504C01
P 1500 6400
F 0 "#PWR0101" H 1500 6150 50  0001 C CNN
F 1 "GND" H 1505 6227 50  0000 C CNN
F 2 "" H 1500 6400 50  0001 C CNN
F 3 "" H 1500 6400 50  0001 C CNN
	1    1500 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 6250 1200 6350
Wire Wire Line
	1200 6350 1500 6350
Connection ~ 1500 6350
Wire Wire Line
	1500 6350 1500 6400
Wire Wire Line
	2100 5350 2200 5350
Text Label 2450 5350 2    50   ~ 0
D_N
Wire Wire Line
	2100 5450 2200 5450
Text Label 2450 5450 2    50   ~ 0
D_P
Wire Wire Line
	2100 5550 2200 5550
Wire Wire Line
	2200 5550 2200 5450
Connection ~ 2200 5450
Wire Wire Line
	2200 5450 2450 5450
Wire Wire Line
	2100 5250 2200 5250
Wire Wire Line
	2200 5250 2200 5350
Connection ~ 2200 5350
Wire Wire Line
	2200 5350 2450 5350
Wire Wire Line
	2100 4950 2200 4950
Wire Wire Line
	2100 5050 2200 5050
Wire Wire Line
	2200 5050 2200 4950
Connection ~ 2200 4950
Wire Wire Line
	2200 4950 2450 4950
$Comp
L power:GND #PWR0102
U 1 1 6051F319
P 2900 4950
F 0 "#PWR0102" H 2900 4700 50  0001 C CNN
F 1 "GND" V 2905 4822 50  0000 R CNN
F 2 "" H 2900 4950 50  0001 C CNN
F 3 "" H 2900 4950 50  0001 C CNN
	1    2900 4950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2750 4950 2900 4950
$Comp
L Regulator_Linear:NCP1117-3.3_SOT223 U2
U 1 1 60524AB0
P 4550 5150
F 0 "U2" H 4550 5392 50  0000 C CNN
F 1 "NCP1117-3.3_SOT223" H 4550 5301 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 4550 5350 50  0001 C CNN
F 3 "http://www.onsemi.com/pub_link/Collateral/NCP1117-D.PDF" H 4650 4900 50  0001 C CNN
	1    4550 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 5150 4100 5150
Wire Wire Line
	4850 5150 5000 5150
NoConn ~ 2100 5850
NoConn ~ 2100 5950
Wire Wire Line
	4100 5300 4100 5150
Connection ~ 4100 5150
Wire Wire Line
	4100 5150 3900 5150
Wire Wire Line
	5000 5300 5000 5150
Connection ~ 5000 5150
Wire Wire Line
	5000 5150 5200 5150
$Comp
L power:+5V #PWR0103
U 1 1 60547FEA
P 3900 5000
F 0 "#PWR0103" H 3900 4850 50  0001 C CNN
F 1 "+5V" H 3915 5173 50  0000 C CNN
F 2 "" H 3900 5000 50  0001 C CNN
F 3 "" H 3900 5000 50  0001 C CNN
	1    3900 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 5000 3900 5150
$Comp
L power:+3.3V #PWR0104
U 1 1 6054D76B
P 5200 5000
F 0 "#PWR0104" H 5200 4850 50  0001 C CNN
F 1 "+3.3V" H 5215 5173 50  0000 C CNN
F 2 "" H 5200 5000 50  0001 C CNN
F 3 "" H 5200 5000 50  0001 C CNN
	1    5200 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 5000 5200 5150
$Comp
L power:GND #PWR0105
U 1 1 6055391F
P 4550 5650
F 0 "#PWR0105" H 4550 5400 50  0001 C CNN
F 1 "GND" H 4555 5477 50  0000 C CNN
F 2 "" H 4550 5650 50  0001 C CNN
F 3 "" H 4550 5650 50  0001 C CNN
	1    4550 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 5600 4550 5600
Wire Wire Line
	4550 5600 4550 5650
Wire Wire Line
	5000 5600 4550 5600
Connection ~ 4550 5600
Wire Wire Line
	4550 5450 4550 5600
$Comp
L Switch:SW_Push SW1
U 1 1 605B3467
P 6350 5500
F 0 "SW1" V 6304 5648 50  0000 L CNN
F 1 "KEY_RST" V 6395 5648 50  0000 L CNN
F 2 "Button_Switch_SMD:Panasonic_EVQPUL_EVQPUC" H 6350 5700 50  0001 C CNN
F 3 "~" H 6350 5700 50  0001 C CNN
	1    6350 5500
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 605B5939
P 6350 5000
F 0 "R3" H 6420 5046 50  0000 L CNN
F 1 "470" H 6420 4955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6280 5000 50  0001 C CNN
F 3 "~" H 6350 5000 50  0001 C CNN
	1    6350 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 4850 6350 4750
Wire Wire Line
	6350 5800 6350 5700
Text Label 6100 4750 0    50   ~ 0
nRST
$Comp
L Device:R R4
U 1 1 6060D129
P 7300 5000
F 0 "R4" H 7370 5046 50  0000 L CNN
F 1 "470" H 7370 4955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7230 5000 50  0001 C CNN
F 3 "~" H 7300 5000 50  0001 C CNN
	1    7300 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 4850 7300 4750
Wire Wire Line
	7300 4750 7050 4750
$Comp
L Switch:SW_Push SW2
U 1 1 6061333B
P 7300 5500
F 0 "SW2" V 7254 5648 50  0000 L CNN
F 1 "KEY_Flash" V 7345 5648 50  0000 L CNN
F 2 "Button_Switch_SMD:Panasonic_EVQPUL_EVQPUC" H 7300 5700 50  0001 C CNN
F 3 "~" H 7300 5700 50  0001 C CNN
	1    7300 5500
	0    1    1    0   
$EndComp
Wire Wire Line
	7300 5300 7300 5150
$Comp
L power:GND #PWR0106
U 1 1 60619FC2
P 7300 5800
F 0 "#PWR0106" H 7300 5550 50  0001 C CNN
F 1 "GND" H 7305 5627 50  0000 C CNN
F 2 "" H 7300 5800 50  0001 C CNN
F 3 "" H 7300 5800 50  0001 C CNN
	1    7300 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 5800 7300 5700
Text Label 7050 4750 0    50   ~ 0
GPIO0
$Comp
L power:GND #PWR0107
U 1 1 605DC06D
P 6350 5800
F 0 "#PWR0107" H 6350 5550 50  0001 C CNN
F 1 "GND" H 6355 5627 50  0000 C CNN
F 2 "" H 6350 5800 50  0001 C CNN
F 3 "" H 6350 5800 50  0001 C CNN
	1    6350 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 5150 6350 5300
$Comp
L Device:R R2
U 1 1 60516D09
P 2600 4950
F 0 "R2" V 2393 4950 50  0000 C CNN
F 1 "4.7k" V 2484 4950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2530 4950 50  0001 C CNN
F 3 "~" H 2600 4950 50  0001 C CNN
	1    2600 4950
	0    1    1    0   
$EndComp
$Comp
L ESP-12S:ESP-12S U1
U 1 1 60429CD6
P 2950 2550
F 0 "U1" H 2950 3417 50  0000 C CNN
F 1 "ESP-12S" H 2950 3326 50  0000 C CNN
F 2 "ESP-12S" H 2950 2550 50  0001 L BNN
F 3 "" H 2950 2550 50  0001 L BNN
F 4 "IC-14115" H 2950 2550 50  0001 L BNN "PROD_ID"
	1    2950 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 1950 2200 1950
$Comp
L power:+3.3V #PWR0108
U 1 1 604336C1
P 2200 1950
F 0 "#PWR0108" H 2200 1800 50  0001 C CNN
F 1 "+3.3V" H 2215 2123 50  0000 C CNN
F 2 "" H 2200 1950 50  0001 C CNN
F 3 "" H 2200 1950 50  0001 C CNN
	1    2200 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 2250 2200 2250
Text Label 2200 2250 0    50   ~ 0
nRST
Wire Wire Line
	6350 4750 6100 4750
$Comp
L Device:R R1
U 1 1 60436DF1
P 2050 2550
F 0 "R1" V 1843 2550 50  0000 C CNN
F 1 "470" V 1934 2550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1980 2550 50  0001 C CNN
F 3 "~" H 2050 2550 50  0001 C CNN
	1    2050 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	2550 2550 2200 2550
$Comp
L power:+3.3V #PWR0109
U 1 1 60438BD0
P 1800 2550
F 0 "#PWR0109" H 1800 2400 50  0001 C CNN
F 1 "+3.3V" V 1815 2678 50  0000 L CNN
F 2 "" H 1800 2550 50  0001 C CNN
F 3 "" H 1800 2550 50  0001 C CNN
	1    1800 2550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1800 2550 1900 2550
$Comp
L power:GND #PWR0110
U 1 1 6043A4B1
P 2450 3200
F 0 "#PWR0110" H 2450 2950 50  0001 C CNN
F 1 "GND" H 2455 3027 50  0000 C CNN
F 2 "" H 2450 3200 50  0001 C CNN
F 3 "" H 2450 3200 50  0001 C CNN
	1    2450 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 3050 2450 3050
Wire Wire Line
	2450 3050 2450 3200
$Comp
L Interface_USB:CH330N U4
U 1 1 6043B9F6
P 9650 5150
F 0 "U4" H 9900 4800 50  0000 C CNN
F 1 "CH330N" H 9400 4800 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 9500 5900 50  0001 C CNN
F 3 "http://www.wch.cn/downloads/file/240.html" H 9550 5350 50  0001 C CNN
	1    9650 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 5250 8900 5250
Wire Wire Line
	9250 5350 8900 5350
Text Label 8900 5250 0    50   ~ 0
D_P
Text Label 8900 5350 0    50   ~ 0
D_N
$Comp
L power:+3.3V #PWR0111
U 1 1 6044A1DC
P 9650 4750
F 0 "#PWR0111" H 9650 4600 50  0001 C CNN
F 1 "+3.3V" H 9665 4923 50  0000 C CNN
F 2 "" H 9650 4750 50  0001 C CNN
F 3 "" H 9650 4750 50  0001 C CNN
	1    9650 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 4750 9650 4850
$Comp
L power:GND #PWR0112
U 1 1 6044B68C
P 9650 5650
F 0 "#PWR0112" H 9650 5400 50  0001 C CNN
F 1 "GND" H 9655 5477 50  0000 C CNN
F 2 "" H 9650 5650 50  0001 C CNN
F 3 "" H 9650 5650 50  0001 C CNN
	1    9650 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 5650 9650 5550
$Comp
L Device:C C4
U 1 1 6044C6CB
P 8750 5050
F 0 "C4" V 8498 5050 50  0000 C CNN
F 1 "100nF" V 8589 5050 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8788 4900 50  0001 C CNN
F 3 "~" H 8750 5050 50  0001 C CNN
	1    8750 5050
	0    1    1    0   
$EndComp
Wire Wire Line
	8900 5050 9250 5050
$Comp
L power:GND #PWR0113
U 1 1 6044E0A8
P 8500 5050
F 0 "#PWR0113" H 8500 4800 50  0001 C CNN
F 1 "GND" V 8505 4922 50  0000 R CNN
F 2 "" H 8500 5050 50  0001 C CNN
F 3 "" H 8500 5050 50  0001 C CNN
	1    8500 5050
	0    1    1    0   
$EndComp
Wire Wire Line
	8500 5050 8600 5050
Wire Wire Line
	3350 2050 3700 2050
Text Label 3700 2050 2    50   ~ 0
RXD0
Wire Wire Line
	3350 1950 3700 1950
Text Label 3700 1950 2    50   ~ 0
TXD0
$Comp
L power:+5V #PWR0114
U 1 1 60453BDA
P 2450 4650
F 0 "#PWR0114" H 2450 4500 50  0001 C CNN
F 1 "+5V" H 2465 4823 50  0000 C CNN
F 2 "" H 2450 4650 50  0001 C CNN
F 3 "" H 2450 4650 50  0001 C CNN
	1    2450 4650
	1    0    0    -1  
$EndComp
Text Label 10400 5050 2    50   ~ 0
RXD0
Text Label 10400 5150 2    50   ~ 0
TXD0
NoConn ~ 10050 5350
Wire Wire Line
	3350 3050 3700 3050
Text Label 3700 3050 2    50   ~ 0
GPIO0
Wire Wire Line
	10050 5050 10400 5050
Wire Wire Line
	10050 5150 10400 5150
Wire Wire Line
	3350 2250 3700 2250
Wire Wire Line
	3350 2750 3700 2750
Wire Wire Line
	3350 2850 3700 2850
Wire Wire Line
	3350 2950 3700 2950
Wire Wire Line
	3350 2450 3700 2450
Text Label 3700 2250 2    50   ~ 0
PIN_D0
Text Label 3700 2450 2    50   ~ 0
PIN_D5
Text Label 3700 2750 2    50   ~ 0
PIN_D1
Text Label 3700 2850 2    50   ~ 0
PIN_D2
Text Label 3700 2950 2    50   ~ 0
PIN_D4
$Comp
L Connector:Conn_01x07_Male J2
U 1 1 60417C88
P 6750 2250
F 0 "J2" H 6722 2274 50  0000 R CNN
F 1 "Conn_VFD" H 6722 2183 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x07_P2.54mm_Vertical" H 6750 2250 50  0001 C CNN
F 3 "~" H 6750 2250 50  0001 C CNN
	1    6750 2250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6550 2150 6200 2150
Wire Wire Line
	6550 2250 6200 2250
Wire Wire Line
	6550 2350 6200 2350
Wire Wire Line
	6550 2450 6200 2450
Wire Wire Line
	6550 2550 6200 2550
$Comp
L power:GND #PWR0115
U 1 1 604275AC
P 6200 1950
F 0 "#PWR0115" H 6200 1700 50  0001 C CNN
F 1 "GND" V 6205 1822 50  0000 R CNN
F 2 "" H 6200 1950 50  0001 C CNN
F 3 "" H 6200 1950 50  0001 C CNN
	1    6200 1950
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0116
U 1 1 60427D8D
P 5500 2050
F 0 "#PWR0116" H 5500 1900 50  0001 C CNN
F 1 "+5V" V 5515 2178 50  0000 L CNN
F 2 "" H 5500 2050 50  0001 C CNN
F 3 "" H 5500 2050 50  0001 C CNN
	1    5500 2050
	0    -1   -1   0   
$EndComp
Text Label 6200 2150 0    50   ~ 0
PIN_D0
Text Label 6200 2250 0    50   ~ 0
PIN_D1
Text Label 6200 2350 0    50   ~ 0
PIN_D2
Text Label 6200 2450 0    50   ~ 0
PIN_D5
Text Label 6200 2550 0    50   ~ 0
PIN_D4
$Comp
L Sensor:DHT11 U3
U 1 1 6040F774
P 9300 2350
F 0 "U3" H 9056 2396 50  0000 R CNN
F 1 "DHT11" H 9056 2305 50  0000 R CNN
F 2 "Sensor:Aosong_DHT11_5.5x12.0_P2.54mm" H 9300 1950 50  0001 C CNN
F 3 "http://akizukidenshi.com/download/ds/aosong/DHT11.pdf" H 9450 2600 50  0001 C CNN
	1    9300 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C2
U 1 1 6041E177
P 5000 5450
F 0 "C2" H 5118 5496 50  0000 L CNN
F 1 "10uF" H 5118 5405 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3528-21_Kemet-B" H 5038 5300 50  0001 C CNN
F 3 "~" H 5000 5450 50  0001 C CNN
	1    5000 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 60420EE6
P 4100 5450
F 0 "C1" H 4218 5496 50  0000 L CNN
F 1 "10uF" H 4218 5405 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3528-21_Kemet-B" H 4138 5300 50  0001 C CNN
F 3 "~" H 4100 5450 50  0001 C CNN
	1    4100 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 2050 5700 2050
Wire Wire Line
	6200 1950 6350 1950
$Comp
L Device:CP C3
U 1 1 604239A8
P 5700 1800
F 0 "C3" H 5582 1754 50  0000 R CNN
F 1 "10uF" H 5582 1845 50  0000 R CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3528-21_Kemet-B" H 5738 1650 50  0001 C CNN
F 3 "~" H 5700 1800 50  0001 C CNN
	1    5700 1800
	-1   0    0    1   
$EndComp
Wire Wire Line
	5700 1950 5700 2050
Connection ~ 5700 2050
Wire Wire Line
	5700 2050 6550 2050
Wire Wire Line
	5700 1650 5700 1600
Wire Wire Line
	5700 1600 6350 1600
Wire Wire Line
	6350 1600 6350 1950
Connection ~ 6350 1950
Wire Wire Line
	6350 1950 6550 1950
$Comp
L power:+3.3V #PWR0117
U 1 1 6042AD5C
P 9300 1800
F 0 "#PWR0117" H 9300 1650 50  0001 C CNN
F 1 "+3.3V" H 9315 1973 50  0000 C CNN
F 2 "" H 9300 1800 50  0001 C CNN
F 3 "" H 9300 1800 50  0001 C CNN
	1    9300 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 6042D049
P 9300 2750
F 0 "#PWR0118" H 9300 2500 50  0001 C CNN
F 1 "GND" H 9305 2577 50  0000 C CNN
F 2 "" H 9300 2750 50  0001 C CNN
F 3 "" H 9300 2750 50  0001 C CNN
	1    9300 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 2750 9300 2650
Wire Wire Line
	3350 2650 3700 2650
Text Label 3700 2650 2    50   ~ 0
PIN_D6
Text Label 10200 2350 2    50   ~ 0
PIN_D6
Wire Wire Line
	9800 2250 9800 2350
Wire Wire Line
	9600 2350 9800 2350
Wire Wire Line
	9800 2350 10200 2350
Connection ~ 9800 2350
Wire Wire Line
	3350 2150 3700 2150
Text Label 3700 2150 2    50   ~ 0
ADC
Wire Wire Line
	3350 2350 3700 2350
Text Label 3700 2350 2    50   ~ 0
PIN_D8
Wire Wire Line
	3350 2550 3700 2550
Text Label 3700 2550 2    50   ~ 0
PIN_D7
Wire Wire Line
	9300 1800 9300 1900
Wire Wire Line
	9800 1950 9800 1900
Wire Wire Line
	9800 1900 9300 1900
Connection ~ 9300 1900
Wire Wire Line
	9300 1900 9300 2050
$Comp
L Connector:Conn_01x05_Male J3
U 1 1 60452056
P 6750 3100
F 0 "J3" H 6722 3124 50  0000 R CNN
F 1 "Conn_OutPin" H 6722 3033 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 6750 3100 50  0001 C CNN
F 3 "~" H 6750 3100 50  0001 C CNN
	1    6750 3100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6550 2900 6200 2900
Wire Wire Line
	6550 3000 6200 3000
Wire Wire Line
	6550 3100 6200 3100
Wire Wire Line
	6550 3200 6200 3200
Wire Wire Line
	6550 3300 6200 3300
$Comp
L power:GND #PWR0119
U 1 1 604604D3
P 6200 2900
F 0 "#PWR0119" H 6200 2650 50  0001 C CNN
F 1 "GND" V 6205 2772 50  0000 R CNN
F 2 "" H 6200 2900 50  0001 C CNN
F 3 "" H 6200 2900 50  0001 C CNN
	1    6200 2900
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0120
U 1 1 60460DA1
P 6200 3000
F 0 "#PWR0120" H 6200 2850 50  0001 C CNN
F 1 "+5V" V 6215 3128 50  0000 L CNN
F 2 "" H 6200 3000 50  0001 C CNN
F 3 "" H 6200 3000 50  0001 C CNN
	1    6200 3000
	0    -1   -1   0   
$EndComp
Text Label 6200 3100 0    50   ~ 0
ADC
Text Label 6200 3200 0    50   ~ 0
PIN_D8
Text Label 6200 3300 0    50   ~ 0
PIN_D7
$Comp
L Device:R R5
U 1 1 6046DFBF
P 9800 2100
F 0 "R5" H 9650 2150 50  0000 C CNN
F 1 "4.7k" H 9650 2050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 9730 2100 50  0001 C CNN
F 3 "~" H 9800 2100 50  0001 C CNN
	1    9800 2100
	-1   0    0    1   
$EndComp
$EndSCHEMATC
