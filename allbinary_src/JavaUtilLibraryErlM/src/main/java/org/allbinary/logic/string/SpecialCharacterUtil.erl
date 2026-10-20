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
% package org.allbinary.logic.string
% import java.util.HashMap
% import org.allbinary.logic.StdUtil
% import org.allbinary.logic.io.path.AbPathData
% import org.allbinary.logic.math.MathData
% import org.allbinary.string.CommonPhoneStrings
% import org.allbinary.string.CommonSeps

-module('SpecialCharacterUtil').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


getHashMap() ->
        CommonSeps = 'CommonSeps':getInstance(),
        CommonPhoneStrings = 'CommonPhoneStrings':getInstance(),
        StringUtil = 'StringUtil':getInstance(),
        HashMap = (fun(Target_N65923) -> (get({Target_N65923, '$class'})):createHashMap(Target_N65923) end)('StdUtil':getInstance()),
        (get({HashMap, '$class'})):put(HashMap, "!", get({StringUtil, 'EMPTY_STRING'})),
        (get({HashMap, '$class'})):put(HashMap, "@", get({StringUtil, 'EMPTY_STRING'})),
        (get({HashMap, '$class'})):put(HashMap, get({CommonPhoneStrings, 'POUND'}), get({StringUtil, 'EMPTY_STRING'})),
        (get({HashMap, '$class'})):put(HashMap, "$", get({StringUtil, 'EMPTY_STRING'})),
        (get({HashMap, '$class'})):put(HashMap, "%", get({StringUtil, 'EMPTY_STRING'})),
        (get({HashMap, '$class'})):put(HashMap, "^", get({StringUtil, 'EMPTY_STRING'})),
        (get({HashMap, '$class'})):put(HashMap, get({CommonSeps, 'AMPERSAND'}), get({StringUtil, 'EMPTY_STRING'})),
        (get({HashMap, '$class'})):put(HashMap, get({CommonPhoneStrings, 'STAR'}), get({StringUtil, 'EMPTY_STRING'})),
        (get({HashMap, '$class'})):put(HashMap, get({CommonSeps, 'PARENTHESIS_OPEN'}), get({StringUtil, 'EMPTY_STRING'})),
        (get({HashMap, '$class'})):put(HashMap, get({CommonSeps, 'PARENTHESIS_CLOSE'}), get({StringUtil, 'EMPTY_STRING'})),
        (get({HashMap, '$class'})):put(HashMap, get({CommonSeps, 'DASH'}), get({StringUtil, 'EMPTY_STRING'})),
        (get({HashMap, '$class'})):put(HashMap, get({CommonSeps, 'UNDERSCORE'}), get({StringUtil, 'EMPTY_STRING'})),
        (get({HashMap, '$class'})):put(HashMap, get({'MathData':getInstance(), 'PLUS'}), get({StringUtil, 'EMPTY_STRING'})),
        (get({HashMap, '$class'})):put(HashMap, get({CommonSeps, 'EQUALS'}), get({StringUtil, 'EMPTY_STRING'})),
        (get({HashMap, '$class'})):put(HashMap, "\\", get({StringUtil, 'EMPTY_STRING'})),
        (get({HashMap, '$class'})):put(HashMap, "|", get({StringUtil, 'EMPTY_STRING'})),
        (get({HashMap, '$class'})):put(HashMap, get({'AbPathData':getInstance(), 'EXTENSION_SEP'}), get({StringUtil, 'EMPTY_STRING'})),
        (get({HashMap, '$class'})):put(HashMap, ",", get({StringUtil, 'EMPTY_STRING'})),
        (get({HashMap, '$class'})):put(HashMap, "<", get({StringUtil, 'EMPTY_STRING'})),
        (get({HashMap, '$class'})):put(HashMap, ">", get({StringUtil, 'EMPTY_STRING'})),
        (get({HashMap, '$class'})):put(HashMap, "?", get({StringUtil, 'EMPTY_STRING'})),
        (get({HashMap, '$class'})):put(HashMap, get({'AbPathData':getInstance(), 'SEPARATOR'}), get({StringUtil, 'EMPTY_STRING'})),
        (get({HashMap, '$class'})):put(HashMap, "~", get({StringUtil, 'EMPTY_STRING'})),
        (get({HashMap, '$class'})):put(HashMap, "`", get({StringUtil, 'EMPTY_STRING'})),
        HashMap.

