# Projet grails Master 2 MBDS 2022 par DIALLO Fatoumata Binta et DIEYE Khadidiatou
## Informations générales 
Cette application intitulée **LeCoinCoin** est une application de dépôt de vente touchant à tout ce qui peut se vendre ou s'acheter.
Dans l'application, les annonces sont publiées et visibles par tous les utilisateurs.
**LeCoinCoin** en plus d'être le nom de l'application, est le nom des propriétaires de ladite entreprise.

Notre objectif pour ce projet est de réaliser une plateforme complète avec plusieurs modes de consultation :

- Un backend est réalisé pour permettre à Mr Lecoincoin d’administrer les annonces, les modifier, les supprimer et même en créer de nouvelles.
- Des APIs REST sont réalisées, car Mr Lecoincoin est ambitieux et il aimerait vraiment avoir une application mobile dans un futur proche.


## Profil utilisateur
Nous avons deux profils utilisateurs :
1. L'administrateur qui gère les utilisateurs ainsi que les annonces. Il peut : 
- se connecter avec un compte de rôle admin,
- voir un dashboard qui résume l'application en indicateurs (exemple: Le nombre d'annonces publiées),
- créer des annonces pour lui ou un autre utilisateur,
- modifier des annonces,
- supprimer des annonces,
- créer des utilisateurs,
- modifier des utilisateurs,
- supprimer des utilisateurs.

2. Le client il peut :
- se connecter avec un compte de rôle client,
- créer des annonces pour lui,
- modifier ses annonces,
- supprimer ses annonces.

## Démarrage et compilation
Pour utiliser l'application en locale, il faut avoir grails installé dans l'ordinateur ainsi que java. 
Pour démarrer l'application, il suffit de l'exécuter avec la commande run de l'IDE que vous utiliserez.

# Auteur
Cette précieuse application est le résultat d'un travail collaboratif entre deux étudiantes au master 2 MBDS à l'université côte d'azur de Nice dont:
- **DIALLO Fatoumata Binta**
- **DIEYE Khadidiatou**
Mr Galli professeur au sein de l'université côte d'azur a beaucoup contribué sur la partie backend.

## Licence
Ce projet est "open source".

## Fonctionnalités

### Backend
Les différentes fonctionnalités réalisées sont :
- Une interface simple et responsive permettant de naviguer dans les différentes pages de l'application,
- Un utilisateur non connecté peut voir la liste des annonces se trouvant à la page d'accueil de l'application,
- L'utilisateur doit se connecter pour accéder d'autres fonctionnalités,
- Un utilisateur peut se connecter et accéder aux différentes pages selon son rôle,
- Un utilisateur ayant le role d'admin peut créer, modifier, supprimer et afficher des utilisateurs
- Un utilisateur ayant le role d'admin peut créer, modifier, supprimer et afficher des annonces avec upload des utilisateurs.
- Toutes les opérations CRUD sont disponibles
- Un utilisateur peut se déconnecter
- 
### API rest
- l'adresse spécifique des APIs : **Adresse**
- L'API renvoie du JSON ou du XML en fonction des paramètres d’appel (header Accept)
- L’API prend en charge les méthodes GET et DELETE sur les entités représentant les **utilisateurs** ainsi que les **annonces** (ressource individuelle ou collection)
- Documentation et test des APIs : 

### Idées de fonctionnalités pertinantes
- L'utilisateur peut chercher des annonces dans une liste d'annonces.
- L'utilisateur peut chercher des utilisateurs dans une liste utilisateurs
- 
## Versions
Version de Grails : 3.3.8

Java : OpenJDK 1.8

Git : version non pertinente

## Technologies
Les technologies utilisées sont :
- Grails,
- java

## Comment contribuer
Pour contribuer, veuillez demander aux auteurs pour que l'on puisse créer un document contributeur.

## Versionnement
- Version 1
- Version 2 Créer une interface mobile, la commande des annonces...

## Crédit
Pour la réalisation de ce projet, nous nous sommes ressourcées de :
- http://localhost:63342/startbootstrap-sb-admin-2-gh-pages/index.html pour les tables utilisateurs
- https://docs.grails.org/5.2.4/guide/single.html
- Les documents du cours donner par Monsieur Galli.

