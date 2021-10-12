# CV

Cette idée de conception de repos provient de ma réflexion pour répondre aux besoins suviants :

1) Pouvoir push sur git les fichiers de travail (test, gitignore…) ;
2) Pouvoir push/deployer sur la vogsphere le répertoire de rendu sans les fichiers de travail. Le tout sans aucune interaction humaine pour éviter les oublis/erreurs ET pour gagner du temps.

## Fonctionnalités
 - Tests unitaires en C avec une [bibliothèque externe](https://github.com/siu/minunit).
 - Hook personnalisé empêchant de push en master et affichant un message personnalisé à chaque git push.
 - Script de deployement pour générer [un répertoire de rendu](https://github.com/GlaceCoding/exemple_rendu_vogsphere) `./hook/deploy` sans aucun fichier de travail.
 - Script github action exécutant les tests et retourne une erreur en cas de failed.

## Difficulté
 - Ne pas oublier `- uses: actions/checkout@v2` dans les github actions car ce n'est pas fait automatiquement.
 - Untrack seulement les fichiers nouvellements ajoutés au nouveau .gitignore (-> concaténation de .gitignore et .vogignore).
 - Penser à stash les changements unstaged (pour ne pas les perdre).

## Techno/compétences mobilisées
 - Github action pour les tests et valider les commits
 - Shell
 - C
 - git (stash, ls-files, checkout, push, …)
 - Tests unitaires (avec une bibliothèque externe)
 - Script pour build/deployment
 - Gestion des process de travail et déploiement dans sa globalité de la création du git au déploiement du rendu
