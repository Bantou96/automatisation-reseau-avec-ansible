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

Nous allons enfin créer un dossier de travail « ansible » 

```
mkdir /home/user/ansible

```

Et voilà !!! c'est simple comme bonjour  


## Modification du fichier de configuration

Avec la commande « ansible --version » nous avons pu localiser l'emplacement du fichier de configuration. Nous allons maintenant l'ouvrir avec la commande :

```
nano /etc/ansible/ansible.cfg

```

Dans le segment [defaults], nous allons décommenter la ligne forks et modifier la valeur par défaut du nombre de processus enfants qui sont lancés en simultanés. La valeur par défaut est 5 et nous allons le mettre à 3 afin d'optimiser la consommation de la RAM lors de l'exécution de nos playbooks.

```
[defaults]

forks          = 3

```

Ensuite, nous allons désactiver la vérification de la clé SSH lors de l'établissement de la connexion sur nos équipements distants.

```
host_key_checking = False

```

Puis nous allons ensuite désactiver les messages d'alertes pour aller vers l'essentiel lorsqu'on aura des erreurs en sortie standard après l'exécution d'un playbook

```
deprecation_warnings = False

```

Ansible utilise paramiko pour envoyer des commandes SSH
paramiko recherchera par défaut les clés SSH lors de la tentative de s'authentifier auprès des appareils distants. Ceci est un problème pour certains périphériques réseau qui ferme la connexion après un échec de clé. nous allons désactiver la fonction de recherche de clés de Paramiko.

```
[paramiko_connection]

look_for_keys = False

```

Nous allons enfin ajouter un segment très important car il permettra d'éviter les erreurs de type **« cannot allocate memory »** c'est-à-dire une augmentation rapide de la consommation en RAM et du stockage d'informations temporaires lorsque l'on utilise le mode **debug** (option -vvvv) ou que les sorties de commandes lancées depuis le playbook sont volumineuses. Pour palier à ce problème, nous allons limiter la valeur de la sortie à 100 caractères. 

Il va falloir ajouter le segment suivant à la fin du fichier de configuration (EOF --> End Of File)

```

[callback_profile_tasks ]
task_output_limit = 100

```







