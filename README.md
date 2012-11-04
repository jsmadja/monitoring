monitoring
==========

git clone git@github.com:jsmadja/monitoring.git

mvn clean jetty:run

deploiement sur ec2
===================
ssh -i jsmadjakey.pem root@107.22.192.213
git clone git://github.com/jsmadja/monitoring.git
mvn clean jetty:run
http://107.22.192.213:8080/org.springframework.samples.petclinic/

deploiement sur heroku
======================
affichage de l'application sur heroku

// configuration de monitis
creation d'un monitor ec2
creation d'un moniteur heroku

// configuration de javamelody
// affichage de javamelody

// un ptit tour sur monitis pour inspecter les chiffres obtenus

// ajout d une regression sur les performances
// commit
// push
// deploy sur ec2

// presentation de monitis et monitorus plus en détail

// constatation de la regression de perf sur monitis

// configuration d'AspectJ
// deploy sur ec2
// etude des logs pour voir d ou vient le probleme

// correction du probleme
// commit
// push
// deploy sur ec2

// présentation de javamelody en détail

// constatation de la correction de la regression

// presentation monitorus
// exemple de prix de monitis

// question / réponse