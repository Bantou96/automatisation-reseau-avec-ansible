# Lancement d'un playbook

Pour le lancement d'un playbook on utilise la commande **ansible-playbook** puis on lui donne les arguments suivants :

- La cible du playbook en utilisant l'option **-i**
- Le playbook à exécuter 

## Lancement d'un playbook avec un fichier host en .ini

```
ansible-playbook -i hosts/file.ini playbooks/config.yml

```

## Lancement d'un playbook avec activation de la verbosité

```
ansible-playbook -i hosts/file.ini playbooks/config.yml -v || -vvvv

```

## Lancement d'un playbook avec utilsation d'un tag

```
ansible-playbook -i hosts/file.ini playbooks/config.yml --tags=tag_name

```

# Sécurisation du fichier d'inventaire 

La première étape consiste à faire la conversion en YAML de l'inventaire écrit en INI car le format ini n'intégre pas la fonctionnalité de création d'un coffre fort de mots de passe (VAULT). 

```
ansible-inventory -i hosts/file.ini -y --list > file.yaml

```

Puis on créé notre coffre fort de mots de passe en chiffrant le mot de passe qui s'affichait en clair sur le file.ini en AES256

```
ansible-vault encrypt_string --vault-id user@prompt 'your_password' --name 'ansible_password'

ansible-vault encrypt_string --vault-id user@prompt 'your_password' --name 'ansible_become_password'

```


## Lancement d'un playbook avec un fichier host sécurisé écrit en yaml

```
ansible-playbook -i hosts/file.yaml playbooks/config.yml --vault-id user@prompt

```





