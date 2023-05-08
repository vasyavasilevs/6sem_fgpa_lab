test: counter_8bit
	./counter_8bit

counter_8bit: testbench.v counter.v
	iverilog $^ -o $@

clean:
	rm -f counter_8bit

help:
	@echo "  test  - Run testbench"
	@echo "  clean - Remove most generated files"
	@echo "  help  - Display this text"

.PHONY: clean test help
