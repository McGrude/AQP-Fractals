1000 SW=160 : ' screen width
1010 SH=200 : ' screen height
1020 INPUT "XL,YT & XR,YB"; XL, YT, XR, YB     
1030 ' XL =  -8 : ' Graph Left Extent
1040 ' XR =   8 : ' Graph Right Extent
1050 ' YT =  10 : ' Graph Top Extent
1060 ' YB = -10 : ' Graph Right Extent
1070 ' ENSURE graph left, bottom is -,-
1080 ' ENSURE graph right, top is +,+
1090 T=0 
1100 IF XL > XR THEN T=XL : XL=XR : XR=T
1110 IF YB > YT THEN T=YB : YB=YT : YT=T
1120 GW = XR - XL : ' Graph Width
1130 GH = YT - YB : ' Graph Height   
1140 XS = SW/GW : ' "X scale" : Pixels per graph unit X
1150 YS = SH/GH : ' "Y scale" : Pixels per graph unit Y
1160 XO = XL * XS * -1 : ' "X Offset" : how many pixels offset to X origin
1170 YO = YB * YS * -1 : ' "Y Offset" : how many pixels offset to Y origin
1180 CLS
1190 PRINT     
1200 PRINT "          XL :";XL
1210 PRINT "          XR :";XR
1220 PRINT "          YT :";YT
1230 PRINT "          YB :";YB
1240 PRINT " Graph Width :";GW
1250 PRINT "Graph Height :";GH
1260 PRINT "     X Scale :";XS
1270 PRINT "     Y Scale :";YS
1280 PRINT "    X Offset :";XO
1290 PRINT "    Y Offset :";YO    
1300 END
1310 REM LINE DRAWING USING BRESENHAM'S ALGORITHM 
1320 S=SCREEN : ' capture current screen mode
1330 screen 0,3
1340 color 15
1350 clear bitmap
1360 DX = ABS(X2 - X1)
1370 DY = ABS(Y2 - Y1)
1380 SX = SGN(X2 - X1)
1390 SY = SGN(Y2 - Y1)
1400 IF DX >  DY THEN GOSUB 1450
1410 IF DX <= DY THEN GOSUB 1550
1420 PAUSE
1430 SCREEN S/64
1440 END
1450 REM CASE WHERE DX > DY (MORE HORIZONTAL)
1460 E = 2 * DY - DX
1470 FOR I = 1 TO DX + 1
1480     pset(X1, Y1)
1490     IF E >= 0 THEN Y1 = Y1 + SY
1500     IF E >= 0 THEN E = E - 2 * DX
1510     X1 = X1 + SX
1520     E = E + 2 * DY
1530 NEXT I
1540 RETURN
1550 REM CASE WHERE DY >= DX (MORE VERTICAL)
1560 E = 2 * DX - DY
1570 FOR I = 1 TO DY + 1
1580     pset(X1, Y1)
1590     IF E >= 0 THEN X1 = X1 + SX
1600     IF E >= 0 THEN E = E - 2 * DY
1610     Y1 = Y1 + SY
1620     E = E + 2 * DX
1630 NEXT I
1640 RETURN
