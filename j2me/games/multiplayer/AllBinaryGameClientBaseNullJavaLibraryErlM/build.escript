#!/usr/bin/env escript
%%
%% Compiles the generated Erlang sources into .beam files.
%% Usage: escript build.escript SourceDir OutputDir FailOnError
%%
%% The generated module names are the Java class names without the package so all .beam files go in one ebin directory.

main([SourceDir, OutputDir, FailOnError]) ->
    ok = filelib:ensure_dir(filename:join(OutputDir, "ebin")),
    Sources = lists:sort(filelib:wildcard(filename:join(SourceDir, "**/*.erl"))),
    Options = [{outdir, OutputDir}, debug_info, report_errors, report_warnings, return_errors],
    Failures = [Source || Source <- Sources, not compiled(compile:file(Source, Options))],
    io:format("Erlang modules compiled: ~p of ~p~n", [length(Sources) - length(Failures), length(Sources)]),
    report(Failures, FailOnError);
main(_) ->
    io:format(standard_error, "Usage: escript build.escript SourceDir OutputDir FailOnError~n", []),
    halt(2).

compiled({ok, _Module}) -> true;
compiled({ok, _Module, _Warnings}) -> true;
compiled(_) -> false.

report([], _FailOnError) ->
    halt(0);
report(Failures, FailOnError) ->
    io:format(standard_error, "Erlang build failures: ~p~n", [length(Failures)]),
    [io:format(standard_error, "  ~s~n", [Failure]) || Failure <- Failures],
    case FailOnError of
        "true" -> halt(1);
        _ -> halt(0)
    end.
