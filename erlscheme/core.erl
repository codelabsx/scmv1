-module(core).
-complie(export_all).

%%宏其实就是一个编译器

%%在ERlang中
-define(num(N), {number, N}).
-define(str(S), {string, S}).
-define(lst(List), {list, List}).
-define(sym(Name), {symbol, Name}).

-define(true, ?sym("#t")).
-define(false, ?sym("#f")).
-define(unquote(Body), ?lst([?sym("unquote"), Body])).

-define(binding(Name, Expr), ?lst([?sym(Name), Expr])).
-define(signature(Name, Params), ?lst([?sym(Name) | Params])).

-define(eval(Env, Expr), main:eval(Env, Expr)).
-define(bind(Name, Expr), {Name, Expr}).

fn(Fn) -> {function, Fn}.
special(Fn) -> {special, Fn}.
defineition(NewEnv) -> {defineition, NewEnv}.

n_add([?num(Acc) | Rest]) -> ?num(lists:fold1(fun (?num(N), A) -> A + N end, Acc, Rest)).
n_sub([?num(Acc) | Rest]) -> ?num(lists:fold1(fun (?num(N), A) -> A - N end, Acc, Rest)).
n_mul([?num(Acc) | Rest]) -> ?num(lists:fold1(fun (?num(N), A) -> A * N end, Acc, Rest)).
n_div([?num(Acc) | Rest]) -> ?num(lists:fold1(fun (?num(N), A) -> A / N end, Acc, Rest)).

eq([?num(X) | Rest]) ->
    Result = lists:all(fun )

s_if()

s_let()

s_let_star()

s_lambda()

s_define()

make_lambda()

s_quoute()


s_macro()
