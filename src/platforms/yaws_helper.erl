% Nitrogen Web Framework for Erlang
% Copyright (c) 2008 Rusty Klophaus
% See MIT-LICENSE for licensing information.

-module (yaws_helper).
-export ([start/0]).

start() ->
	% Initialize Nitrogen.
	wf:init(),
	{Port, DocumentRoot} = wf_init:get_config(),

	SC = [
		{listen, {0,0,0,0}},
	  {port, Port},
	  {appmods, [{"/web", wf_yaws}]
	}],
	GC = [
		{logdir, "./logs"},
		{cache_refresh_secs, 0}
	],
	yaws:start_embedded(DocumentRoot, SC, GC),

	io:format("~n~n---~n"),
	io:format("Nitrogen is now running, using yaws:start_embedded().~n"),
	io:format("Open your browser to: http://localhost:8000~n"),
	io:format("---~n~n").