
Exemple d'une session d'enregistrement pour une maquette ou album.
	- Un multipiste a �t� enregistr� => cr�ation d'un enregistrement avec
		- multipiste = true
		- duree : la dur�e maximale parmi toutes les pistes
		- repete : ajouter un nouveau champs ? par exemple session ?
		- morceau : pour s'y retrouver car c'est la seule info qu'on peut avoir
		- googleFileId : aucune association ne doit �tre faite � ce niveau car on peut avoir plusieurs mix, plusieurs pistes, etc...
			- Si on veut associer plusieurs fichiers, il faut alors cr�er une autre table
			
	- cr�er plut�t un mod�le `multipiste` ? avec :
		- duree : la dur�e maximale parmi toutes les pistes
		- morceau : pour s'y retrouver car c'est la seule info qu'on peut avoir
		- ajouter une relation 0..* vers enregistrement pour chaque piste enregistr�e (sans lien repete)
	- dans ce cas il faut ajouter un champs `enregistrement`.`multipiste` par d�faut � true pour savoir si c'est un enregistrement de plusieurs intrus ou un seul instru
		- ou alors un champs `solo` ou `piste` qui indique qu'on a enregistr� qu'un seul instru
		
		
Exemple avec 
	- 03/04/2016 chez Pierre
		- 
	- master 03/05/2016 par Pierre
		- nickie
		- she dont
		- stop
	- Une fois chaque prise choisie pour les morceaux
		- multipiste/pris
			- enregistrements[]
				- enregistrement
					- nom : nom du fichier MP3/WAV
					- repete = NULL
					- session : session d'enregistrement studio 03/04/2016 chez Pierre
					- 
	- session
		- debut
		- fin
		- groupe
		- local
		- notes
		- c/uAt