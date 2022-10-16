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
1. L'administrateur a un role **ROLE_ADMINISTRATOR** et gère les utilisateurs ainsi que les annonces. Il peut : 
- se connecter à son compte,
- voir un dashboard qui résume l'application en indicateurs (exemple: Le nombre d'annonces publiées),
- créer des annonces pour lui ou un autre utilisateur,
- modifier des annonces,
- supprimer des annonces,
- créer des utilisateurs,
- modifier des utilisateurs,
- supprimer des utilisateurs.

2. Le client a un role **ROLE_ADVERTISER** et peut :
- se connecter à son compte,
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
- Un utilisateur peut se connecter et accéder d'autres fonctionnalités selon son rôle,
- Un utilisateur ayant le role **ROLE_ADMIN** peut créer, modifier, supprimer et afficher des utilisateurs,
- Un utilisateur ayant le role **ROLE_ADMIN** peut créer, modifier, supprimer et afficher des annonces pour lui ou un autre utilisateur,
- Un utilisateur ayant le role **ROLE_ADVERTISER** peut créer, modifier, supprimer et afficher ses annonces qui lui sont propres,
- Toutes les opérations CRUD sont disponibles dans la collection POSTMAN se trouvant
- Un utilisateur peut se déconnecter
### API rest
- l'adresse spécifique des APIs : 
- **Annonces**
  1. **Get annonce by id**: http://localhost:8081/api/annonce/1
  2. **Get annonces**     : http://localhost:8081/api/annonces
  3. **Post add annonces**:  http://localhost:8081/api/annonces
  4. **Put update annonces** : http://localhost:8081/api/annonces
  5. **Del annonces**     : http://localhost:8081/api/annonce/1
- **Utilisateurs**
  1. **Get user by id**   : http://localhost:8081/api/user/1
  2. **Get Users**        : http://localhost:8081/api/users
  3. **Post add users**   :  http://localhost:8081/api/users
  4. **Put update users** : http://localhost:8081/api/users
  5. **Del delete users** : http://localhost:8081/api/user/1
  
- L'API renvoie du JSON ou du XML en fonction des paramètres d’appel (header Accept)
- L’API prend en charge les méthodes GET et DELETE sur les entités représentant les **utilisateurs** ainsi que les **annonces** (ressource individuelle ou collection)


### Idées de fonctionnalités pertinentes
- L'utilisateur peut chercher des annonces dans une liste d'annonces,
- L'utilisateur peut chercher des utilisateurs dans une liste d'utilisateurs,
- L'admin peut créer une annonce pour un utilisateur autre que lui.

## Versions
Version de Grails : 3.3.8

Java : OpenJDK 1.8

Git : version non pertinente

## Technologies
Les technologies utilisées sont :
- Grails,
- HTML
- CSS
- JS

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

