

![LittleWord_Logo](https://user-images.githubusercontent.com/97435667/223672992-1b340f00-3841-44f1-b77b-2f41cabc044d.png)


# LittleWords

## Description du projet :

Application android codé en Flutter sur Android Studio. Cette application est un jeu de ramassage de mots, qui permettra à l'utilisateur de ramasser des mots et les remettre par terre pour que les autres puisse ramasser le mots pour le modifier ou le rejeter par terre.

## Objectifs du projet :

[ ] 1.  Détruire un mot ramassé.
        DELETE en BDD locale.
        L'élément détruit doit disparaitre de la liste automatiquement (provider ?)

[ ] 2.  Redéposer un mot sur la carte
        PUT https://backend.smallwords.samyn.ovh/word/{uid}
        {content: String, latitude: Float, longitude: Float}
        
        IMPORTANT: Le contenu du mot ne doit pas être modifié

[ ] 3.  Afficher une carte dans le premier onglet à la place de la liste
        Utiliser la dépendance : flutter_map et word_around.provider

## TP : -- ✅

1. Afficher un champs texte et un bouton de validation en dessous -- ✅
2. Desactiver le boutons le champs texte est vide (trim) -- ✅
3. Créer un ConsumerWidget pour représenter le bouton -- ✅

3.1. Dans ce Widget utiliser le device_location.provider.dart pour récupérer la position -- ✅

4. Construire un WordDTO avec : -- ✅
- uid : null -- ✅
- content : valeur du champs text -- ✅
- author : nom utilisateur stocké dans les sharedPrefs -- ✅
- latitude et longitude: données du device location provider -- ✅

5. Utiliser de dio.provider pour faire l'appel POST au service / word -- ✅
6. Quand l'appel POST est terminé, on ferme le formulaire de création et on refresh -- ✅

BONUS :
- Donner le focus au champ text dès l'ouverture de la modal -- ✅
- Limiter le nombre de caractère saisissable à 144 -- ✅
- Afficher un compte x/144 -- ✅


## Template :

Durant ce projet nous nous sommes appuié sur des templates pour les differentes pages.

#### Page de login :

![Page_Login](https://user-images.githubusercontent.com/97435667/223670999-de01976c-db3a-4932-93e5-b120779e758e.png)

Une fois arrivé sur cette page, elle vous permettera de vous connecter avec un nom et pouvoir éditer des motspour les mettre par terre ensuite.

### La première page :

![Page_Principale_1](https://user-images.githubusercontent.com/97435667/223671581-e721c427-80fa-4d5f-9c2d-a164fb94032a.png)

Cette page est la première page avec tout les mots afficher autour de nous. 

Le bouton en bas à droite, permet de créé des mots et ensuite de mettre par terre :

![Page_Creation_Mots](https://user-images.githubusercontent.com/97435667/223671973-bfd20c5c-b82b-4de8-a944-8a819afb9d13.png)

### La deuxème page :

Cette page est accessible de la première page avec la barre de navigation en bas. 

![Page_Principale_2](https://user-images.githubusercontent.com/97435667/223672210-d3f6e2bf-31ea-407b-b15f-69ebc239d80d.png)

Vous pourrez ensuite cliquer sur un petit mot pour avoir le menu qui decidera quoi faire du petit mot :

![Page_Gestion_Mots](https://user-images.githubusercontent.com/97435667/223672518-4a49c828-869b-4345-b57a-98dcded5afeb.png)



## Collaborateurs :

- [@BuathierTom](https://github.com/BuathierTom)
- [@QuentinGilleron](https://github.com/QuentinGilleron)


## License
Distributed under the [MIT](https://choosealicense.com/licenses/mit/) License.


