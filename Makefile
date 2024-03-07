all: dataset

dataset: 
	$(call generate,dataset)

define generate
	mkdir -p out/$(1)
	protoc-c --c_out=out/$(1) -I schemas $(1).proto
	protoc --go_out=out/$(1) -I schemas $(1).proto
endef

clean:
	rm -r out
