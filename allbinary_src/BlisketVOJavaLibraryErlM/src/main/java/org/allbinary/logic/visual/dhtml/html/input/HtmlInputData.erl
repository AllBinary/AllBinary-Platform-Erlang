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
% package org.allbinary.logic.visual.dhtml.html.input

-module('HtmlInputData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, instance}, 'HtmlInputData':new()),
    ok.

init_fields(This) ->
    put({This, 'TEXT'}, "text"),
    put({This, 'RADIO'}, "radio"),
    put({This, 'CHECKBOX'}, "checkbox"),
    put({This, 'HIDDEN'}, "hidden"),
    put({This, 'IMAGE'}, "image"),
    put({This, 'PASSWORD'}, "password"),
    put({This, 'RESET'}, "reset"),
    put({This, 'SUBMIT'}, "submit"),
    put({This, 'TYPES'}, array:from_list([get({This, 'TEXT'}), get({This, 'RADIO'}), get({This, 'CHECKBOX'}), get({This, 'HIDDEN'}), get({This, 'IMAGE'}), get({This, 'PASSWORD'}), get({This, 'RADIO'}), get({This, 'RESET'}), get({This, 'SUBMIT'})])),
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getInstance() ->
        get({'HtmlInputData', instance}).

