REBAR=rebar

.PHONY: all clean test

all:
	@$(REBAR) compile

edoc:
	@$(REBAR) doc

test:
	@rm -rf .eunit
	@mkdir -p .eunit
	@$(REBAR) eunit

ct:
	@$(REBAR) compile
	@$(REBAR) ct

clean:
	@$(REBAR) clean

build_plt:
	@$(REBAR) build-plt

dialyzer:
	@$(REBAR) dialyze
