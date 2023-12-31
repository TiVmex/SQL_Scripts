SELECT CF.*, (SELECT SUM(NVL(E.ESTOQUE, 0)) FROM TGFEST E WHERE E.CODPROD = CF.CODPROD) AS ESTOQUE
FROM VMEX_CRIACAO_FORMULAS CF WHERE FORMULA = 'SEM FORMULA' AND PRODUTO NOT LIKE '%*B%'  /* AND
AD_CODMODELO IN ('GS50', 'GP50', 'KC', 'CA45', 'GM60', 'GO60', 'CQ34', 'PTR', 'CC42', 'GO40', 'GD45', 'CC32', 'GV50', 'GO45', 'GA70', 'GL50', 'GS60', 'GG50', 'GF60', 'GV45', 'GO40', 'GA60', 'GM45', 'CO55', 'GH45', 'GV60', 'GG40',
 'GS55', 'CA51', 'GL45', 'GS70', 'GL60', 'GS40', 'GP50', 'GS45', 'GF70', 'GL60', 'GT90', 'CA45', 'GN45', 'CC38', 'GG55', 'GV80', 'GTS60', 'GT70', 'GA90', 'GO90', 'PPH', 'GO40', 'GD80', 'CO55', 'GI42', 'GT70', 'GF70', 'GT90', 'GD45', 'PPH',
  'GS80', 'GS90', 'GH45', 'PTB', 'GG70', 'GS90') */
ORDER BY  ESTOQUE ASC