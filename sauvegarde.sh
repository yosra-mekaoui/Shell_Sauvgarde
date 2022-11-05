#!/bin/bash 

. fonctions # include le fichier contenant les fonctions  


#****************************************************** DEBUT **************************************************************

if [ $# -eq 0 ] # Verifier s'il y a des arguments  si non appel à show_usage
then 
	show_usage 
	exit 0
else 

 while getopts "hgmvnras" option  
do
case $option in
        n)
        #Appel de la fonction pour afficher le nombre de fichier et la taille totale occupée des fichiers modifiés dans les dernières 24heures
        clear
        echo -e "\e[1;92m Vous avez selectioner la fonction pour afficher le nombre de fichier et la taille totale occupée des fichiers modifiés dans les dernières 24heures :   \e[0m "
	calcul_nbre_taille_fichiers
;;
        a)
        #Appel de la fonction pour archiver dans une « archive tar » tous les fichiers de votre répertoire personnel (/home/votre-nom) qui ont été modifiés dans les dernières 24 heures 
        clear
        echo -e "\e[1;92m   Vous avez selectioner la fonction pour archiver tous les fichiers de votre répertoire personnel (/home/votre-nom) qui ont été modifiés dans les dernières 24 heures : \e[0m " 
	read -p "Veuillez entrez un nom pour votre archive :  " OPTARG
	Archiver $OPTARG
;;
        
        r)
        #Appel de la fonction pour renommer l’archive avec la date et l’heure de la modification
        echo -e "\e[1;92m Vous avez selectioner la fonction pour renommer l’archive avec la date et l’heure de la modification : \e[0m "
	read -p "Donner le nom du fichier: " OPTARG
        rename $OPTARG
;;
	s)
	#Appel de la fonction pour sauvegarder les informations sur les fichier archivé (nom-type-droit d’accès-date et heure de modification) dans un fichier passé en argument
	echo -e "\e[1;92m  Vous avez selectioner la fonction pour afficher un menu textuel :   "
	read -p "Veuillez entrez un nom pour votre fichier de sauvegarde : " OPTARG
	SauvegarderInfos $OPTARG
;;
	m)
	#Appel de la fonction pour l'éxécution du menu textuel 
	echo -e "\e[1;92m  Vous avez selectioner la fonction pour afficher un menu textuel :  \e[0m "
	TextMenu
;;
	g)
	#Appel de la fonction pour afficher un menu graphique avec zenity
	echo -e "\e[1;92m  Vous avez selectioner la fonction pour afficher un menu graphique :  \e[0m "
	Graphiquemenu
;;
	v)
	#Appel de la fonction pour afficher le nom des auteurs et version du code.
	echo -e "\e[1;92m  Vous avez selectioner la fonction pour afficher le nom des auteurs et version du code : \e[0m "
	author
;;
	h)
	#Appel de la fonction pour afficher le texte du help à partir d'un fichier avec cat
	echo -e "\e[1;92m  Vous avez selectioner la fonction pour afficher le help détaillé :  \e[0m "
	help_me
	
;;
	*)
	#En cas de choix inexistant affichage d'un message d'erreur 
	clear
	echo -e "\e[1;92m Erreur! Votre choix ne figure pas dans la liste*   \e[0m "	 			
	show_usage
;;


esac
done

exit 0
 fi
 
 
