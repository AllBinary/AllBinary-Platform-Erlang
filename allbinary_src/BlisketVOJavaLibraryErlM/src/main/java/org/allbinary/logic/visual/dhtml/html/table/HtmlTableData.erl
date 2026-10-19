%
% AllBinary Open License Version 1
% Copyright (c) 2011 AllBinary
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
% package org.allbinary.logic.visual.dhtml.html.table
% import org.allbinary.string.CommonStrings

-module('HtmlTableData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'HtmlTableData':new()),
    ok.

init_fields(This) ->
    put({This, 'LEFT'}, get({'CommonStrings':getInstance(), 'LEFT'})),
    put({This, 'RIGHT'}, get({'CommonStrings':getInstance(), 'RIGHT'})),
    put({This, 'NONE'}, "none"),
    put({This, 'TOP'}, "top"),
    put({This, 'BOTTOM'}, "bottom"),
    put({This, 'TOPBOT'}, "topbot"),
    put({This, 'SIDES'}, "sides"),
    put({This, 'ALL'}, "all"),
    put({This, 'BORDERED'}, "border"),
    put({This, 'BASIC'}, "basic"),
    put({This, 'ROWS'}, "rows"),
    put({This, 'FRAMES'}, array:from_list([get({This, 'NONE'}), get({This, 'TOP'}), get({This, 'BOTTOM'}), get({This, 'TOPBOT'}), get({This, 'SIDES'}), get({This, 'ALL'}), get({This, 'BORDERED'})])),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This).


getInstance() ->
        get({'HtmlTableData', instance}).

