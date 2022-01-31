# Script deploy

En utilisant la commande `sh hooks/deploy`, le script va déployer sur votre repo *vogsphere* (repository git de votre projet sur l'intra de 42)
un état de rendu en suivant les fichiers `.gitignore` et `.voginore`. Ce qui permet d'avoir un rendu différent sur votre repo git et vogsphere
(et ainsi avoir un seul répertoire de travail).

***Objectif :*** Avoir un seul repo github/vogsphere (intra 42) et push votre répertoire de rendu en une seule commande.  
***Script :*** [hooks/deploy](https://github.com/GlaceCoding/exemple_rendu/blob/main/hooks/deploy)

## Pourquoi utiliser ce script ?

Le but de ce script est d'avoir un seul répertoire avec vos fichiers *.c*. C'est à dire qu'au début vous faites un `git clone` (ou `git init`),
puis si vous devez retry, vous utilisez la commande `git remote set-url vogsphere <git@url>` pour modifier le repository de rendu. Avoir un seul
répertoire tout au long du *workflow* évite de confondre de répertoire/fichier, évite d'avoir des doublons sur son disque et, permet de suivre le
versioning plus facilement avec des commits incrementaux.

En ayant un seul répertoire de rendu, vous allez rapidement rencontrez le problème suivant : *Comment push sur sa vogsphere en ignorant vos fichiers
de test ?*. Les règles du `.gitignore` s'appliquent aux deux repository, si vous ajoutez vos fichiers de test au `.gitignore`, vous n'aurez pas
fichier sur Github et vous ne pourrez pas récupérer votre main sur un autre ordinateur.

Pour pouvoir ignorer le push de certain fichier sur la vogsphere (repository de rendu), vous avez besoin de ce script. En ajoutant vos fichiers de
test dans `.vogignore`, ils seront commit/push sur votre repo Github mais pas sur la vogsphere.

## Comment utiliser ce script ?

### Comment ajouter ce script à votre repo ?

 1. Mettre le fichier dans votre repository git, par exemple : `<repository-git>/hooks/deploy` (où `<repository-git>` contient `./.git`).
 2. Faire `git remote add vogsphere <git@vogsphere.42.fr:vogsphere/intra-uuid-...>`.
 3. Créer un `.gitignore` et `.vogignore` :
     - Le `.gitignore` doit ignorer les : `*.o`, `*.out`, `*.a`, `.DS_STORE` ([exemple](https://github.com/GlaceCoding/exemple_rendu/blob/fef8a283e6041cf27e014b8bf6beeaf39521dbef/.gitignore#L2-L3))
     - Le `.vogignore` doit ignore les fichiers/dossiers suivants : `.gitignore`, `.vogignore`, `/hooks/`…
     Puis les fichiers que vous ajoutez comme `/test`, `README.md`, etc… ([exemple](https://github.com/GlaceCoding/exemple_rendu/blob/fef8a283e6041cf27e014b8bf6beeaf39521dbef/.vogignore#L1-L5))
       
### Comment utiliser ce script ?

 4. Assurez vous d'avoir push votre travail sur votre branch `origin/master` (où origin est votre repo github) et d'avoir créé `.vogignore`
 en fonction.
 5. Déployer votre rendu avec la commande `sh hooks/deploy` (si nécessaire faites un `git checkout master`).
 6. Vous pouvez vérifier votre rendu via la branch temporaire *titanic_temp_branch* :
      - faites `git checkout titanic_temp_branch` et vérifier le contenu de votre répertoire avec `ls -la` ;
      - puis faites un `git log` et vérifiez que tout a bien été push, sur la dernière ligne, vous devez avoir *HEAD -> titanic_temp_branch* et
      *vogsphere/master* comme ceci :  
      `commit <hash> (HEAD -> titanic_temp_branch, vogsphere/master)`
 8.  **Vérifier toujours avant de `Set as finished`** votre repository de rendu en allant dans le goinfre et en faisant un `git clone <vogsphere>`.

### Comment fonctionne ce script ?

 1. Le script va commencer par stash (sauvegarder vos *unstaged changes* pour ne pas perdre votre travail) puis à créer une branch temporaire
 `titanic_temp_branch` basé sur la branch en cours.
 2. Le script va appliquer le *.vogignore* (en le concatenant au *.gitignore*), puis *untrack* tous les fichiers ignorés.
 3. Le script va commit & PR le rendu sur `vogsphere/master`.
 4. Le script va faire un commit vide dans la branch (présente à l'éxécution du script) avec en commentaire la liste des fichiers *untracked*.
 5. Le script va revert les changements appliqués au .gitignore (étape 2), et *unstash* les changements non commit (= retour à l'état d'origin
 du repos avant l'exécution du script).
 
## Besoin d'aide ?

[Poser une question](https://github.com/GlaceCoding/exemple_rendu/issues/new?labels=question)
