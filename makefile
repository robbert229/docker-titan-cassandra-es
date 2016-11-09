image:
	docker build -t robbert229/titan-cassandra-es . 

run: 
	docker run --name cassandra -d -p 9042:9042 -p 9160:9160 scylladb/scylla
	docker run --name elasticsearch -d -p 9200:9200 -p 9300:9300 elasticsearch:1.6
	docker run --name titan-cassandra-es --rm --link elasticsearch --link cassandra --link elasticsearch -p 8182:8182 robbert229/titan-cassandra-es

stop:
	docker stop titan-cassandra-es
	docker rm titan-cassandra-es

	docker stop cassandra
	docker rm cassandra

	docker stop elasticsearch
	docker rm elasticsearch