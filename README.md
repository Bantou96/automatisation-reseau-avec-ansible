# INFORMATIONS UTILES

Le fichier [vue-d'ensemble](https://github.com/Bantou96/automatisation-reseau-avec-ansible/blob/master/vue-d'ensemble.md) contient la partie théorique vous permettant de comprendre les enjeux de l'automatisation réseau et de comprendre le fonctionnement de l'outil Ansible. 

Le fichier [ressources](https://github.com/Bantou96/automatisation-reseau-avec-ansible/blob/master/ressources.md) contient un lien super important pour s'approprier le langage YAML et mieux comprendre sa syntaxe et un autre lien vers la documentation officielle de Ansible sur la partie automatisation réseau.

Et oui !!! nous n'allons pas recréer la roue voyons !!!

![roue](./images/roue.jpg)

Les fichiers suivants sont intéressants à voir pour l'implémentation de la solution Ansible : 

- [installation](https://github.com/Bantou96/automatisation-reseau-avec-ansible/blob/master/installation.md) : contient une liste de commandes simples pour une installation sur une distribution Debian et les modifications importantes à apporter au niveau du fichier de configuration de Ansible afin d'éviter des erreurs lors du lancement des playbooks.  
- [commandes-utiles](https://github.com/Bantou96/automatisation-reseau-avec-ansible/blob/master/commandes-utiles.md) : contient une liste de commandes nécessaire pour la sécurisation d'un fichier d'inventaire et pour le lancement des playbooks

J'ai créé une arborescence avec des fichiers en guise d'exemples de configurations.

- [hosts](https://github.com/Bantou96/automatisation-reseau-avec-ansible/tree/master/hosts) : contient des exemples de configuration d'un fichier host sous format ini et yaml
- [cisco-playbook](https://github.com/Bantou96/automatisation-reseau-avec-ansible/tree/master/cisco-playbook) : contient des exemples de playbooks que vous serez appelé à écrire et à lancer sur vos équipements cisco notamment les switches et les routeurs. 
- [parsers](https://github.com/Bantou96/automatisation-reseau-avec-ansible/tree/master/parsers) : contient un exemple d'extraction de données en JSON pour les commandes qui renvoient en sortie une panoplie d'informations
- [templates-jinja2](https://github.com/Bantou96/automatisation-reseau-avec-ansible/tree/master/templates-jinja2) : contient un exemple de modélisation de données en utilisant du Jinja2 
- [output](https://github.com/Bantou96/automatisation-reseau-avec-ansible/tree/master/output) : contient le résultat de la commande show version avec utilisant du parser afin d'avoir une sortie en JSON sous forme de dictionnaire (couple clé/valeur).   
- [bonus](https://github.com/Bantou96/automatisation-reseau-avec-ansible/tree/master/bonus) : contient un script Bash qui fait appel à expect pour l'activation du ssh sur plusieurs équipements. Puisque Ansible utilise une connexion SSH, cela peut être utile si jamais ssh n'est pas activé sur tous vos équipements switches ou routeurs. En plus de cela il y a un script qui permet de vérifier si un port est ouvert ou fermé.   

### Inspirez-vous de ces exemples et réduisez le temps consacré à la recherche d'informations.


#### N'hésitez pas à poser vos questions [ICI](https://github.com/Bantou96/automatisation-reseau-avec-ansible/discussions)

![enjoy](./images/enjoy.png)
