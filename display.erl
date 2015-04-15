-module(display).
-export([loop/0]).

loop() ->
	receive
		{C, F} ->
			io:format(float_to_list(C, [{decimals, 1}]) ++ "\'C\n" ++ float_to_list(F, [{decimals, 1}]) ++ "\'F\n"),
			loop()
end.