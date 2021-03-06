

###################
THIS APPLICATION IS NO LONGER SUPPORTED - IT WAS DEPRECIATED WITH v2 OF THE EHCACHE POUNDER. 
PLEASE USE THE NEWER VERSION INSTEAD - https://github.com/sgrotz/Ehcache-Pounder-v2
###################




This is a small app that exercises the characteristics of the Enterprise
Ehcache tiered store, including BigMemory and the disk store.

Software and/or updates can be found here: 
https://github.com/sgrotz/Ehcache-Standalone-Pounder


1. DOWNLOAD ENTERPRISE EHCACHE

You must use a version of Enterprise Ehcache that supports BigMemory
to use this sample.  You may download an evaluation copy of Enterprise
Ehcache and the license key from terracotta.org:

    http://terracotta.org/dl/dowload-bigmemory


2. RUN THE TUTORIAL

See the tutorial material on terracotta.org:

    http://terracotta.org/start/bigmemory-tutorial


3. BEFORE YOU START

Before you can use the pounder, make sure that you place the ehcache core libraries
in the pounder root folder. 

<EhCachePounder>/
  - ehcache-core-ee.jar
  - ehcache-ee-rest-agent.jar
  - ehcache-terracotta-ee-x.x.x.jar
  - terracotta-toolkit-x.x-runtime-ee-y.y.y.jar
  
The libraries (and their versions) are referenced from within the startup scripts, please make sure to amend them if needed. 


4. TEST DIFFERENT CONFIGURATIONS

If you want to test configurations other than those pre-defined in the
templates, you can alter the configuration as set in the config.yml file. All
settings are mandatory.

IMPORTANT: The offHeapSize in the config file + the heap size on the java
commandline + the memory needed by the OS MUST be less than the physical memory
on the machine.

NOTE: To alter the heap size, you must edit run-pounder.sh

CONFIGURATION PARAMETERS

storeType
  OFFHEAP|DISK|ONHEAP

threadCount
  The number of execution threads.

entryCount
  The Total number of entries to load in the load phase and the number of
  operations to perform in the read/update phase.

offHeapSize
  The amount of ram to dedicate to offheap (NOTE: you also have to have at
  least that number in the -XX:MaxDirectMemorySize=4g).

maxOnHeapCount
  The maximum number of cache entries that may be stored on the JVM heap.  If
  you have a fairly static hot set of entries that fits in a heap size small
  enough to avoid long garbage collection pauses, set this to the size of that
  hot set.  If you don't have such a hot set, use 1024 as a default value.

batchCount
  How often to print the current status and change the entry size for each thread.

maxValueSize
  Max size in bytes of the value portion of the entry (a random number is picked bellow this).

minValueSize
  Min size in bytes of the value portion of the entry (a random number is picked above this).

hotSetPercentage
  Percentage of time you hit an entry from the on-heap portion of the cache
  (see maxOnHeapCount).

rounds
  Number of times your execute entryCount operations matching the above config elements.

updatePercentage
  Number of times out of 100 that you update an entry instead of reading.

diskStorePath
  Location to store the files for the disk store.

monitoringEnabled
  Enable monitoring with the Terracotta Management Console
  
useTerracottaArray
  Enable or disable the use of a L2 Terracotta Server Array. (true/false)
  
TerracottaArrayURL
  URL pointing to the Terracotta Server Array. Will use "localhost:9510" as default.
  
Consistency
  Set the transaction consistency level - valid entries are: eventual / strong
  
Concurrency
  Set the Terracotta Server Array concurrency value: 0 = Disabled (TSA will automatically choose!)
  or any positive integer value

nonStopCache
  Enable the local cache to be a non-stop cache. This would allow the client to continue reading from 
  the cache even if the TSA server goes down. (boolean - true/false)
  
nonStopTimeoutMillis
  The timeout value for the non stop cache. (default 30000)

nonStopTimeoutBehavior
  What is the default behaviour for accessing an object while the TSA is unavailable. (localreads, noop, exception)

ehcacheFileEnabled
  Instead of using the Pounder build in functionality to create its own designated cache, you can also specify a cache through an external xml file. 
  PLEASE NOTE: The external cache has to be a basic cache without any search attributes and/or object specifications. The pounder will write unstructured 
  sample data to the cache. If there are constraints, the pounder will fail. 

ehcacheFileURL
  Specify where to find the ehcache.xml file. By default it should be in the root directory, use: ..\..\ehcache.xml
  
ehcacheFileCacheName
  The ehcache file can contain several caches. Please specify here, which cache to use. For example: myTestCache
  


EXAMPLE CONFIGURATION

storeType: OFFHEAP
threadCount: 33
entryCount: 1000000
offHeapSize: "1G"
maxOnHeapCount: 5000
batchCount: 50000
maxValueSize: 800
minValueSize: 200
hotSetPercentage: 99
rounds: 40
updatePercentage: 10
diskStorePath: /export1/dev
monitoringEnabled: false
useTerracottaArray: false
TerracottaArrayURL: localhost:9510
Consistency: eventual
nonStopCache: false
nonStopTimeoutMillis: 30000
nonStopTimeoutBehavior: localreads
ehcacheFileEnabled: false
ehcacheFileURL: ..\..\ehcache.xml
ehcacheFileCacheName: myTestCache
