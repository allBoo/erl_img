%% -*- coding: utf-8 -*-
%%
%% Common Test suite for erl_img
%%
-module(erl_img_SUITE).
-compile(export_all).
-include_lib("common_test/include/ct.hrl").
-include_lib("eunit/include/eunit.hrl").
-include("erl_img.hrl").

init_per_suite(Config) ->
    % start the application under test
    {ok, _Started} = application:ensure_all_started(erl_img),
    Config.

end_per_suite(_Config) ->
    ok.

all() ->
    [
        scale_test
    ].

scale_test(Config) ->
    DataDir = ?config(data_dir, Config),
    Filename = filename:join(DataDir, "IMG_5745.JPG"),
    {ok, Image} = erl_img:load(Filename),
    % TODO: test fails, see CT logs for stack trace
    Thumbnail = erl_img:scale(Image, 0.46875),
    ?assertEqual(240, Thumbnail#erl_image.width),
    ?assertEqual(180, Thumbnail#erl_image.height),
    % TODO: this also fails
    Biggered = erl_img:scale(Image, 2.0),
    ?assertEqual(768, Biggered#erl_image.width),
    ?assertEqual(1024, Biggered#erl_image.height),
    ok.
