.SUFFIXES: .erl .beam .yrl

.erl.beam:
	erlc -W $<

MODS = user_default

ERL = erl -boot start_clean

compile: ${MODS:%=%.beam} subdirs trigramsOS.tab
	@echo "make clean - clean up"

shoutcast: compile
	erl -s shout start

subdirs:
	cd socket_dist; make compile
	cd escript-4.1; make

counter1.beam: counter1.erl
	erlc -W0 counter1.erl

m1.beam: m1.erl
	erlc -Ddebug m1.erl

all: compile


trigramsOS.tab: 354984si.ngl.gz lib_trigrams.beam
	@erl -noshell -boot start_clean -s lib_trigrams make_tables\
                                        -s init stop

timer_tests:
	@erl -noshell -boot start_clean -s lib_trigrams timer_tests\
                                        -s init stop
clean:
	rm -rf *.beam lists.ebeam erl_crash.dump
	rm -rf trigramsOS.tab trigramsS.tab trigrams.dict
	cd ets_trigrams; make_clean
	cd socket_dist; make_clean