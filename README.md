# exemple_rendu
Exemple de repos pour la vogsphere

Le contenu du repos [git@github.com:GlaceCoding/exemple_rendu_vogsphere.git](https://github.com/GlaceCoding/exemple_rendu_vogsphere) a été généré via le script :

```sh
sh ./hooks/deploy
```

**Objectif du script :** Avoir un seul repo github/vogsphere (intra 42) et push votre répertoire de rendu en une seule commande.

Plus d'explication sur le script de déploiement : [hooks/README.md#script-deploy](https://github.com/GlaceCoding/exemple_rendu/tree/main/hooks#script-deploy)  


# Init step

## 1) Init the repos

After a `git clone`, you have to use this command : `git config core.hooksPath hooks`.

## 2) Add vogsphere

Add vogsphere remote with `git remote` :

```sh
git remote add vogsphere https://github.com/GlaceCoding/exemple_rendu_vogsphere.git
```

