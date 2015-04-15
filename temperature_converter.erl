-module(temperature_converter).
-export([loop/0, convert_to_fahrenheit/1]).

loop() ->
	receive
		{true, T} ->
			Display = spawn(fun display:loop/0),
			Display ! {convert_to_celsius(T), float(T)},
			loop();
		{false, T} ->
			Display = spawn(fun display:loop/0),
			Display ! {float(T), convert_to_fahrenheit(T)},
			loop()
end.

% rough conversion of Fahrenheit to Celsius
convert_to_celsius(T) ->
	float((T - 32) * 5 / 9).

% rough conversion of Celsius to Fahrenheit 
convert_to_fahrenheit(T) ->
	float(T * 1.8 + 32).