# Installation et mise en place de l'environnement Ansible

Pour l’installation de l’outil Ansible nous aurons un seul prérequis qui est l’installation de pip (Python package manager) si on souhaite le faire dans un environnement virtuel (Docker) sinon il n’y a pas besoin de pip.

On fait d’abord la mise à jour des paquets avec la commande :

```
apt-get update

```
Puis on procède à l'installation de Ansible avec la commande :

```
apt-get install ansible

```

Nous allons maintenant vérifier la version de Ansible installée et localiser l'emplacement des fichiers avec la commande :

```
ansible --version

```

Et voilà !!! c'est simple comme bonjour  
