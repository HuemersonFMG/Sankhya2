
(((LAG(
SUM(CASE 
WHEN (PLA.CODCTACTB NOT IN (458, 508, 714, 522, 534, 536, 537, 539, 541, 544, 545, 546, 551,599, 601, 603, 715, 716, 718, 721,757,758,759))
AND LAN.TIPLANC='R' THEN 1*LAN.VLRLANC
WHEN (PLA.CODCTACTB NOT IN (458, 508, 714, 522, 534, 536, 537, 539, 541, 544, 545, 546, 551,599, 601, 603, 715, 716, 718, 721,757,758,759))
AND LAN.TIPLANC='D' THEN -1*LAN.VLRLANC 
END),1) OVER (ORDER BY TO_CHAR(LAN.DTMOV,'YYYY') ASC, TO_CHAR(LAN.DTMOV,'MM') ASC)*-1)+
(LAG(
SUM(CASE 
WHEN (PLA.CODCTACTB NOT IN (458, 508, 714, 522, 534, 536, 537, 539, 541, 544, 545, 546, 551,599, 601, 603, 715, 716, 718, 721,757,758,759))
AND LAN.TIPLANC='R' THEN 1*LAN.VLRLANC
WHEN (PLA.CODCTACTB NOT IN (458, 508, 714, 522, 534, 536, 537, 539, 541, 544, 545, 546, 551,599, 601, 603, 715, 716, 718, 721,757,758,759))
AND LAN.TIPLANC='D' THEN -1*LAN.VLRLANC 
END),2) OVER (ORDER BY TO_CHAR(LAN.DTMOV,'YYYY') ASC, TO_CHAR(LAN.DTMOV,'MM') ASC)*-1)+
(LAG(
SUM(CASE 
WHEN (PLA.CODCTACTB NOT IN (458, 508, 714, 522, 534, 536, 537, 539, 541, 544, 545, 546, 551,599, 601, 603, 715, 716, 718, 721,757,758,759))
AND LAN.TIPLANC='R' THEN 1*LAN.VLRLANC
WHEN (PLA.CODCTACTB NOT IN (458, 508, 714, 522, 534, 536, 537, 539, 541, 544, 545, 546, 551,599, 601, 603, 715, 716, 718, 721,757,758,759))
AND LAN.TIPLANC='D' THEN -1*LAN.VLRLANC 
END),3) OVER (ORDER BY TO_CHAR(LAN.DTMOV,'YYYY') ASC, TO_CHAR(LAN.DTMOV,'MM') ASC)*-1))/3)) AS PONTO_EQUI,


(((SUM(CASE WHEN LAN.TIPLANC='R' AND PLA.CODCTACTB IN (508,714) THEN 1*LAN.VLRLANC WHEN LAN.TIPLANC='D'AND PLA.CODCTACTB IN (508,714) THEN -1*LAN.VLRLANC END))+
(SUM(CASE WHEN LAN.TIPLANC='R' AND PLA.CODCTACTB IN (534,535,536,537,538,539,540,541,544,547) THEN 1*LAN.VLRLANC WHEN LAN.TIPLANC='D'AND PLA.CODCTACTB IN (534,535,536,537,538,539,540,541,544,547) THEN -1*LAN.VLRLANC END)))+
(SUM(CASE WHEN LAN.TIPLANC='R' AND PLA.CODCTACTB IN (551) THEN 1*LAN.VLRLANC WHEN LAN.TIPLANC='D'AND PLA.CODCTACTB IN (551) THEN -1*LAN.VLRLANC END))) /

(((LAG(
SUM(CASE 
WHEN (PLA.CODCTACTB NOT IN (458, 508, 714, 522, 534, 536, 537, 539, 541, 544, 545, 546, 551,599, 601, 603, 715, 716, 718, 721,757,758,759))
AND LAN.TIPLANC='R' THEN 1*LAN.VLRLANC
WHEN (PLA.CODCTACTB NOT IN (458, 508, 714, 522, 534, 536, 537, 539, 541, 544, 545, 546, 551,599, 601, 603, 715, 716, 718, 721,757,758,759))
AND LAN.TIPLANC='D' THEN -1*LAN.VLRLANC 
END),1) OVER (ORDER BY TO_CHAR(LAN.DTMOV,'YYYY') ASC, TO_CHAR(LAN.DTMOV,'MM') ASC)*-1)+
(LAG(
SUM(CASE 
WHEN (PLA.CODCTACTB NOT IN (458, 508, 714, 522, 534, 536, 537, 539, 541, 544, 545, 546, 551,599, 601, 603, 715, 716, 718, 721,757,758,759))
AND LAN.TIPLANC='R' THEN 1*LAN.VLRLANC
WHEN (PLA.CODCTACTB NOT IN (458, 508, 714, 522, 534, 536, 537, 539, 541, 544, 545, 546, 551,599, 601, 603, 715, 716, 718, 721,757,758,759))
AND LAN.TIPLANC='D' THEN -1*LAN.VLRLANC 
END),2) OVER (ORDER BY TO_CHAR(LAN.DTMOV,'YYYY') ASC, TO_CHAR(LAN.DTMOV,'MM') ASC)*-1)+
(LAG(
SUM(CASE 
WHEN (PLA.CODCTACTB NOT IN (458, 508, 714, 522, 534, 536, 537, 539, 541, 544, 545, 546, 551,599, 601, 603, 715, 716, 718, 721,757,758,759))
AND LAN.TIPLANC='R' THEN 1*LAN.VLRLANC
WHEN (PLA.CODCTACTB NOT IN (458, 508, 714, 522, 534, 536, 537, 539, 541, 544, 545, 546, 551,599, 601, 603, 715, 716, 718, 721,757,758,759))
AND LAN.TIPLANC='D' THEN -1*LAN.VLRLANC 
END),3) OVER (ORDER BY TO_CHAR(LAN.DTMOV,'YYYY') ASC, TO_CHAR(LAN.DTMOV,'MM') ASC)*-1))/3*-1)*-100 PERC_PE,