# Welcome

Quand on est responsable d’un réseau d’entreprise, on sait probablement que de nombreuses opérations manuelles sont effectuées via l’interface de ligne de commande (CLI). Il n’est pas surprenant que le principal défi que rencontrent des utilisateurs en matière de réseau consiste à améliorer leur agilité.

![cli](./images/cli-use.png)

Etant jeune ingénieur en sécurité des systèmes et des communications, j'ai très vite compris qu'avoir des compétences en scripting rendrait les tâches d'administration moins fastidieuses surtout lorsqu'on évolue dans une entreprise avec un parc informatique très vaste.

L'objectif est de répondre au besoin d'automatisation et donc de simplification des tâches de configurations réseaux (création, suppression et modification).
J'ai essentiellement travaillé sur la partie automatisation de la configuration des équipements réseaux particulièrement ceux de Cisco. 

Les logiciels d'automatisation sont aujourd'hui de plus en plus utilisés car elles comportent des modules réseaux permettant de configurer toute la pile d'equipements niveau 2 et 3, de tester et de valider les changements apportés. 

![start](./images/let's-start.jpg)

## Choix de l'outil d'automatisation
Au niveau le plus basique, il est possible d'automatiser les composants réseau à l'aide de commandes et d'arguments de ligne de commande standard. Par exemple, on peut utiliser les opérateurs BASH pour créer des chaînes d'événements selon que la commande précédente a réussi (&&) ou échoué (||). Nous pouvons aussi compiler des listes de commandes dans des fichiers texte (aussi appelés scripts Shell), qui peuvent être exécutés de manière répétée et simultanée en une seule commande.

Les outils d’automatisation open source Ansible, Salt et StackStorm peuvent être utilisés pour automatiser les périphériques réseau. 

![tableau](./images/tableau.PNG)

l’utilisation d’un outil qui implique l’installation de modules sur chaque équipement de notre réseau serait encore plus fastidieuse et rendrait l’idée d’automatisation très compliquée. Cette problématique m’a permis de réfléchir d’abord sur le choix d'un outil **sans agent**.

Pour la suite de cette aventure sur l'automatisation réseau nous allons travaillé avec l'outil Ansible qui a l'avantage d'avoir une grande communauté, une documentation assez fournie et un langage **YAML** qui est tout simplement du texte. 

Cool non !!!

![enjoy](./images/enjoy.png)

## Présentation
**Un peu d'histoire**

Une « ansible » est un dispositif théorique permettant de réaliser des communications à une vitesse supraluminique (supérieure à la vitesse de la lumière) imaginé en 1966 par Ursula K. Le Guin dans son roman de science-fiction, Le Monde de Rocanon.  

Parmi les outils d’automatisation des configurations et des déploiements, Ansible fait partie des plus populaires. Il a été conçu par un ancien employé Red Hat, Michael DeHaan, également auteur de l’application de serveur de « provisionning » Cobbler et co-acteur du framework Func pour l’administration à distance. Red Hat a racheté la société Ansible,Inc en octobre 2015. 

![ansible](./images/ansible.png)

Ansible permet de faire de l’infrastructure un code et est disponible sous licence GPL v3 (GNU General Public Version 3.0), il s’adosse au protocole d’authentification réseau sécurisée (SSH) pour déployer les mises en production de code via des fichiers décrivant les configurations à appliquer aux équipements.  
Il répond aux besoins des Admin système / Cloud, aux admins de stockage pour une automatisation des serveurs, du réseau et du stockage. 

![admin](./images/admin-need.png)

## Fonctionnement

Ansible fonctionne sur de nombreux systèmes de type Unix, et peut configurer aussi bien des systèmes de type Unix que Microsoft Windows. L’outil est sans agent car il n’est pas nécessaire d’installer des logiciels supplémentaires sur les nœuds secondaires. Il faut juste qu’Ansible puisse se connecter temporairement à distance via **SSH** ou **Windows Remote Management** (permettant l’exécution à distance de PowerShell) pour effectuer ses tâches. 
Ansible gère les différents équipements avec un accès à distance natif (tels que les protocoles cités ci-dessus) et il comprend son propre langage déclaratif pour décrire la configuration du système. Il offre des capacités de parallélisation, collecte de métadonnées et gestion des états. L’aspect de conception « agentless » installé sur le périphérique est important car il réduit les besoins d’infrastructure pour démarrer une gestion. 
Les modules fonctionnent grâce à **JSON** en sortie standard et peuvent être écrits dans n’importe quel langage de programmation. Le système utilise notamment **YAML** pour exprimer des descriptions réutilisables et traite les variables grâce à des modèles Jinja2.  
Manipuler Ansible consiste à écrire du texte géré sous forme de code informatique. En vue de contrôler des nœuds distants, des utilisateurs lancent des **« playbooks »** (livres de jeu) à partir d’un nœud de contrôle grâce à Ansible Engine.

Ansible Engine utilise différents composants comme :
-	Des modules 
-	Des plugins
-	Un API
-	Un inventaire 
-	Des collections


![archi](./images/archi.png)

## Définition des termes

- **Les modules**

Les modules sont “les outils dans la boîte-à-outils”.
Ansible fonctionne en se connectant aux nœuds à gérer et en leur envoyant des petits programmes, appelés “modules Ansible”. Ces programmes sont écrits pour être des modèles de ressources de l’état souhaité du système. Ansible exécute ensuite ces modules (via SSH par défaut) grâce au protocole JSON sur la sortie standard et les supprime lorsque l’action est terminée.
La bibliothèque de modules peut résider sur n’importe quelle machine et sans aucun serveur central, démon ou base de données. Rien n’interdit d’écrire son propre module. Ces modules peuvent contrôler les ressources comme des services, des paquets ou des fichiers (n’importe quoi en réalité), ou encore exécuter des commandes système.

- **Les plugins de connexion**

Les plug-ins de connexion permettent à Ansible de se connecter aux hôtes cibles afin d’exécuter des tâches sur ceux-ci. Ansible est livré avec de nombreux plugins de connexion, mais un seul peut être utilisé par hôte à la fois. Les plus utilisés sont les types de connexion Paramiko SSH, SSH natif (appelé simplement SSH) et local. 

- **Les collections**

Les collections sont un format de distribution pour du contenu Ansible qui peut inclure des livres de jeu, des rôles, des modules et des plugins. Les collections sont distribuées par Ansible Galaxy. 

- **L’inventaire**

Pour démarrer une gestion Ansible, on a besoin d’un inventaire. Par défaut, Ansible représente les machines qu’il gère à l’aide d’un fichier INI très simple qui place toutes les machines gérées dans des groupes de notre choix. Une fois que les hôtes d’inventaire sont répertoriés, des variables portant sur les cibles de gestion, peuvent leur être attribuées dans des fichiers texte simples. 

Un jeu est une analogie sportive qui définit un état ou un modèle.

![diagramme](./images/diag.png)

Chaque livre de jeu est composé d’une ou plusieurs “séances de jeu (plays)” exposés sous forme d’une liste.
Un “livre de jeu” organise des tâches en jeux. Le module quant à lui permet d'exécuter une serie d'actions.
Mais il serait une bonne pratique de l’organiser en rôles. Un rôle ajoute un niveau d’abstraction dans l’exécution des tâches d’un livre de jeu. 

## Exécution des tâches

Dans la partie exécution des tâches nous avons d’autres termes qui sont utilisés.
Une tâche est l’appel à un module Ansible. Le module Ansible contient localement tout le code utile à l’exécution. Il est donc important de disposer du code à jour des modules et de pouvoir exécuter du code python car c’est le langage qui est utilisé en background au niveau du nœud principal dans notre cas puisqu’on agit sur des équipements réseaux. 

![execution](./images/execution.png)

Il existe deux principaux modes d’exécution des tâches avec Ansible :

- **Le mode Ad-Hoc**

Il permet l’exécution de tâches parallèles. Dès qu’une instance est disponible, on peut lui parler immédiatement, sans aucune configuration supplémentaire. Un accès à des modules de ressources basés sur des états, ainsi qu’à des commandes brutes est disponible. Ces modules sont assez faciles à écrire.

- **Les Playbooks (Livres de jeu)**

Les livres de jeu (playbooks) sont écrits selon un langage d’automatisation simple et puissant. Les livres de jeu peuvent orchestrer avec précision plusieurs parties d’une topologie d’infrastructure, avec un contrôle très détaillé du nombre de machines à traiter à la fois.
Les livres de jeu sont écrits en langage YAML, Ain’t Markup Language. YAML expose un minimum de syntaxe et propose un modèle de configuration ou de processus plutôt qu’un langage de script ou de programmation.

J’ai pratiquement utilisé que le mode d’exécution Playbooks dans la phase implémentation de la solution. 


## Practice: Customize your first GitHub website by writing HTML code

Want to edit the site you just published? Let’s practice commits by introducing yourself in your `index.html` file. Don’t worry about getting it right the first time—you can always build on your introduction later.

Let’s start with this template:

```
<p>Hello World! I’m [username]. This is my website!</p>
```

To add your introduction, copy our template and click the edit pencil icon at the top right hand corner of the `index.html` file.

<img width="997" alt="edit-this-file" src="https://user-images.githubusercontent.com/18093541/63131820-0794d880-bf8d-11e9-8b3d-c096355e9389.png">


Delete this placeholder line:

```
<p>Welcome to your first GitHub Pages website!</p>
```

Then, paste the template to line 15 and fill in the blanks.

<img width="1032" alt="edit-githuboctocat-index" src="https://user-images.githubusercontent.com/18093541/63132339-c3a2d300-bf8e-11e9-8222-59c2702f6c42.png">


When you’re done, scroll down to the `Commit changes` section near the bottom of the edit page. Add a short message explaining your change, like "Add my introduction", then click `Commit changes`.


<img width="1030" alt="add-my-username" src="https://user-images.githubusercontent.com/18093541/63131801-efbd5480-bf8c-11e9-9806-89273f027d16.png">

Once you click `Commit changes`, your changes will automatically be published on your GitHub Pages website. Refresh the page to see your new changes live in action.

:tada: You just made your first commit! :tada:

## Work with GitHub on your computer using GitHub Desktop

**GitHub Desktop** is a free app from GitHub for Windows and Mac that allows you to easily work with your GitHub repositories from your computer. You just saw how you can commit to a repository from GitHub.com, but most developers do the majority of their work from their computer (locally) before pushing it up to GitHub. So let’s try that out!

[Download GitHub Desktop](https://desktop.github.com/)

## Practice: Use GitHub Desktop and an editor to make a change from your computer

Start by downloading GitHub Desktop if you haven’t already done so, and install it on your computer. Go through the GitHub Desktop onboarding steps, and when you get to the “Let’s get started” screen, go ahead and choose the repository you were just working with on GitHub.com, and click “Clone.”

### Using an editor to make changes

Let’s make sure you have a text editor on your computer - this is what you'll use to actually make changes to your files. If you already know you have an editor, then skip to the next step. Otherwise, download and install either [Visual Studio Code](https://code.visualstudio.com/) or [Atom](https://atom.io/) and restart GitHub Desktop before proceeding to the next step.

Let’s make a change to your GitHub Pages site, just like you did on GitHub.com, except this time we’re going to do it all from your computer. From GitHub Desktop, click the “Open in…” button in the middle of the screen to “open the repository in your external editor” that you just downloaded. 

![Open-in-editor](https://user-images.githubusercontent.com/721500/63188833-82fb9600-c030-11e9-8777-a67c1713d59f.png)

In the left sidebar, click the `index.html` file to open it, and go ahead and add another line. Maybe, “Building websites is fun! You should try it too!” or whatever you want to add. 

![Make-changes](https://user-images.githubusercontent.com/721500/63188832-82fb9600-c030-11e9-9f7b-7d15385a16f0.png)

Now switch back to GitHub Desktop, and you should see the change you made.

![View-changes](https://user-images.githubusercontent.com/721500/63188835-82fb9600-c030-11e9-8980-43a8231ca23a.png)

### Commit your changes

Now you can commit your changes by typing a message in the `Summary` box at the bottom left, and then click the blue `Commit` button below that.

![Commit-changes](https://user-images.githubusercontent.com/721500/63188831-8262ff80-c030-11e9-809a-f87d8b544935.png)

### Push your changes to GitHub.com

One of the great things about working on things on your computer is that you get to control when other people see them. Now let’s push your commit to GitHub.com as well so it’s saved there and you can publish it to your site. Click the “Push origin” button to push your commit to GitHub.com. 

![Push-to-GitHub](https://user-images.githubusercontent.com/721500/63188834-82fb9600-c030-11e9-9d8e-6c6ed6d48504.png)

Now click the “View on GitHub” button to get back to your repository’s page on GitHub.com.

![View-on-GitHub](https://user-images.githubusercontent.com/721500/63188836-82fb9600-c030-11e9-9bc5-cf304398500d.png)

### Deploy and see your changes live on your GitHub Pages website!

Once you commit your changes, they are automatically published on your GitHub Pages website. Refresh your browser to see it live!

### Celebrate!

Hooray! Now you have your repository linked between your computer and GitHub.com. In the future, you can use GitHub Desktop to push any changes you decide to make from your computer.

## Extra Credit: Keep on building!

Change the placeholder Octocat gif on your GitHub Pages website by [creating your own personal Octocat emoji](https://myoctocat.com/build-your-octocat/) or [choose a different Octocat gif from our logo library here](https://octodex.github.com/). Add that image to line 12 of your `index.html` file, in place of the `<img src=` link.

Want to add even more code and fun styles to your GitHub Pages website? [Follow these instructions](https://github.com/github/personal-website) to build a fully-fledged static website.

![octocat](./images/create-octocat.png)

## Everything you need to know about GitHub

Getting started is the hardest part. If there’s anything you’d like to know as you get started with GitHub, try searching [GitHub Help](https://help.github.com). Our documentation has tutorials on everything from changing your repository settings to configuring GitHub from your command line.
