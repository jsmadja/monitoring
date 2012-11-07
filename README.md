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

configuration de monitis
========================
creation d'un monitor ec2
http://107.22.192.213:8080/org.springframework.samples.petclinic/vets

configuration de javamelody
===========================

Dans le pom.xml

  	<javamelody-version>1.41.0</javamelody-version>

<dependency>
  		<groupId>net.bull.javamelody</groupId>
			<artifactId>javamelody-core</artifactId>
			<version>${javamelody-version}</version>
		</dependency>

Dans le web.xml

<filter>
                <filter-name>monitoring</filter-name>
                <filter-class>net.bull.javamelody.MonitoringFilter</filter-class>
        </filter>
        <filter-mapping>
                <filter-name>monitoring</filter-name>
                <url-pattern>/*</url-pattern>
        </filter-mapping>
        <listener>
                <listener-class>net.bull.javamelody.SessionListener</listener-class>
        </listener>

Dans applicationContext-hibernate.xml
<prop key="hibernate.jdbc.factory_class">net.bull.javamelody.HibernateBatcherFactory</prop>

Instant demo
============
// affichage de javamelody
// un ptit tour sur monitis pour inspecter les chiffres obtenus

Ajout d une regression sur les performances
===========================================
// commit
// push
// deploy sur ec2

// presentation de monitis et monitorus plus en détail

// constatation de la regression de perf sur monitis

Configuration d'AspectJ
=======================


// deploy sur ec2
// etude des logs pour voir d ou vient le probleme

Correction du probleme
======================

// commit
// push
// deploy sur ec2

Instant demo
============
Présentation de javamelody en détail


Constatation de la correction de la regression
==============================================

Instant demo
============
// presentation monitorus
// exemple de prix de monitis


Questions / Réponses
====================
