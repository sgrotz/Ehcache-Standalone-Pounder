java -server -verbose:gc -Xloggc:%TEMP%\pounder.gc.log -XX:+PrintGCDetails -XX:+PrintTenuringDistribution -XX:+PrintGCTimeStamps -XX:+UseParallelGC -Dorg.terracotta.license.path=..\..\terracotta-license.key -Xms100m -Xmx100m -XX:+UseCompressedOops -XX:MaxDirectMemorySize=0G -cp ..\..\.;..\..\jyaml-1.3.jar;..\..\ehcache-pounder-0.0.11-SNAPSHOT.jar;..\..\ehcache-core-ee.jar;..\..\slf4j-api-1.6.1.jar;..\..\slf4j-jdk14-1.6.1.jar org.sharrissf.ehcache.tools.EhcachePounder 
