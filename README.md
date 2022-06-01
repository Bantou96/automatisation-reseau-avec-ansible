# INFORMATIONS UTILES

Le fichier [vue-d'ensemble](https://github.com/Bantou96/automatisation-reseau-avec-ansible/blob/master/vue-d'ensemble.md) contient la partie théorique vous permettant de comprendre les enjeux de l'automatisation réseau et de comprendre le fonctionnement de l'outil Ansible. 

Le fichier [ressources]() contient des liens vers la documentation officiel de Ansible et un autre lien super important pour s'approprier le langage YAML et mieux comprendre sa syntaxe.

Et oui !!! nous n'allons pas recréer la roue voyons !!!

![roue](./images/roue.jpg)

Les fichiers suivants sont intéressants à voir pour l'implémentation de la solution Ansible : 

- [installation]() --> contient une liste de commandes simples pour une installation sur une distribution Debian et les modifications importantes à apporter au niveau du fichier de configuration de Ansible afin d'éviter des erreurs lors du lancement des playbooks.  
- [commandes-utiles]() --> contient une liste de commandes nécessaire pour la sécurisation d'un fichier d'inventaire et pour le lancement des playbooks

J'ai créé une arborescence avec des fichiers en guise d'exemples de configurations.

- [hosts]() --> contient des exemples de configuration d'un fichier host sous format ini et yaml
- [cisco-playbook]() --> contient des exemples de tâches à effectuer sur les équipements cisco notamment les switches et les routeurs
- [parsers]() --> contient un exemple d'extraction de données en JSON pour les commandes qui renvoient en sortie une panoplie d'informations
- [templates-jinja2]() --> contient un exemple de modélisation de données en utilisant du Jinja2 
- [output]() --> contient le résultat de la commande show version avec utilisant du parser  
- [bonus]() --> contient un script Bash qui fait appel à expect pour l'activation du ssh sur plusieurs équipements. Puisque Ansible utilise une connexion SSH, cela peut être utile si jamais ssh n'est pas activé sur tous vos équipements switches ou routeurs. En plus de cela il y a un script qui permet de vérifier si un port est ouvert ou fermé.   

### Pour mettre en valeur sa paresse un admin doit toujours trouver le moyen d'automatiser ses tâches

Inspirez-vous de ces exemples, réduiser le temps de recherches d'informations et essayer de les faire évolués **(les futurs experts Ansible)** .



