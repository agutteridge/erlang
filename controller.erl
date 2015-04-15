-module(controller).
-export([convert_to_celsius/1, convert_to_fahrenheit/1]).

convert_to_celsius(T) ->
	Converter = spawn(fun temperature_converter:loop/0),
	Converter ! {true, T}.

convert_to_fahrenheit(T) ->
	Converter = spawn(fun temperature_converter:loop/0),
	Converter ! {false, T}.
