CC=g++
CFLAGS=-I.
CONFIG=-std=c++17 -O3 -msse2 -msse -msse4 -mssse3 -march=native -maes -lpthread -lgmpxx -lgmp -lhiredis -lredis++ -pthread -Wl,-rpath,/usr/local/lib,./c/libblake3.so

genesse: aes.cpp rawdatautil.cpp ecc_x25519.cpp ./c/blake_hash.cpp odxt_main_single_thread.cpp main_single_thread.cpp utils.cpp
	$(CC) -o gensse_out aes.cpp rawdatautil.cpp ecc_x25519.cpp ./c/blake_hash.cpp main_single_thread.h main_single_thread.cpp utils.cpp $(CONFIG)


pre_process: gen_mkw.cpp dis_query_process.cpp dis_query_generation.cpp main.cpp
	$(CC) $(CFLAGS) -o gen_db gen_mkw.cpp dis_query_process.cpp dis_query_generation.cpp main.cpp $(CONFIG)


.PHONY: clean
clean:
	rm -rf *.o *.gch gen_db
clean_all:
	@make clean
	rm -rf update_count.csv
	@redis-cli flushall