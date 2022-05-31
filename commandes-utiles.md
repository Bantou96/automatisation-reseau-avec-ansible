# Lancement d'un playbook

Pour le lancement d'un playbook on utilise la commande **ansible-playbook** puis on lui donne les arguments suivants :

- La cible du playbook en utilisant l'option **-i**
- Le playbook à exécuter 

## Lancement d'un playbook avec un fichier host en .ini

```
ansible-playbook -i hosts/file.ini playbooks/config.yml
```

## Lancement d'un playbook avec un fichier host sécurisé écrit en yaml

```
ansible-playbook -i hosts/file.yaml playbooks/config.yml --vault-id user@prompt
```

## Lancement d'un playbook avec activation de la verbosité

```
ansible-playbook -i hosts/file.yaml playbooks/config.yml --vault-id user@prompt -v || -vvvv
```

## Lancement d'un playbook avec utilsation d'un tag

```
ansible-playbook -i hosts/file.yaml playbooks/config.yml --vault-id user@prompt --tags=tag_name
```
