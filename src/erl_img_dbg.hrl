
-ifdef(debug).
-define(dbg(Fmt,Args), io:format((Fmt),(Args))).
-else.
-define(dbg(Fmt,Args), true = is_list(Fmt) andalso is_list(Args)).
-endif.
