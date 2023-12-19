 SELECT MP.*,
         P.CODPROD,
         P.DESCRPROD,
         P2.CODPROD,
         P2.DESCRPROD,
         P.AD_CODMODELO,
         P.AD_COR,
         P2.AD_COR,
         P2.AD_CODMODELO,
         CONCAT (P2.CODPROD, MP.CODPRODMP) AS IDCOMPAXMP
    FROM TPRLMP MP, TGFPRO P, TGFPRO P2
   WHERE     P2.CODPROD NOT IN (SELECT DISTINCT (CODPRODPA)
                                  FROM TPRLMP
                                 WHERE IDEFX IN (4, 5, 630, 631))
         AND (P.AD_CODMODELO IN ('CO55', 'CA45', 'GM60', 'CO55'))
         AND P.CODPROD = MP.CODPRODPA
         AND MP.IDEFX = 631
         AND (P.AD_COR = P2.AD_COR
             OR DECODE (P2.AD_COR,   'JATEADO   ', 'JATEADO   ', 'OURO ENV. ', 'BEGE      ', 'MARMACQUA ', 'AZUL      ', 'PRETO     ', 'PRETO     '  ) = P.AD_COR)
         AND (P.AD_CODCOR = P2.AD_CODCOR
         OR P.AD_CODCOR = DECODE (P2.AD_CODCOR,7, 7, 2, 2, 3, 2))
            AND P.CODPROD <> P2.CODPROD
            AND (P.AD_CODMODELO = P2.AD_CODMODELO
                 OR DECODE (P2.AD_CODMODELO, 'CO55', 'CO55', 'CA45', 'CA45', 'GM60', 'GM60', 'CO55' ) = P.AD_CODMODELO)
            AND (P2.AD_SUPORTE = P.AD_SUPORTE
                 OR DECODE (P2.AD_SUPORTE,  'N', 'N', 'APX37', 'AP37' )= P.AD_SUPORTE)
            AND (P2.AD_CODMODELO IN ( 'CO55', 'CA45', 'GM60', 'CO55'   ))
            AND P.CODPROD = MP.CODPRODPA
ORDER BY P2.CODPROD ASC