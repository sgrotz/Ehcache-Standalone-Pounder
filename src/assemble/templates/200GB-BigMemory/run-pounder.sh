java -server -verbose:gc -Xloggc:/tmp/pounder.gc.log -XX:+PrintGCDetails -XX:+PrintTenuringDistribution -XX:+PrintGCTimeStamps -XX:+UseParallelGC -Dorg.terracotta.license.path=../../terracotta-license.key -Xms200m -Xmx200m -XX:+UseCompressedOops -XX:MaxDirectMemorySize=400G -cp ../../.:../../jyaml-1.3.jar:../../ehcache-pounder-0.0.11-SNAPSHOT.jar:../../ehcache-core-ee.jar:../../ehcache-ee-rest-agent.jar:../../slf4j-api-1.6.1.jar:../../slf4j-jdk14-1.6.1.jar org.sharrissf.ehcache.tools.EhcachePounder | tee /tmp/pounder.log
