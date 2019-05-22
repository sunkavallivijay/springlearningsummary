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
Broker is nothing but a single system; ;also known as a node

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

Partition and replication :
Each partition resides on only one machine 
Each partition physically is a log file in a topic folder 
Each topic can have one or more partitions 
Messages sent to multiple partitions doesn't have global order, there by loosing message order 

Zookeeper manages all the coordination of partition creation as well read writes
More partitions lead to more overhead on zookeeper as well need for high coordination in read write 
Replication factor as with partition set at topic level 
Use describe to see metadata of a topic 


Producer :

Config: (ProducerConfig)
bootstrap.server
Key.serializer
Value.serializer

KafkaProducer
ProducerRecords class sends data to kafka
Message goes as value 
Key is optional and just provides extra info if required in future 
Microbatching: 
Send small batched data to kafka (RecordBatch class)
Kafka uses buffer to handle received message

Consumer :
Configuration same as producer
KafkaConsumer class 
Any number of topics can be subscribed by a consumer
Subscribe vs Assign
Subscribe works at topic level, assign is more advance with functionality to subscribe for a particular partition 

poll() method polls for data. It must be called in an infinite loop. 
Poll and kafka consumption is single threaded
Poll uses fetcher, metadata, subscriptionstate and consumer coordinator to achieve it's goal


