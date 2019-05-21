Kafka: 
A high throughput distributed messaging system 
Simply speaking, move data at high volumes

Why not ETL? 
Proprietary aporiaches
Need more learning
Resource intensive  
Tight coupling
Depends on source (extracting)and load system resource constraints
 
Kafka goals: 
- high throughput
- horizontally scalable 
- reliable and durable 
- loose coupling 
- flexible message semantics 

Cluster is a group of kafka brokers

Kafka + zookeeper form distributed system 
Kafka is written in Scala

Topic: 
Named data feeds that span across cluster of brokers 
Logical entity and physical represented only as a log
Producers put data to a topic 
Consumer consume from a topic

Data in kafka is immutable 

Event sourcing: 
Capturing changes as a series of time ordered immutable events 

Kafka content format: 
- Time stamp
- Identifier 
- Payload 

The Offset: 
A placeholder used by consumer to mark what is the last message it has read 
Maintained by consumer 
Uses Identifier 

Message retention policy: 
A configurable time indicating how long messages must be retained 
Default 7days
Configured for each topic 

Messages received by a topic can be checked by looking at log file in that topic folder 


