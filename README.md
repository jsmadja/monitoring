monitoring
==========

    git clone git@github.com:jsmadja/monitoring.git

    mvn clean tomcat:run

http://localhost:8080/org.springframework.samples.petclinic/

deploiement sur ec2
===================
    ssh -i jsmadjakey.pem ubuntu@107.22.192.213
    git clone git://github.com/jsmadja/monitoring.git
    mvn clean tomcat:run

http://ec2-23-22-208-47.compute-1.amazonaws.com:8080/org.springframework.samples.petclinic/

configuration de monitis
========================
creation d'un monitor ec2

http://ec2-23-22-208-47.compute-1.amazonaws.com:8080/org.springframework.samples.petclinic/vets

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

Ajout d une regression sur les performances
===========================================

Dans Person.java

    public String getFirstName() {
        try {
            TimeUnit.MILLISECONDS.sleep(100);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return this.firstName;
    }

// commit
// push
// deploy sur ec2

Instant demo
============
// presentation de monitis et monitorus plus en détail
// constatation de la regression de perf sur monitis

Configuration d'AspectJ
=======================

Dans le pom.xml

    <dependency>
        <groupId>org.aspectj</groupId>
        <artifactId>aspectjrt</artifactId>
        <version>1.6.10</version>
    </dependency>

    <plugin>
        <groupId>org.codehaus.mojo</groupId>
        <artifactId>aspectj-maven-plugin</artifactId>
        <version>1.3.1</version>
        <configuration>
            <source>1.6</source>
        </configuration>
        <executions>
            <execution>
                <goals>
                    <goal>compile</goal>
                </goals>
            </execution>
        </executions>
    </plugin>   


Ajout d'un fichier Chrono.aj

    package org.springframework.samples.petclinic;

    import org.apache.commons.lang.StringUtils;
    import org.slf4j.Logger;
    import org.slf4j.LoggerFactory;

    public aspect Chrono {

    private static final Logger LOG = LoggerFactory.getLogger(Chrono.class);

    Object around() : execution(public * org.springframework.samples.petclinic..*(..)) {
        long start = System.currentTimeMillis();
        try {
            return proceed();
        } finally {
            String prefix = "";
            Object method = thisJoinPointStaticPart.getSignature();
            long end = System.currentTimeMillis();
            long duration = end - start;
            if(duration > 50)
                prefix = "SLOW METHOD";
            if(!prefix.isEmpty())
                LOG.info(prefix+" "+method+" "+duration+" ms");
        }
    }
    }

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
