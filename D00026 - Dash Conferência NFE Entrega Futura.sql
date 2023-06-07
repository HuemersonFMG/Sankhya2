--D0026 Dash Posição Para Desconto de Duplicatas
--RELACAO DE NOTAS PARA DESCONTO DE DUPLICATAS
--NOTAS DE VENDA ENTREGA FUTURA E REMESSA
--RELACAO DE NOTAS ENTREGUES COM PENDENCIA DE VALOR A RECEBER
WITH TEST AS(
SELECT DISTINCT
NUNOTAORIG,
SUM(QTDATENDIDA) QTDATENDIDA
FROM TGFVAR
GROUP BY
NUNOTAORIG
ORDER BY
NUNOTAORIG),

TEST1 AS (
SELECT DISTINCT
NUNOTA,
SUM(QTDNEG) QTDNEG
FROM TGFITE

GROUP BY
NUNOTA
ORDER BY
NUNOTA)




SELECT DISTINCT
CAB.NUNOTA,
CAB.CODTIPOPER,
TOP.DESCROPER,
CAB.NUMNOTA,
--FIN.AD_TIPOCOBRANCA,
CAB.CODPARC,
PAR.RAZAOSOCIAL,
CAB.DTNEG,
CAB.DTMOV,
FIN.DTVENC,
FIN.DHBAIXA,
TES.QTDATENDIDA,
TES1.QTDNEG,
CAB.VLRFRETE,
CAB.AD_VLRSALDO,
CAB.VLRNOTA

FROM
TGFCAB CAB
INNER JOIN TGFFIN FIN ON CAB.NUNOTA = FIN.NUNOTA
INNER JOIN TGFTOP TOP ON CAB.CODTIPOPER = TOP.CODTIPOPER
INNER JOIN TGFITE ITE ON CAB.NUNOTA = ITE.NUNOTA
LEFT JOIN TEST TES ON CAB.NUNOTA = TES.NUNOTAORIG
LEFT JOIN TEST1 TES1 ON CAB.NUNOTA = TES1.NUNOTA
INNER JOIN TGFPAR PAR ON CAB.CODPARC = PAR.CODPARC
WHERE
CAB.TIPMOV = 'V'
AND FIN.DHBAIXA IS NULL
AND ((TES1.QTDNEG) - (TES.QTDATENDIDA))=0
ORDER BY
FIN.DTVENC