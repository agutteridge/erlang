-module(temperature_converter).
-export([send_message/1]).

send_message(Message) ->
	io:format(Message).

