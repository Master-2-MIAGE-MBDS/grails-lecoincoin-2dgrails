# Projet grails Master 2 MBDS 2022 par DIALLO Fatoumata Binta et DIEYE Khadidiatou
## Information générales 
Cette application intitulée **LeCoinCoin** est une applliction de dépôt de vente touchant à tout ce qui peut se vendre ou s'acheter ainsi que la diffusion des annonces.

**LeCoinCoin** en plus d'être le loge de l'application, est le nom des propriétaire de la dite entreprise.

Notre objectifs pour ce projet consiste à réaliser une plateforme complète avec plusieurs modes de consultation :

- Un backend devra être réalisé pour permettre à Mr Lecoincoin d’administrer les annonces, les modifier, les supprimer et même en créer !
-  Une API REST devra être réalisée, car Mr Lecoincoin est ambitieux et il aimerait vraiment avoir une application mobile dans un futur proche.


## Profil utilisateur
Nous avons 3 profils utilisateur
- l'admin: correspondant à l'administrateur de l'application. C'est à lui de gérer les utilisateurs ainsi que les annonces. c'est à dire créer modifier ou supprimer des annonces ou utilisateurs.
- Le modérateur: qui aura également accès au back end de l'application.
- Le client: qui est réservé aux utilisateurs de la partie API qui sera développée plus tard

## Démarrage et compilation
Pour utiliser l'appliaction en locale, il faut avoir grails installé dans l'ordinateur ainsi que java. 
Pour démarrer l'application, il suffit de l'éxécuter avec la commande run de l'IDE que vous utiliserez.

#Auteur
Cette précieuse application est le résultat d'un travail collaboratif entre deux étudiantes au master 2 MBDS à l'université côte d'azur de Nice dont:
- **DIALLO Fatoumata Binta**
- **DIEYE Khadidiatou**
La partie back est largement contribuée par Mr Galli professeur au sein de l'université côte d'azur.

## Licence
Ce projet est "open source "

## Fonctionnalités

### Backend
Les différentes fonctionnalités réalisées sont:
- Une interface simple et responsive permettant de naviguer dans les différentes pages de l'application.
- Un utilisateur non connecter peut voir la liste des annonces se trouvant à la page d'accueil de l'application.
- L'utilsateur doit se connecter pour accéder à la partie backend.
- Un utilisateur peut se connecter et accéder aux différentes pages selon son rôle
- Un utilisateur ayant le role d'admin peut créer, modifer, supprimer et afficher des utilisateurs
- Un utilisateur ayant le role d'admin peut créer, modifer, supprimer et afficher des annonces avec upload des utilisateurs.
- Toutes les opérations CRUD sont disponibles
- Un utilisateur peut se déconnecter
- 
### API rest
- l'adresse spécifique des API: **Adresse**
- L'API renvoie du JSON ou du XML en fonction des paramètres d’appel (header Accept)
- L’API prend en charge les méthodes GET et DELETE sur les entités représentant les **utilisateurs** ainsi que les **annonces** (ressource individuelle ou collection)
- Documentation et test des API: 

### Idées de fonctionnalité pertinante
- L'utilsateur peut chercher des annonces dans une liste d'annonces.
- L'utilisateur peut chercher des utilisateurs dans une liste utilisateurs
- 
## Versions
Version de Grails : 3.3.8

Java : OpenJDK 1.8

Git : version non pertinente

## Technologies
Les technologies utilisées sont:
- Grails,
- java

## Comment contribuer
Pour contribuer, veuillez demander aux auteurs pour que l'on puisse créer un document contributeur.

## Versionnement
- Version 1
- Version 2 Créer une interface mobile, la commande des annonces...

## Crédit
Pour la réalisations de ce projet, nous nous sommes réssourcées de:
- http://localhost:63342/startbootstrap-sb-admin-2-gh-pages/index.html pour les tables utilisateurs
- https://docs.grails.org/5.2.4/guide/single.html
- Les documents du cours donnés par Monsieur galli.

