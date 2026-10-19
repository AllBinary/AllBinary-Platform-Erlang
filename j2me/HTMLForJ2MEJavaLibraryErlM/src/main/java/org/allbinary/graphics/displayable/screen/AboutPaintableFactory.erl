%
% AllBinary Open License Version 1
% Copyright (c) 2022 AllBinary
% 
% By agreeing to this license you and any business entity you represent are
% legally bound to the AllBinary Open License Version 1 legal agreement.
% 
% You may obtain the AllBinary Open License Version 1 legal agreement from
% AllBinary or the root directory of AllBinary's AllBinary Platform repository.
% 
% Created By: Travis Berthelot
% 
% Generated Code Do Not Modify
% package org.allbinary.graphics.displayable.screen
% import org.allbinary.game.paint.AboutPaintable
% import org.allbinary.graphics.paint.NullPaintable
% import org.allbinary.graphics.paint.Paintable
% import org.allbinary.logic.string.StringUtil

-module('AboutPaintableFactory').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'AboutPaintableFactory':new()),
    ok.

init_fields(This) ->
    put({This, paintableArray}, array:from_list(['NullPaintable':getInstance()])),
    ok.


getInstance() ->
        get({'AboutPaintableFactory', instance}).

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        INFO = array:from_list(["Built with the", "AllBinary Platform", get({'StringUtil':getInstance(), 'EMPTY_STRING'}), "Comments or Questions:", "support@allbinary.com"]),
        DEVELOPERS = array:from_list(["Developed By:", "Travis Berthelot"]),
        put({This, paintableArray}, (fun(Target_N65995) -> (get({Target_N65995, '$class'})):getPaintableArrayInstance(Target_N65995) end)('AboutPaintable':getInstance(INFO, DEVELOPERS))).

