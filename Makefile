CLASSPATH = "lucene/modules/*"
RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))

buildtoyindex:
	java -cp $(CLASSPATH) org.apache.lucene.demo.IndexFiles -docs $(RUN_ARGS)

querytoyindex:
	java -cp $(CLASSPATH) org.apache.lucene.demo.SearchFiles

.PHONY: clean cleanall installdeps

clean:
	rm bin/*.class

cleanall:
	rm -r lucene bin

installdeps:
	curl "https://dlcdn.apache.org/lucene/java/9.8.0/lucene-9.8.0.tgz" --output lucene.tgz
	tar xvf lucene.tgz
	mv lucene-* lucene
