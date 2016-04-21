SELECT R.debut as repete, ordre, M.nom, audio FROM enregistrement E
	LEFT JOIN repete R ON R.id = E.repeteId
	LEFT JOIN morceau M ON M.id = E.morceauId
ORDER BY repete, ordre, nom
;